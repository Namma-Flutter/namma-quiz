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
import 'dart:async' as _ida;
import 'package:serverpod/serverpod.dart' as _is;

abstract class GameSession
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  GameSession._({
    this.id,
    required this.pin,
    required this.quizId,
    required this.hostId,
    required this.status,
    required this.currentQuestionIndex,
    this.startTime,
    this.hostTokenHash,
  });

  factory GameSession({
    int? id,
    required String pin,
    required int quizId,
    required int hostId,
    required String status,
    required int currentQuestionIndex,
    DateTime? startTime,
    String? hostTokenHash,
  }) = _GameSessionImpl;

  factory GameSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameSession(
      id: jsonSerialization['id'] as int?,
      pin: jsonSerialization['pin'] as String,
      quizId: jsonSerialization['quizId'] as int,
      hostId: jsonSerialization['hostId'] as int,
      status: jsonSerialization['status'] as String,
      currentQuestionIndex: jsonSerialization['currentQuestionIndex'] as int,
      startTime: jsonSerialization['startTime'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['startTime']),
      hostTokenHash: jsonSerialization['hostTokenHash'] as String?,
    );
  }

  static final t = GameSessionTable();

  static const db = GameSessionRepository._();

  @override
  int? id;

  String pin;

  int quizId;

  int hostId;

  String status;

  int currentQuestionIndex;

  DateTime? startTime;

  String? hostTokenHash;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [GameSession]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  GameSession copyWith({
    int? id,
    String? pin,
    int? quizId,
    int? hostId,
    String? status,
    int? currentQuestionIndex,
    DateTime? startTime = const _is.$UndefinedDateTime(),
    String? hostTokenHash,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GameSession',
      if (id != null) 'id': id,
      'pin': pin,
      'quizId': quizId,
      'hostId': hostId,
      'status': status,
      'currentQuestionIndex': currentQuestionIndex,
      if (startTime != null) 'startTime': startTime?.toJson(),
      if (hostTokenHash != null) 'hostTokenHash': hostTokenHash,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GameSession',
      if (id != null) 'id': id,
      'pin': pin,
      'quizId': quizId,
      'hostId': hostId,
      'status': status,
      'currentQuestionIndex': currentQuestionIndex,
      if (startTime != null) 'startTime': startTime?.toJson(),
    };
  }

  static GameSessionInclude include() {
    return GameSessionInclude._();
  }

  static GameSessionIncludeList includeList({
    _is.WhereExpressionBuilder<GameSessionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    GameSessionInclude? include,
  }) {
    return GameSessionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameSessionImpl extends GameSession {
  _GameSessionImpl({
    int? id,
    required String pin,
    required int quizId,
    required int hostId,
    required String status,
    required int currentQuestionIndex,
    DateTime? startTime,
    String? hostTokenHash,
  }) : super._(
         id: id,
         pin: pin,
         quizId: quizId,
         hostId: hostId,
         status: status,
         currentQuestionIndex: currentQuestionIndex,
         startTime: startTime,
         hostTokenHash: hostTokenHash,
       );

  /// Returns a shallow copy of this [GameSession]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  GameSession copyWith({
    Object? id = _Undefined,
    String? pin,
    int? quizId,
    int? hostId,
    String? status,
    int? currentQuestionIndex,
    DateTime? startTime = const _is.$UndefinedDateTime(),
    Object? hostTokenHash = _Undefined,
  }) {
    return GameSession(
      id: id is int? ? id : this.id,
      pin: pin ?? this.pin,
      quizId: quizId ?? this.quizId,
      hostId: hostId ?? this.hostId,
      status: status ?? this.status,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      startTime: startTime is _is.UndefinedSentinel
          ? this.startTime
          : startTime,
      hostTokenHash: hostTokenHash is String?
          ? hostTokenHash
          : this.hostTokenHash,
    );
  }
}

class GameSessionUpdateTable extends _is.UpdateTable<GameSessionTable> {
  GameSessionUpdateTable(super.table);

  _is.ColumnValue<String, String> pin(String value) => _is.ColumnValue(
    table.pin,
    value,
  );

  _is.ColumnValue<int, int> quizId(int value) => _is.ColumnValue(
    table.quizId,
    value,
  );

