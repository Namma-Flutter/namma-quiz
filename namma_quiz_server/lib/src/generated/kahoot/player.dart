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

abstract class Player implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Player._({
    this.id,
    required this.gameSessionId,
    required this.name,
    required this.score,
    String? status,
    this.answersJson,
    this.tokenHash,
  }) : status = status ?? 'connected';

  factory Player({
    int? id,
    required int gameSessionId,
    required String name,
    required int score,
    String? status,
    String? answersJson,
    String? tokenHash,
  }) = _PlayerImpl;

  factory Player.fromJson(Map<String, dynamic> jsonSerialization) {
    return Player(
      id: jsonSerialization['id'] as int?,
      gameSessionId: jsonSerialization['gameSessionId'] as int,
      name: jsonSerialization['name'] as String,
      score: jsonSerialization['score'] as int,
      status: jsonSerialization['status'] as String?,
      answersJson: jsonSerialization['answersJson'] as String?,
      tokenHash: jsonSerialization['tokenHash'] as String?,
    );
  }

  static final t = PlayerTable();

  static const db = PlayerRepository._();

  @override
  int? id;

  int gameSessionId;

  String name;

  int score;

  String status;

  String? answersJson;

  String? tokenHash;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Player copyWith({
    int? id,
    int? gameSessionId,
    String? name,
    int? score,
    String? status,
    String? answersJson,
    String? tokenHash,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Player',
      if (id != null) 'id': id,
      'gameSessionId': gameSessionId,
      'name': name,
      'score': score,
      'status': status,
      if (answersJson != null) 'answersJson': answersJson,
      if (tokenHash != null) 'tokenHash': tokenHash,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Player',
      if (id != null) 'id': id,
      'gameSessionId': gameSessionId,
      'name': name,
      'score': score,
      'status': status,
      if (answersJson != null) 'answersJson': answersJson,
    };
  }

  static PlayerInclude include() {
    return PlayerInclude._();
  }

  static PlayerIncludeList includeList({
    _is.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    PlayerInclude? include,
  }) {
    return PlayerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerImpl extends Player {
  _PlayerImpl({
    int? id,
    required int gameSessionId,
    required String name,
    required int score,
    String? status,
    String? answersJson,
    String? tokenHash,
  }) : super._(
         id: id,
         gameSessionId: gameSessionId,
         name: name,
         score: score,
         status: status,
         answersJson: answersJson,
         tokenHash: tokenHash,
       );

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Player copyWith({
    Object? id = _Undefined,
    int? gameSessionId,
    String? name,
    int? score,
    String? status,
    Object? answersJson = _Undefined,
    Object? tokenHash = _Undefined,
  }) {
    return Player(
      id: id is int? ? id : this.id,
      gameSessionId: gameSessionId ?? this.gameSessionId,
      name: name ?? this.name,
      score: score ?? this.score,
      status: status ?? this.status,
      answersJson: answersJson is String? ? answersJson : this.answersJson,
      tokenHash: tokenHash is String? ? tokenHash : this.tokenHash,
    );
  }
}

class PlayerUpdateTable extends _is.UpdateTable<PlayerTable> {
  PlayerUpdateTable(super.table);

  _is.ColumnValue<int, int> gameSessionId(int value) => _is.ColumnValue(
    table.gameSessionId,
    value,
  );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<int, int> score(int value) => _is.ColumnValue(
    table.score,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<String, String> answersJson(String? value) => _is.ColumnValue(
    table.answersJson,
    value,
  );

  _is.ColumnValue<String, String> tokenHash(String? value) => _is.ColumnValue(
    table.tokenHash,
    value,
  );
}

class PlayerTable extends _is.Table<int?> {
  PlayerTable({super.tableRelation}) : super(tableName: 'players') {
    updateTable = PlayerUpdateTable(this);
    gameSessionId = _is.ColumnInt(
      'gameSessionId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    score = _is.ColumnInt(
      'score',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    answersJson = _is.ColumnString(
      'answersJson',
      this,
    );
    tokenHash = _is.ColumnString(
      'tokenHash',
      this,
    );
  }

  late final PlayerUpdateTable updateTable;

  late final _is.ColumnInt gameSessionId;

  late final _is.ColumnString name;

  late final _is.ColumnInt score;

  late final _is.ColumnString status;

  late final _is.ColumnString answersJson;

  late final _is.ColumnString tokenHash;

  @override
  List<_is.Column> get columns => [
    id,
    gameSessionId,
    name,
    score,
    status,
    answersJson,
    tokenHash,
  ];
}

class PlayerInclude extends _is.IncludeObject {
  PlayerInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Player.t;
}

class PlayerIncludeList extends _is.IncludeList {
  PlayerIncludeList._({
    _is.WhereExpressionBuilder<PlayerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Player.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Player.t;
}

class PlayerRepository {
  const PlayerRepository._();

  /// Returns a list of [Player]s matching the given query parameters.
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
  Future<List<Player>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Player]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `Player.t`.
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
  _ida.Stream<List<Player>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Player] matching the given query parameters.
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
  Future<Player?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerTable>? where,
    int? offset,
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Player] by its [id] or null if no such row exists.
  Future<Player?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Player>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Player]s in the list and returns the inserted rows.
  ///
  /// The returned [Player]s will have their `id` fields set.
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
  Future<List<Player>> insert(
    _is.DatabaseSession session,
    List<Player> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Player>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Player] and returns the inserted row.
  ///
  /// The returned [Player] will have its `id` field set.
  Future<Player> insertRow(
    _is.DatabaseSession session,
    Player row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Player>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Player]s in the list and returns the resulting rows.
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
  /// The returned [Player]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Player>> upsert(
    _is.DatabaseSession session,
    List<Player> rows, {
    required _is.ColumnSelections<PlayerTable> conflictColumns,
    _is.ColumnSelections<PlayerTable>? updateColumns,
    _is.WhereExpressionBuilder<PlayerTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Player>(
      rows,
      conflictColumns: conflictColumns(Player.t),
      updateColumns: updateColumns?.call(Player.t),
      updateWhere: updateWhere?.call(Player.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Player] and returns the resulting row.
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
  /// The returned [Player] will have its `id` field set.
  Future<Player?> upsertRow(
    _is.DatabaseSession session,
    Player row, {
    required _is.ColumnSelections<PlayerTable> conflictColumns,
    _is.ColumnSelections<PlayerTable>? updateColumns,
    _is.WhereExpressionBuilder<PlayerTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Player>(
      row,
      conflictColumns: conflictColumns(Player.t),
      updateColumns: updateColumns?.call(Player.t),
      updateWhere: updateWhere?.call(Player.t),
      transaction: transaction,
    );
  }

  /// Updates all [Player]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Player>> update(
    _is.DatabaseSession session,
    List<Player> rows, {
    _is.ColumnSelections<PlayerTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Player>(
      rows,
      columns: columns?.call(Player.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Player]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Player> updateRow(
    _is.DatabaseSession session,
    Player row, {
    _is.ColumnSelections<PlayerTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Player>(
      row,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Player] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Player?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<PlayerUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Player>(
      id,
      columnValues: columnValues(Player.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Player]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Player>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<PlayerUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<PlayerTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Player>(
      columnValues: columnValues(Player.t.updateTable),
      where: where(Player.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Player]s in the list and returns the deleted rows.
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
  Future<List<Player>> delete(
    _is.DatabaseSession session,
    List<Player> rows, {
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Player>(
      rows,
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Player].
  Future<Player> deleteRow(
    _is.DatabaseSession session,
    Player row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Player>(
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
  Future<List<Player>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PlayerTable> where,
    _is.OrderByBuilder<PlayerTable>? orderBy,
    _is.OrderByListBuilder<PlayerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Player>(
      where: where(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Player>(
      where: where?.call(Player.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Player] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PlayerTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Player>(
      where: where(Player.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
