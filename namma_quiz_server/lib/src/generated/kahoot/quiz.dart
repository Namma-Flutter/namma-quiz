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

abstract class Quiz implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Quiz._({
    this.id,
    required this.title,
    required this.creatorId,
    this.description,
    required this.createdAt,
  });

  factory Quiz({
    int? id,
    required String title,
    required int creatorId,
    String? description,
    required DateTime createdAt,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      creatorId: jsonSerialization['creatorId'] as int,
      description: jsonSerialization['description'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = QuizTable();

  static const db = QuizRepository._();

  @override
  int? id;

  String title;

  int creatorId;

  String? description;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Quiz copyWith({
    int? id,
    String? title,
    int? creatorId,
    String? description,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Quiz',
      if (id != null) 'id': id,
      'title': title,
      'creatorId': creatorId,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Quiz',
      if (id != null) 'id': id,
      'title': title,
      'creatorId': creatorId,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
    };
  }

  static QuizInclude include() {
    return QuizInclude._();
  }

  static QuizIncludeList includeList({
    _is.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    QuizInclude? include,
  }) {
    return QuizIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String title,
    required int creatorId,
    String? description,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         creatorId: creatorId,
         description: description,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? title,
    int? creatorId,
    Object? description = _Undefined,
    DateTime? createdAt,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      creatorId: creatorId ?? this.creatorId,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class QuizUpdateTable extends _is.UpdateTable<QuizTable> {
  QuizUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<int, int> creatorId(int value) => _is.ColumnValue(
    table.creatorId,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class QuizTable extends _is.Table<int?> {
  QuizTable({super.tableRelation}) : super(tableName: 'quizzes') {
    updateTable = QuizUpdateTable(this);
    title = _is.ColumnString(
      'title',
      this,
    );
    creatorId = _is.ColumnInt(
      'creatorId',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final QuizUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnInt creatorId;

  late final _is.ColumnString description;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    creatorId,
    description,
    createdAt,
  ];
}

class QuizInclude extends _is.IncludeObject {
  QuizInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Quiz.t;
}

class QuizIncludeList extends _is.IncludeList {
  QuizIncludeList._({
    _is.WhereExpressionBuilder<QuizTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quiz.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Quiz.t;
}

class QuizRepository {
  const QuizRepository._();

  /// Returns a list of [Quiz]s matching the given query parameters.
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
  Future<List<Quiz>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Quiz]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `Quiz.t`.
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
  _ida.Stream<List<Quiz>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Quiz] matching the given query parameters.
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
  Future<Quiz?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizTable>? where,
    int? offset,
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Quiz] by its [id] or null if no such row exists.
  Future<Quiz?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Quiz>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Quiz]s in the list and returns the inserted rows.
  ///
  /// The returned [Quiz]s will have their `id` fields set.
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
  Future<List<Quiz>> insert(
    _is.DatabaseSession session,
    List<Quiz> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Quiz>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Quiz] and returns the inserted row.
  ///
  /// The returned [Quiz] will have its `id` field set.
  Future<Quiz> insertRow(
    _is.DatabaseSession session,
    Quiz row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Quiz]s in the list and returns the resulting rows.
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
  /// The returned [Quiz]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Quiz>> upsert(
    _is.DatabaseSession session,
    List<Quiz> rows, {
    required _is.ColumnSelections<QuizTable> conflictColumns,
    _is.ColumnSelections<QuizTable>? updateColumns,
    _is.WhereExpressionBuilder<QuizTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Quiz>(
      rows,
      conflictColumns: conflictColumns(Quiz.t),
      updateColumns: updateColumns?.call(Quiz.t),
      updateWhere: updateWhere?.call(Quiz.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Quiz] and returns the resulting row.
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
  /// The returned [Quiz] will have its `id` field set.
  Future<Quiz?> upsertRow(
    _is.DatabaseSession session,
    Quiz row, {
    required _is.ColumnSelections<QuizTable> conflictColumns,
    _is.ColumnSelections<QuizTable>? updateColumns,
    _is.WhereExpressionBuilder<QuizTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Quiz>(
      row,
      conflictColumns: conflictColumns(Quiz.t),
      updateColumns: updateColumns?.call(Quiz.t),
      updateWhere: updateWhere?.call(Quiz.t),
      transaction: transaction,
    );
  }

  /// Updates all [Quiz]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Quiz>> update(
    _is.DatabaseSession session,
    List<Quiz> rows, {
    _is.ColumnSelections<QuizTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Quiz>(
      rows,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Quiz]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Quiz> updateRow(
    _is.DatabaseSession session,
    Quiz row, {
    _is.ColumnSelections<QuizTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Quiz>(
      row,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Quiz] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Quiz?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<QuizUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Quiz>(
      id,
      columnValues: columnValues(Quiz.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Quiz]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Quiz>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<QuizUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<QuizTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Quiz>(
      columnValues: columnValues(Quiz.t.updateTable),
      where: where(Quiz.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Quiz]s in the list and returns the deleted rows.
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
  Future<List<Quiz>> delete(
    _is.DatabaseSession session,
    List<Quiz> rows, {
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Quiz>(
      rows,
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Quiz].
  Future<Quiz> deleteRow(
    _is.DatabaseSession session,
    Quiz row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Quiz>(
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
  Future<List<Quiz>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<QuizTable> where,
    _is.OrderByBuilder<QuizTable>? orderBy,
    _is.OrderByListBuilder<QuizTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Quiz>(
      where: where(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Quiz>(
      where: where?.call(Quiz.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Quiz] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<QuizTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Quiz>(
      where: where(Quiz.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
