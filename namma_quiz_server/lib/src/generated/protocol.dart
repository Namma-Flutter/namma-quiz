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
import 'package:namma_kahoot_server/src/generated/kahoot/player.dart'
    as _irte7cmr;
import 'package:namma_kahoot_server/src/generated/kahoot/question.dart'
    as _iih33dk0;
import 'package:namma_kahoot_server/src/generated/kahoot/quiz.dart'
    as _iiv8jun1;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
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

class Protocol extends _is.DatabaseSerializationManager
    implements _is.DatabaseProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _is.ProtocolDeserialization get deserializationMetadata =>
      _is.ProtocolDeserialization.cached(
        this,
        types: const [
          _is.getType<_id6llbty.GameEvent>,
          _is.getType<_iaqji94d.GameSession>,
          _is.getType<_iixj3f9r.HostSession>,
          _is.getType<_i3hvan68.JoinResult>,
          _is.getType<_ivk98tqa.Player>,
          _is.getType<_ix1hu9i6.Question>,
          _is.getType<_isre1cxb.Quiz>,
          _is.getType<_id6llbty.GameEvent?>,
          _is.getType<_iaqji94d.GameSession?>,
          _is.getType<_iixj3f9r.HostSession?>,
          _is.getType<_i3hvan68.JoinResult?>,
          _is.getType<_ivk98tqa.Player?>,
          _is.getType<_ix1hu9i6.Question?>,
          _is.getType<_isre1cxb.Quiz?>,
          _is.getType<List<String>>,
          _is.getType<List<_iiv8jun1.Quiz>>,
          _is.getType<List<_iih33dk0.Question>>,
          _is.getType<List<_irte7cmr.Player>>,
        ],
        modules: const [
          _iais.Protocol.new,
          _iacs.Protocol.new,
          _isp.Protocol.new,
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

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    ..._ownTableDefinitions,
    ..._iais.Protocol().getOwnTableDefinitions(),
    ..._iacs.Protocol().getOwnTableDefinitions(),
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static List<_isp.TableDefinition> get _ownTableDefinitions => [
    _isp.TableDefinition(
      name: 'game_sessions',
      dartName: 'GameSession',
      schema: 'public',
      module: 'namma_kahoot',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'pin',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'quizId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'hostId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'currentQuestionIndex',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'startTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'hostTokenHash',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'game_session_pin_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'pin',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'players',
      dartName: 'Player',
      schema: 'public',
      module: 'namma_kahoot',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'gameSessionId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'score',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'connected\'',
        ),
        _isp.ColumnDefinition(
          name: 'answersJson',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'tokenHash',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'player_game_session_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'gameSessionId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'questions',
      dartName: 'Question',
      schema: 'public',
      module: 'namma_kahoot',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'quizId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'text',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'options',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _isp.ColumnDefinition(
          name: 'correctOptionIndex',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'timeLimitSeconds',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'orderIndex',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'question_quiz_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'quizId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'quizzes',
      dartName: 'Quiz',
      schema: 'public',
      module: 'namma_kahoot',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'creatorId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'quiz_creator_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'creatorId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
  ];

  static String? getClassNameFromObjectJson(dynamic data) =>
      _is.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _is.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _is.getType<_id6llbty.GameEvent?>()) {
      return (data != null ? _id6llbty.GameEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iaqji94d.GameSession?>()) {
      return (data != null ? _iaqji94d.GameSession.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iixj3f9r.HostSession?>()) {
      return (data != null ? _iixj3f9r.HostSession.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i3hvan68.JoinResult?>()) {
      return (data != null ? _i3hvan68.JoinResult.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ivk98tqa.Player?>()) {
      return (data != null ? _ivk98tqa.Player.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ix1hu9i6.Question?>()) {
      return (data != null ? _ix1hu9i6.Question.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_isre1cxb.Quiz?>()) {
      return (data != null ? _isre1cxb.Quiz.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_iiv8jun1.Quiz>) {
      return (data as List).map((e) => deserialize<_iiv8jun1.Quiz>(e)).toList()
          as T;
    }
    if (t == List<_iih33dk0.Question>) {
      return (data as List)
              .map((e) => deserialize<_iih33dk0.Question>(e))
              .toList()
          as T;
    }
    if (t == List<_irte7cmr.Player>) {
      return (data as List)
              .map((e) => deserialize<_irte7cmr.Player>(e))
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
      } on _is.DeserializationTypeNotFoundException catch (_) {}
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
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
      return _iais.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacs.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    if (dataClassName.startsWith('serverpod.')) {
      return _isp.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(10),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('namma_kahoot', this);
    _iacs.Protocol().registerHostProtocol('namma_kahoot', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _iaqji94d.GameSession:
        return _iaqji94d.GameSession.t;
      case _ivk98tqa.Player:
        return _ivk98tqa.Player.t;
      case _ix1hu9i6.Question:
        return _ix1hu9i6.Question.t;
      case _isre1cxb.Quiz:
        return _isre1cxb.Quiz.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  List<_isp.TableDefinition> getOwnTableDefinitions() => _ownTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
