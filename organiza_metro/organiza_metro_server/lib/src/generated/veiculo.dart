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

abstract class Veiculo
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Veiculo._({
    this.id,
    required this.codigo,
    this.descricao,
    required this.baseId,
  });

  factory Veiculo({
    int? id,
    required String codigo,
    String? descricao,
    required int baseId,
  }) = _VeiculoImpl;

  factory Veiculo.fromJson(Map<String, dynamic> jsonSerialization) {
    return Veiculo(
      id: jsonSerialization['id'] as int?,
      codigo: jsonSerialization['codigo'] as String,
      descricao: jsonSerialization['descricao'] as String?,
      baseId: jsonSerialization['baseId'] as int,
    );
  }

  static final t = VeiculoTable();

  static const db = VeiculoRepository._();

  @override
  int? id;

  String codigo;

  String? descricao;

  int baseId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Veiculo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Veiculo copyWith({
    int? id,
    String? codigo,
    String? descricao,
    int? baseId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      if (descricao != null) 'descricao': descricao,
      'baseId': baseId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      if (descricao != null) 'descricao': descricao,
      'baseId': baseId,
    };
  }

  static VeiculoInclude include() {
    return VeiculoInclude._();
  }

  static VeiculoIncludeList includeList({
    _i1.WhereExpressionBuilder<VeiculoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VeiculoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VeiculoTable>? orderByList,
    VeiculoInclude? include,
  }) {
    return VeiculoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Veiculo.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Veiculo.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VeiculoImpl extends Veiculo {
  _VeiculoImpl({
    int? id,
    required String codigo,
    String? descricao,
    required int baseId,
  }) : super._(
          id: id,
          codigo: codigo,
          descricao: descricao,
          baseId: baseId,
        );

  /// Returns a shallow copy of this [Veiculo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Veiculo copyWith({
    Object? id = _Undefined,
    String? codigo,
    Object? descricao = _Undefined,
    int? baseId,
  }) {
    return Veiculo(
      id: id is int? ? id : this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao is String? ? descricao : this.descricao,
      baseId: baseId ?? this.baseId,
    );
  }
}

class VeiculoTable extends _i1.Table<int?> {
  VeiculoTable({super.tableRelation}) : super(tableName: 'veiculo') {
    codigo = _i1.ColumnString(
      'codigo',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    baseId = _i1.ColumnInt(
      'baseId',
      this,
    );
  }

  late final _i1.ColumnString codigo;

  late final _i1.ColumnString descricao;

  late final _i1.ColumnInt baseId;

  @override
  List<_i1.Column> get columns => [
        id,
        codigo,
        descricao,
        baseId,
      ];
}

class VeiculoInclude extends _i1.IncludeObject {
  VeiculoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Veiculo.t;
}

class VeiculoIncludeList extends _i1.IncludeList {
  VeiculoIncludeList._({
    _i1.WhereExpressionBuilder<VeiculoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Veiculo.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Veiculo.t;
}

class VeiculoRepository {
  const VeiculoRepository._();

  /// Returns a list of [Veiculo]s matching the given query parameters.
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
  Future<List<Veiculo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VeiculoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VeiculoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VeiculoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Veiculo>(
      where: where?.call(Veiculo.t),
      orderBy: orderBy?.call(Veiculo.t),
      orderByList: orderByList?.call(Veiculo.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Veiculo] matching the given query parameters.
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
  Future<Veiculo?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VeiculoTable>? where,
    int? offset,
    _i1.OrderByBuilder<VeiculoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VeiculoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Veiculo>(
      where: where?.call(Veiculo.t),
      orderBy: orderBy?.call(Veiculo.t),
      orderByList: orderByList?.call(Veiculo.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Veiculo] by its [id] or null if no such row exists.
  Future<Veiculo?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Veiculo>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Veiculo]s in the list and returns the inserted rows.
  ///
  /// The returned [Veiculo]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Veiculo>> insert(
    _i1.Session session,
    List<Veiculo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Veiculo>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Veiculo] and returns the inserted row.
  ///
  /// The returned [Veiculo] will have its `id` field set.
  Future<Veiculo> insertRow(
    _i1.Session session,
    Veiculo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Veiculo>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Veiculo]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Veiculo>> update(
    _i1.Session session,
    List<Veiculo> rows, {
    _i1.ColumnSelections<VeiculoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Veiculo>(
      rows,
      columns: columns?.call(Veiculo.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Veiculo]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Veiculo> updateRow(
    _i1.Session session,
    Veiculo row, {
    _i1.ColumnSelections<VeiculoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Veiculo>(
      row,
      columns: columns?.call(Veiculo.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Veiculo]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Veiculo>> delete(
    _i1.Session session,
    List<Veiculo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Veiculo>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Veiculo].
  Future<Veiculo> deleteRow(
    _i1.Session session,
    Veiculo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Veiculo>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Veiculo>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VeiculoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Veiculo>(
      where: where(Veiculo.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VeiculoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Veiculo>(
      where: where?.call(Veiculo.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