  _is.ColumnValue<int, int> hostId(int value) => _is.ColumnValue(
    table.hostId,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<int, int> currentQuestionIndex(int value) => _is.ColumnValue(
    table.currentQuestionIndex,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> startTime(DateTime? value) =>
      _is.ColumnValue(
        table.startTime,
        value,
      );

  _is.ColumnValue<String, String> hostTokenHash(String? value) =>
      _is.ColumnValue(
        table.hostTokenHash,
        value,
      );
}

class GameSessionTable extends _is.Table<int?> {
  GameSessionTable({super.tableRelation}) : super(tableName: 'game_sessions') {
    updateTable = GameSessionUpdateTable(this);
    pin = _is.ColumnString(
      'pin',
      this,
    );
    quizId = _is.ColumnInt(
      'quizId',
      this,
    );
    hostId = _is.ColumnInt(
      'hostId',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    currentQuestionIndex = _is.ColumnInt(
      'currentQuestionIndex',
      this,
    );
    startTime = _is.ColumnDateTime(
      'startTime',
      this,
    );
    hostTokenHash = _is.ColumnString(
      'hostTokenHash',
      this,
    );
  }

  late final GameSessionUpdateTable updateTable;

  late final _is.ColumnString pin;

  late final _is.ColumnInt quizId;

  late final _is.ColumnInt hostId;

  late final _is.ColumnString status;

  late final _is.ColumnInt currentQuestionIndex;

  late final _is.ColumnDateTime startTime;

  late final _is.ColumnString hostTokenHash;

  @override
  List<_is.Column> get columns => [
    id,
    pin,
    quizId,
    hostId,
    status,
    currentQuestionIndex,
    startTime,
    hostTokenHash,
  ];
}

class GameSessionInclude extends _is.IncludeObject {
  GameSessionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => GameSession.t;
}

class GameSessionIncludeList extends _is.IncludeList {
  GameSessionIncludeList._({
    _is.WhereExpressionBuilder<GameSessionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GameSession.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => GameSession.t;
}

class GameSessionRepository {
  const GameSessionRepository._();

  /// Returns a list of [GameSession]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<GameSession>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<GameSessionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<GameSession>(
      where: where?.call(GameSession.t),
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [GameSession]s matching the given query parameters every time the
  /// source tables are modified.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// Use [throttle] to specify the minimum interval between queries. It can
  /// also be set to `null`, in which case the stream will only be throttled
  /// when its subscription is paused.
  ///
  /// Source tables are collected from the queried table, [where], [orderBy],
  /// [orderByList], and the [include] graph. [alsoTriggerOnTables] is added
  /// to that set. Pass [Table] instances such as `GameSession.t`.
  ///
  /// Raw [Expression] SQL is not inspected. Tables referenced only in raw
  /// SQL must be passed via [alsoTriggerOnTables].
  ///
  /// The stream always reads committed state and never joins an ambient
  /// [Transaction]. Emissions for a write fire after that write commits.
  ///
  /// Currently only supported on SQLite. Calling this method on PostgreSQL
  /// throws an [UnsupportedError].
  ///
  /// ```dart
  /// var subscription = Persons.db.watch(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// ).listen((persons) {
  ///   // Handle the latest matching rows.
  /// });
  /// ```
  _ida.Stream<List<GameSession>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<GameSessionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<GameSession>(
      where: where?.call(GameSession.t),
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [GameSession] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<GameSession?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<GameSessionTable>? where,
    int? offset,
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<GameSession>(
      where: where?.call(GameSession.t),
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [GameSession] by its [id] or null if no such row exists.
  Future<GameSession?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<GameSession>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [GameSession]s in the list and returns the inserted rows.
  ///
  /// The returned [GameSession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<GameSession>> insert(
    _is.DatabaseSession session,
    List<GameSession> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<GameSession>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [GameSession] and returns the inserted row.
  ///
  /// The returned [GameSession] will have its `id` field set.
  Future<GameSession> insertRow(
    _is.DatabaseSession session,
    GameSession row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<GameSession>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [GameSession]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [GameSession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<GameSession>> upsert(
    _is.DatabaseSession session,
    List<GameSession> rows, {
    required _is.ColumnSelections<GameSessionTable> conflictColumns,
    _is.ColumnSelections<GameSessionTable>? updateColumns,
    _is.WhereExpressionBuilder<GameSessionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<GameSession>(
      rows,
      conflictColumns: conflictColumns(GameSession.t),
      updateColumns: updateColumns?.call(GameSession.t),
      updateWhere: updateWhere?.call(GameSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [GameSession] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [GameSession] will have its `id` field set.
  Future<GameSession?> upsertRow(
    _is.DatabaseSession session,
    GameSession row, {
    required _is.ColumnSelections<GameSessionTable> conflictColumns,
    _is.ColumnSelections<GameSessionTable>? updateColumns,
    _is.WhereExpressionBuilder<GameSessionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<GameSession>(
      row,
      conflictColumns: conflictColumns(GameSession.t),
      updateColumns: updateColumns?.call(GameSession.t),
      updateWhere: updateWhere?.call(GameSession.t),
      transaction: transaction,
    );
  }

  /// Updates all [GameSession]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<GameSession>> update(
    _is.DatabaseSession session,
    List<GameSession> rows, {
    _is.ColumnSelections<GameSessionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<GameSession>(
      rows,
      columns: columns?.call(GameSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [GameSession]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GameSession> updateRow(
    _is.DatabaseSession session,
    GameSession row, {
    _is.ColumnSelections<GameSessionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<GameSession>(
      row,
      columns: columns?.call(GameSession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GameSession] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<GameSession?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<GameSessionUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<GameSession>(
      id,
      columnValues: columnValues(GameSession.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [GameSession]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<GameSession>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<GameSessionUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<GameSessionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<GameSession>(
      columnValues: columnValues(GameSession.t.updateTable),
      where: where(GameSession.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [GameSession]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<GameSession>> delete(
    _is.DatabaseSession session,
    List<GameSession> rows, {
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<GameSession>(
      rows,
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [GameSession].
  Future<GameSession> deleteRow(
    _is.DatabaseSession session,
    GameSession row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GameSession>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<GameSession>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<GameSessionTable> where,
    _is.OrderByBuilder<GameSessionTable>? orderBy,
    _is.OrderByListBuilder<GameSessionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<GameSession>(
      where: where(GameSession.t),
      orderBy: orderBy?.call(GameSession.t),
      orderByList: orderByList?.call(GameSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<GameSessionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<GameSession>(
      where: where?.call(GameSession.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [GameSession] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<GameSessionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<GameSession>(
      where: where(GameSession.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
