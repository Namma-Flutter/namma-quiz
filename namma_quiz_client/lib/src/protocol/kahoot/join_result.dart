/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class JoinResult
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  JoinResult._({
    required this.playerId,
    required this.gameSessionId,
    required this.name,
    required this.score,
    required this.token,
  });

  factory JoinResult({
    required int playerId,
    required int gameSessionId,
    required String name,
    required int score,
    required String token,
  }) = _JoinResultImpl;

  factory JoinResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return JoinResult(
      playerId: jsonSerialization['playerId'] as int,
      gameSessionId: jsonSerialization['gameSessionId'] as int,
      name: jsonSerialization['name'] as String,
      score: jsonSerialization['score'] as int,
      token: jsonSerialization['token'] as String,
    );
  }

  int playerId;

  int gameSessionId;

  String name;

  int score;

  String token;

  /// Returns a shallow copy of this [JoinResult]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  JoinResult copyWith({
    int? playerId,
    int? gameSessionId,
    String? name,
    int? score,
    String? token,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'JoinResult',
      'playerId': playerId,
      'gameSessionId': gameSessionId,
      'name': name,
      'score': score,
      'token': token,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'JoinResult',
      'playerId': playerId,
      'gameSessionId': gameSessionId,
      'name': name,
      'score': score,
      'token': token,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _JoinResultImpl extends JoinResult {
  _JoinResultImpl({
    required int playerId,
    required int gameSessionId,
    required String name,
    required int score,
    required String token,
  }) : super._(
         playerId: playerId,
         gameSessionId: gameSessionId,
         name: name,
         score: score,
         token: token,
       );

  /// Returns a shallow copy of this [JoinResult]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  JoinResult copyWith({
    int? playerId,
    int? gameSessionId,
    String? name,
    int? score,
    String? token,
  }) {
    return JoinResult(
      playerId: playerId ?? this.playerId,
      gameSessionId: gameSessionId ?? this.gameSessionId,
      name: name ?? this.name,
      score: score ?? this.score,
      token: token ?? this.token,
    );
  }
}
