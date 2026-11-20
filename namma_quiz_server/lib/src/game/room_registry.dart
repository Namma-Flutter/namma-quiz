import 'dart:async';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// How long a disconnected player stays visible before being hidden from the
/// host. Keeps short network blips from flickering the player grid.
const hideDelay = Duration(milliseconds: 1500);

/// Grace period for a player that disconnects while the room is in the lobby.
/// If they do not return within this window the player row is removed.
const lobbyGracePeriod = Duration(seconds: 5);

/// Grace period for a player that disconnects while a question is running.
/// After this window the player is marked as away but kept in the room.
const questionGracePeriod = Duration(seconds: 12);

/// How long the host may stay disconnected before the room is closed.
const hostGracePeriod = Duration(seconds: 120);

/// A single live connection (one `gameStream` subscription).
///
/// The outbound controller lets the server push a targeted event (for example
/// `KICKED`) and then close the stream without waiting for the client.
class ConnectionHandle {
  ConnectionHandle(this.connectionId);

  final UuidValue connectionId;
  final StreamController<GameEvent> out = StreamController<GameEvent>();

  bool disconnectHandled = false;

  bool get isClosed => out.isClosed;

  void send(GameEvent event) {
    if (!out.isClosed) out.add(event);
  }

  Future<void> close() async {
    if (!out.isClosed) {
      unawaited(out.close());
    }
  }
}

/// In-memory presence for a single player inside a room.
class PlayerPresence {
  PlayerPresence(this.playerId);

  final int playerId;

  ConnectionHandle? handle;
  bool connected = false;

  Timer? hideTimer;
  Timer? graceTimer;

  void cancelTimers() {
    hideTimer?.cancel();
    hideTimer = null;
    graceTimer?.cancel();
    graceTimer = null;
  }
}

/// In-memory presence for the host of a room.
class HostPresence {
  ConnectionHandle? handle;
  Timer? graceTimer;

  void cancelTimer() {
    graceTimer?.cancel();
    graceTimer = null;
  }
}

/// Mutable runtime state for one game room.
///
/// Durable game state lives in the database. This object only tracks live
/// sockets, pending grace timers and the ban list for the lifetime of the room.
class RoomRuntime {
  RoomRuntime(this.pin);

  final String pin;

  final Map<int, PlayerPresence> players = {};
  final HostPresence host = HostPresence();

  /// Token hashes of kicked players. A kicked player cannot resume with the
  /// same token for the rest of the room's lifetime.
  final Set<String> bannedTokenHashes = {};

  Timer? cleanupTimer;
  bool ended = false;

  PlayerPresence presenceFor(int playerId) =>
      players.putIfAbsent(playerId, () => PlayerPresence(playerId));

  void cancelTimers() {
    cleanupTimer?.cancel();
    cleanupTimer = null;
    host.cancelTimer();
    for (final presence in players.values) {
      presence.cancelTimers();
    }
  }

  Future<void> dispose() async {
    ended = true;
    cancelTimers();
    for (final presence in players.values) {
      await presence.handle?.close();
    }
    await host.handle?.close();
    players.clear();
  }
}

/// Process-wide registry of live rooms.
class RoomRegistry {
  RoomRegistry._();

  static final RoomRegistry instance = RoomRegistry._();

  final Map<String, RoomRuntime> _rooms = {};

  RoomRuntime room(String pin) =>
      _rooms.putIfAbsent(pin, () => RoomRuntime(pin));

  RoomRuntime? existing(String pin) => _rooms[pin];

  Future<void> remove(String pin) async {
    final runtime = _rooms.remove(pin);
    await runtime?.dispose();
  }

  List<RoomRuntime> get rooms => _rooms.values.toList(growable: false);
}
