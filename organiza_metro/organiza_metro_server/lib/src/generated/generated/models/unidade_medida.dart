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

abstract class UnidadeMedida
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UnidadeMedida._({
    this.id,
    required this.codigo,
    required this.descricao,
  });

  factory UnidadeMedida({
    int? id,
    required String codigo,
    required String descricao,
  }) = _UnidadeMedidaImpl;

  factory UnidadeMedida.fromJson(Map<String, dynamic> jsonSerialization) {
    return UnidadeMedida(
      id: jsonSerialization['id'] as int?,
      codigo: jsonSerialization['codigo'] as String,
      descricao: jsonSerialization['descricao'] as String,
    );
  }

  static final t = UnidadeMedidaTable();

  static const db = UnidadeMedidaRepository._();

  @override
  int? id;

  String codigo;

  String descricao;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UnidadeMedida]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UnidadeMedida copyWith({
    int? id,
    String? codigo,
    String? descricao,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      'descricao': descricao,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      'descricao': descricao,
    };
  }

  static UnidadeMedidaInclude include() {
    return UnidadeMedidaInclude._();
  }

  static UnidadeMedidaIncludeList includeList({
    _i1.WhereExpressionBuilder<UnidadeMedidaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UnidadeMedidaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UnidadeMedidaTable>? orderByList,
    UnidadeMedidaInclude? include,
  }) {
    return UnidadeMedidaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UnidadeMedida.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UnidadeMedida.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UnidadeMedidaImpl extends UnidadeMedida {
  _UnidadeMedidaImpl({
    int? id,
    required String codigo,
    required String descricao,
  }) : super._(
          id: id,
          codigo: codigo,
          descricao: descricao,
        );

  /// Returns a shallow copy of this [UnidadeMedida]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UnidadeMedida copyWith({
    Object? id = _Undefined,
    String? codigo,
    String? descricao,
  }) {
    return UnidadeMedida(
      id: id is int? ? id : this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
    );
  }
}

class UnidadeMedidaTable extends _i1.Table<int?> {
  UnidadeMedidaTable({super.tableRelation})
      : super(tableName: 'unidade_medida') {
    codigo = _i1.ColumnString(
      'codigo',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
  }

  late final _i1.ColumnString codigo;

  late final _i1.ColumnString descricao;

  @override
  List<_i1.Column> get columns => [
        id,
        codigo,
        descricao,
      ];
}

class UnidadeMedidaInclude extends _i1.IncludeObject {
  UnidadeMedidaInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UnidadeMedida.t;
}

class UnidadeMedidaIncludeList extends _i1.IncludeList {
  UnidadeMedidaIncludeList._({
    _i1.WhereExpressionBuilder<UnidadeMedidaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UnidadeMedida.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UnidadeMedida.t;
}

class UnidadeMedidaRepository {
  const UnidadeMedidaRepository._();

  /// Returns a list of [UnidadeMedida]s matching the given query parameters.
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
  Future<List<UnidadeMedida>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnidadeMedidaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UnidadeMedidaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UnidadeMedidaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UnidadeMedida>(
      where: where?.call(UnidadeMedida.t),
      orderBy: orderBy?.call(UnidadeMedida.t),
      orderByList: orderByList?.call(UnidadeMedida.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UnidadeMedida] matching the given query parameters.
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
  Future<UnidadeMedida?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnidadeMedidaTable>? where,
    int? offset,
    _i1.OrderByBuilder<UnidadeMedidaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UnidadeMedidaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UnidadeMedida>(
      where: where?.call(UnidadeMedida.t),
      orderBy: orderBy?.call(UnidadeMedida.t),
      orderByList: orderByList?.call(UnidadeMedida.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UnidadeMedida] by its [id] or null if no such row exists.
  Future<UnidadeMedida?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UnidadeMedida>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UnidadeMedida]s in the list and returns the inserted rows.
  ///
  /// The returned [UnidadeMedida]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UnidadeMedida>> insert(
    _i1.Session session,
    List<UnidadeMedida> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UnidadeMedida>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UnidadeMedida] and returns the inserted row.
  ///
  /// The returned [UnidadeMedida] will have its `id` field set.
  Future<UnidadeMedida> insertRow(
    _i1.Session session,
    UnidadeMedida row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UnidadeMedida>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UnidadeMedida]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UnidadeMedida>> update(
    _i1.Session session,
    List<UnidadeMedida> rows, {
    _i1.ColumnSelections<UnidadeMedidaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UnidadeMedida>(
      rows,
      columns: columns?.call(UnidadeMedida.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UnidadeMedida]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UnidadeMedida> updateRow(
    _i1.Session session,
    UnidadeMedida row, {
    _i1.ColumnSelections<UnidadeMedidaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UnidadeMedida>(
      row,
      columns: columns?.call(UnidadeMedida.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UnidadeMedida]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UnidadeMedida>> delete(
    _i1.Session session,
    List<UnidadeMedida> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UnidadeMedida>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UnidadeMedida].
  Future<UnidadeMedida> deleteRow(
    _i1.Session session,
    UnidadeMedida row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UnidadeMedida>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UnidadeMedida>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UnidadeMedidaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UnidadeMedida>(
      where: where(UnidadeMedida.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UnidadeMedidaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UnidadeMedida>(
      where: where?.call(UnidadeMedida.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
