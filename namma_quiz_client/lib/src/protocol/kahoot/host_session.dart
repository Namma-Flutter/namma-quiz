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

abstract class HostSession
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  HostSession._({
    required this.pin,
    required this.quizId,
    required this.hostId,
    required this.status,
    required this.currentQuestionIndex,
    this.startTime,
    required this.hostToken,
  });

  factory HostSession({
    required String pin,
    required int quizId,
    required int hostId,
    required String status,
    required int currentQuestionIndex,
    DateTime? startTime,
    required String hostToken,
  }) = _HostSessionImpl;

  factory HostSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return HostSession(
      pin: jsonSerialization['pin'] as String,
      quizId: jsonSerialization['quizId'] as int,
      hostId: jsonSerialization['hostId'] as int,
      status: jsonSerialization['status'] as String,
      currentQuestionIndex: jsonSerialization['currentQuestionIndex'] as int,
      startTime: jsonSerialization['startTime'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['startTime']),
      hostToken: jsonSerialization['hostToken'] as String,
    );
  }

  String pin;

  int quizId;

  int hostId;

  String status;

  int currentQuestionIndex;

  DateTime? startTime;

  String hostToken;

  /// Returns a shallow copy of this [HostSession]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  HostSession copyWith({
    String? pin,
    int? quizId,
    int? hostId,
    String? status,
    int? currentQuestionIndex,
    DateTime? startTime = const _isc.$UndefinedDateTime(),
    String? hostToken,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HostSession',
      'pin': pin,
      'quizId': quizId,
      'hostId': hostId,
      'status': status,
      'currentQuestionIndex': currentQuestionIndex,
      if (startTime != null) 'startTime': startTime?.toJson(),
      'hostToken': hostToken,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HostSession',
      'pin': pin,
      'quizId': quizId,
      'hostId': hostId,
      'status': status,
      'currentQuestionIndex': currentQuestionIndex,
      if (startTime != null) 'startTime': startTime?.toJson(),
      'hostToken': hostToken,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _HostSessionImpl extends HostSession {
  _HostSessionImpl({
    required String pin,
    required int quizId,
    required int hostId,
    required String status,
    required int currentQuestionIndex,
    DateTime? startTime,
    required String hostToken,
  }) : super._(
         pin: pin,
         quizId: quizId,
         hostId: hostId,
         status: status,
         currentQuestionIndex: currentQuestionIndex,
         startTime: startTime,
         hostToken: hostToken,
       );

  /// Returns a shallow copy of this [HostSession]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  HostSession copyWith({
    String? pin,
    int? quizId,
    int? hostId,
    String? status,
    int? currentQuestionIndex,
    DateTime? startTime = const _isc.$UndefinedDateTime(),
    String? hostToken,
  }) {
    return HostSession(
      pin: pin ?? this.pin,
      quizId: quizId ?? this.quizId,
      hostId: hostId ?? this.hostId,
      status: status ?? this.status,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      startTime: startTime is _isc.UndefinedSentinel
          ? this.startTime
          : startTime,
      hostToken: hostToken ?? this.hostToken,
    );
  }
}
