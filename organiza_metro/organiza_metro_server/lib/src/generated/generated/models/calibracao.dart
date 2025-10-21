/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Calibracao
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Calibracao._({
    this.id,
    required this.ferramentaId,
    required this.dataCalibracao,
    required this.validadeCalibracao,
    required this.status,
  });

  factory Calibracao({
    int? id,
    required int ferramentaId,
    required DateTime dataCalibracao,
    required DateTime validadeCalibracao,
    required String status,
  }) = _CalibracaoImpl;

  factory Calibracao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Calibracao(
      id: jsonSerialization['id'] as int?,
      ferramentaId: jsonSerialization['ferramentaId'] as int,
      dataCalibracao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dataCalibracao']),
      validadeCalibracao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['validadeCalibracao']),
      status: jsonSerialization['status'] as String,
    );
  }

  static final t = CalibracaoTable();

  static const db = CalibracaoRepository._();

  @override
  int? id;

  int ferramentaId;

  DateTime dataCalibracao;

  DateTime validadeCalibracao;

  String status;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Calibracao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Calibracao copyWith({
    int? id,
    int? ferramentaId,
    DateTime? dataCalibracao,
    DateTime? validadeCalibracao,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ferramentaId': ferramentaId,
      'dataCalibracao': dataCalibracao.toJson(),
      'validadeCalibracao': validadeCalibracao.toJson(),
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'ferramentaId': ferramentaId,
      'dataCalibracao': dataCalibracao.toJson(),
      'validadeCalibracao': validadeCalibracao.toJson(),
      'status': status,
    };
  }

  static CalibracaoInclude include() {
    return CalibracaoInclude._();
  }

  static CalibracaoIncludeList includeList({
    _i1.WhereExpressionBuilder<CalibracaoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CalibracaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CalibracaoTable>? orderByList,
    CalibracaoInclude? include,
  }) {
    return CalibracaoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Calibracao.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Calibracao.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CalibracaoImpl extends Calibracao {
  _CalibracaoImpl({
    int? id,
    required int ferramentaId,
    required DateTime dataCalibracao,
    required DateTime validadeCalibracao,
    required String status,
  }) : super._(
          id: id,
          ferramentaId: ferramentaId,
          dataCalibracao: dataCalibracao,
          validadeCalibracao: validadeCalibracao,
          status: status,
        );

  /// Returns a shallow copy of this [Calibracao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Calibracao copyWith({
    Object? id = _Undefined,
    int? ferramentaId,
    DateTime? dataCalibracao,
    DateTime? validadeCalibracao,
    String? status,
  }) {
    return Calibracao(
      id: id is int? ? id : this.id,
      ferramentaId: ferramentaId ?? this.ferramentaId,
      dataCalibracao: dataCalibracao ?? this.dataCalibracao,
      validadeCalibracao: validadeCalibracao ?? this.validadeCalibracao,
      status: status ?? this.status,
    );
  }
}

class CalibracaoTable extends _i1.Table<int?> {
  CalibracaoTable({super.tableRelation}) : super(tableName: 'calibracao') {
    ferramentaId = _i1.ColumnInt(
      'ferramentaId',
      this,
    );
    dataCalibracao = _i1.ColumnDateTime(
      'dataCalibracao',
      this,
    );
    validadeCalibracao = _i1.ColumnDateTime(
      'validadeCalibracao',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
  }

  late final _i1.ColumnInt ferramentaId;

  late final _i1.ColumnDateTime dataCalibracao;

  late final _i1.ColumnDateTime validadeCalibracao;

  late final _i1.ColumnString status;

  @override
  List<_i1.Column> get columns => [
        id,
        ferramentaId,
        dataCalibracao,
        validadeCalibracao,
        status,
      ];
}

class CalibracaoInclude extends _i1.IncludeObject {
  CalibracaoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Calibracao.t;
}

class CalibracaoIncludeList extends _i1.IncludeList {
  CalibracaoIncludeList._({
    _i1.WhereExpressionBuilder<CalibracaoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Calibracao.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Calibracao.t;
}

class CalibracaoRepository {
  const CalibracaoRepository._();

  /// Returns a list of [Calibracao]s matching the given query parameters.
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
  Future<List<Calibracao>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CalibracaoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CalibracaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CalibracaoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Calibracao>(
      where: where?.call(Calibracao.t),
      orderBy: orderBy?.call(Calibracao.t),
      orderByList: orderByList?.call(Calibracao.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Calibracao] matching the given query parameters.
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
  Future<Calibracao?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CalibracaoTable>? where,
    int? offset,
    _i1.OrderByBuilder<CalibracaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CalibracaoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Calibracao>(
      where: where?.call(Calibracao.t),
      orderBy: orderBy?.call(Calibracao.t),
      orderByList: orderByList?.call(Calibracao.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Calibracao] by its [id] or null if no such row exists.
  Future<Calibracao?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Calibracao>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Calibracao]s in the list and returns the inserted rows.
  ///
  /// The returned [Calibracao]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Calibracao>> insert(
    _i1.Session session,
    List<Calibracao> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Calibracao>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Calibracao] and returns the inserted row.
  ///
  /// The returned [Calibracao] will have its `id` field set.
  Future<Calibracao> insertRow(
    _i1.Session session,
    Calibracao row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Calibracao>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Calibracao]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Calibracao>> update(
    _i1.Session session,
    List<Calibracao> rows, {
    _i1.ColumnSelections<CalibracaoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Calibracao>(
      rows,
      columns: columns?.call(Calibracao.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Calibracao]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Calibracao> updateRow(
    _i1.Session session,
    Calibracao row, {
    _i1.ColumnSelections<CalibracaoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Calibracao>(
      row,
      columns: columns?.call(Calibracao.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Calibracao]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Calibracao>> delete(
    _i1.Session session,
    List<Calibracao> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Calibracao>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Calibracao].
  Future<Calibracao> deleteRow(
    _i1.Session session,
    Calibracao row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Calibracao>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Calibracao>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CalibracaoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Calibracao>(
      where: where(Calibracao.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CalibracaoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Calibracao>(
      where: where?.call(Calibracao.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
