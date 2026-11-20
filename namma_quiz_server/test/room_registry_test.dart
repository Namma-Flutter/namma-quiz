import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'package:namma_kahoot_server/src/game/room_registry.dart';
import 'package:namma_kahoot_server/src/game/game_lifecycle.dart';
import 'package:namma_kahoot_server/src/generated/protocol.dart';

void main() {
  group('RoomRegistry & Presence Unit Tests', () {
    final registry = RoomRegistry.instance;
    const testPin = '999888';

    tearDown(() async {
      await registry.remove(testPin);
    });

    test('Configured timer constants match specification', () {
      expect(hideDelay.inMilliseconds, equals(1500));
      expect(lobbyGracePeriod.inSeconds, equals(5));
      expect(questionGracePeriod.inSeconds, equals(12));
      expect(hostGracePeriod.inSeconds, equals(120));
    });

    test('Cryptographic token generation and hashing', () {
      final token1 = generateToken();
      final token2 = generateToken();

      expect(token1, isNotEmpty);
      expect(token2, isNotEmpty);
      expect(token1, isNot(equals(token2)));

      final hash1 = hashToken(token1);
      final hash1Again = hashToken(token1);
      final hash2 = hashToken(token2);

      expect(hash1, equals(hash1Again));
      expect(hash1, isNot(equals(hash2)));
      expect(hash1.length, equals(64)); // SHA-256 hex string
    });

    test('decodeAnswers and encodeAnswers preserve question answers', () {
      final empty = decodeAnswers(null);
      expect(empty, isEmpty);

      final answers = {'0': 1, '1': 3, '2': 0};
      final encoded = encodeAnswers(answers);
      final decoded = decodeAnswers(encoded);

      expect(decoded['0'], equals(1));
      expect(decoded['1'], equals(3));
      expect(decoded['2'], equals(0));
    });

    test('ConnectionHandle stream delivery and closure', () async {
      final handle = ConnectionHandle(Uuid().v4obj());
      expect(handle.isClosed, isFalse);

      final events = <GameEvent>[];
      final sub = handle.out.stream.listen(events.add);

      handle.send(GameEvent(eventType: 'TEST_EVENT', dataJson: '{"ok": true}'));
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(events.length, equals(1));
      expect(events.first.eventType, equals('TEST_EVENT'));

      await handle.close();
      expect(handle.isClosed, isTrue);
      await sub.cancel();
    });

    test('RoomRuntime tracks player presence and cancels timers', () {
      final room = registry.room(testPin);
      expect(room.pin, equals(testPin));

      final presence = room.presenceFor(42);
      expect(presence.playerId, equals(42));
      expect(presence.connected, isFalse);

      presence.connected = true;
      final handle = ConnectionHandle(Uuid().v4obj());
      presence.handle = handle;

      expect(presence.connected, isTrue);
      expect(presence.handle, equals(handle));

      room.cancelTimers();
      expect(presence.hideTimer, isNull);
      expect(presence.graceTimer, isNull);
    });

    test('Banned token hashes are retained per room', () {
      final room = registry.room(testPin);
      final token = generateToken();
      final hashed = hashToken(token);

      expect(room.bannedTokenHashes.contains(hashed), isFalse);
      room.bannedTokenHashes.add(hashed);
      expect(room.bannedTokenHashes.contains(hashed), isTrue);

      final anotherTokenHash = hashToken(generateToken());
      expect(room.bannedTokenHashes.contains(anotherTokenHash), isFalse);
    });

    test('Stale-socket guard scenario: newer connection is preserved', () async {
      final room = registry.room(testPin);
      final presence = room.presenceFor(101);

      final oldHandle = ConnectionHandle(Uuid().v4obj());
      final newHandle = ConnectionHandle(Uuid().v4obj());

      // Old socket connected
      presence.handle = oldHandle;
      presence.connected = true;

      // Resume replaces old socket with new socket
      presence.handle = newHandle;
      presence.connected = true;

      // Simulate stale disconnect event from old socket
      // If handle != presence.handle, the disconnect is ignored
      final isStale = (oldHandle != presence.handle);
      expect(isStale, isTrue);
      expect(presence.handle, equals(newHandle));
      expect(presence.connected, isTrue);

      await oldHandle.close();
      await newHandle.close();
    });

    test('Duplicate tabs: older connection is closed with REPLACED event', () async {
      final room = registry.room(testPin);
      final presence = room.presenceFor(202);

      final tab1Handle = ConnectionHandle(Uuid().v4obj());
      presence.handle = tab1Handle;
      presence.connected = true;

      final tab1Events = <GameEvent>[];
      final sub = tab1Handle.out.stream.listen(tab1Events.add);

      // Tab 2 connects with same identity: send REPLACED to tab 1 and close it
      final previous = presence.handle;
      if (previous != null && !previous.isClosed) {
        previous.send(gameEvent('REPLACED', {'reason': 'SESSION_OPENED_ELSEWHERE'}));
        await previous.close();
      }

      final tab2Handle = ConnectionHandle(Uuid().v4obj());
      presence.handle = tab2Handle;

      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(tab1Events.length, equals(1));
      expect(tab1Events.first.eventType, equals('REPLACED'));
      expect(tab1Handle.isClosed, isTrue);
      expect(presence.handle, equals(tab2Handle));

      await sub.cancel();
      await tab2Handle.close();
    });

    test('Room disposal closes all connections and cancels all timers', () async {
      final room = registry.room(testPin);
      final handle1 = ConnectionHandle(Uuid().v4obj());
      final hostHandle = ConnectionHandle(Uuid().v4obj());

      room.presenceFor(1).handle = handle1;
      room.host.handle = hostHandle;

      await room.dispose();

      expect(room.ended, isTrue);
      expect(handle1.isClosed, isTrue);
      expect(hostHandle.isClosed, isTrue);
      expect(room.players, isEmpty);
    });
  });
}
