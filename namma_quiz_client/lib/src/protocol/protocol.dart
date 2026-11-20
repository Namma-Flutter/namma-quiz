/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:namma_kahoot_client/src/protocol/kahoot/player.dart'
    as _iowcd9iw;
import 'package:namma_kahoot_client/src/protocol/kahoot/question.dart'
    as _imhbbxog;
import 'package:namma_kahoot_client/src/protocol/kahoot/quiz.dart' as _ibf9eeue;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'kahoot/game_event.dart' as _id6llbty;
import 'kahoot/game_session.dart' as _iaqji94d;
import 'kahoot/host_session.dart' as _iixj3f9r;
import 'kahoot/join_result.dart' as _i3hvan68;
import 'kahoot/player.dart' as _ivk98tqa;
import 'kahoot/question.dart' as _ix1hu9i6;
import 'kahoot/quiz.dart' as _isre1cxb;
export 'kahoot/game_event.dart';
export 'kahoot/game_session.dart';
export 'kahoot/host_session.dart';
export 'kahoot/join_result.dart';
export 'kahoot/player.dart';
export 'kahoot/question.dart';
export 'kahoot/quiz.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager
    implements _isc.ProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _isc.ProtocolDeserialization get deserializationMetadata =>
      _isc.ProtocolDeserialization.cached(
        this,
        types: const [
          _isc.getType<_id6llbty.GameEvent>,
          _isc.getType<_iaqji94d.GameSession>,
          _isc.getType<_iixj3f9r.HostSession>,
          _isc.getType<_i3hvan68.JoinResult>,
          _isc.getType<_ivk98tqa.Player>,
          _isc.getType<_ix1hu9i6.Question>,
          _isc.getType<_isre1cxb.Quiz>,
          _isc.getType<_id6llbty.GameEvent?>,
          _isc.getType<_iaqji94d.GameSession?>,
          _isc.getType<_iixj3f9r.HostSession?>,
          _isc.getType<_i3hvan68.JoinResult?>,
          _isc.getType<_ivk98tqa.Player?>,
          _isc.getType<_ix1hu9i6.Question?>,
          _isc.getType<_isre1cxb.Quiz?>,
          _isc.getType<List<String>>,
          _isc.getType<List<_ibf9eeue.Quiz>>,
          _isc.getType<List<_imhbbxog.Question>>,
          _isc.getType<List<_iowcd9iw.Player>>,
        ],
        modules: const [
          _iaic.Protocol.new,
          _iacc.Protocol.new,
        ],
        classNames: const [
          'GameEvent',
          'GameSession',
          'HostSession',
          'JoinResult',
          'Player',
          'Question',
          'Quiz',
        ],
      );

  static String? getClassNameFromObjectJson(dynamic data) =>
      _isc.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _isc.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _id6llbty.GameEvent) {
      return _id6llbty.GameEvent.fromJson(data) as T;
    }
    if (t == _iaqji94d.GameSession) {
      return _iaqji94d.GameSession.fromJson(data) as T;
    }
    if (t == _iixj3f9r.HostSession) {
      return _iixj3f9r.HostSession.fromJson(data) as T;
    }
    if (t == _i3hvan68.JoinResult) {
      return _i3hvan68.JoinResult.fromJson(data) as T;
    }
    if (t == _ivk98tqa.Player) {
      return _ivk98tqa.Player.fromJson(data) as T;
    }
    if (t == _ix1hu9i6.Question) {
      return _ix1hu9i6.Question.fromJson(data) as T;
    }
    if (t == _isre1cxb.Quiz) {
      return _isre1cxb.Quiz.fromJson(data) as T;
    }
    if (t == _isc.getType<_id6llbty.GameEvent?>()) {
      return (data != null ? _id6llbty.GameEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iaqji94d.GameSession?>()) {
      return (data != null ? _iaqji94d.GameSession.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iixj3f9r.HostSession?>()) {
      return (data != null ? _iixj3f9r.HostSession.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i3hvan68.JoinResult?>()) {
      return (data != null ? _i3hvan68.JoinResult.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ivk98tqa.Player?>()) {
      return (data != null ? _ivk98tqa.Player.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ix1hu9i6.Question?>()) {
      return (data != null ? _ix1hu9i6.Question.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_isre1cxb.Quiz?>()) {
      return (data != null ? _isre1cxb.Quiz.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ibf9eeue.Quiz>) {
      return (data as List).map((e) => deserialize<_ibf9eeue.Quiz>(e)).toList()
          as T;
    }
    if (t == List<_imhbbxog.Question>) {
      return (data as List)
              .map((e) => deserialize<_imhbbxog.Question>(e))
              .toList()
          as T;
    }
    if (t == List<_iowcd9iw.Player>) {
      return (data as List)
              .map((e) => deserialize<_iowcd9iw.Player>(e))
              .toList()
          as T;
    }
    final modules = deserializationMetadata.modulesForDeserialization(
      t,
      className: rawDataClassName,
    );
    for (final module in modules) {
      try {
        return module.deserialize<T>(data, t);
      } on _isc.DeserializationTypeNotFoundException catch (_) {}
    }

    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _id6llbty.GameEvent => 'GameEvent',
      _iaqji94d.GameSession => 'GameSession',
      _iixj3f9r.HostSession => 'HostSession',
      _i3hvan68.JoinResult => 'JoinResult',
      _ivk98tqa.Player => 'Player',
      _ix1hu9i6.Question => 'Question',
      _isre1cxb.Quiz => 'Quiz',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'namma_kahoot.',
        '',
      );
    }

    switch (data) {
      case _id6llbty.GameEvent():
        return 'GameEvent';
      case _iaqji94d.GameSession():
        return 'GameSession';
      case _iixj3f9r.HostSession():
        return 'HostSession';
      case _i3hvan68.JoinResult():
        return 'JoinResult';
      case _ivk98tqa.Player():
        return 'Player';
      case _ix1hu9i6.Question():
        return 'Question';
      case _isre1cxb.Quiz():
        return 'Quiz';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'GameEvent') {
      return deserialize<_id6llbty.GameEvent>(data['data']);
    }
    if (dataClassName == 'GameSession') {
      return deserialize<_iaqji94d.GameSession>(data['data']);
    }
    if (dataClassName == 'HostSession') {
      return deserialize<_iixj3f9r.HostSession>(data['data']);
    }
    if (dataClassName == 'JoinResult') {
      return deserialize<_i3hvan68.JoinResult>(data['data']);
    }
    if (dataClassName == 'Player') {
      return deserialize<_ivk98tqa.Player>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_ix1hu9i6.Question>(data['data']);
    }
    if (dataClassName == 'Quiz') {
      return deserialize<_isre1cxb.Quiz>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      return _iaic.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacc.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('namma_kahoot', this);
    _iacc.Protocol().registerHostProtocol('namma_kahoot', this);
  }

  @override
  String getModuleName() => 'namma_kahoot';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
