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

abstract class Material
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Material._({
    this.id,
    required this.codigoSap,
    required this.descricao,
    required this.quantidade,
    this.estoqueMinimo,
    this.dataUltimaMovimentacao,
    required this.tipoId,
    required this.unidadeMedidaId,
    this.baseId,
    this.veiculoId,
  });

  factory Material({
    int? id,
    required int codigoSap,
    required String descricao,
    required double quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    required int tipoId,
    required int unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  }) = _MaterialImpl;

  factory Material.fromJson(Map<String, dynamic> jsonSerialization) {
    return Material(
      id: jsonSerialization['id'] as int?,
      codigoSap: jsonSerialization['codigoSap'] as int,
      descricao: jsonSerialization['descricao'] as String,
      quantidade: (jsonSerialization['quantidade'] as num).toDouble(),
      estoqueMinimo: (jsonSerialization['estoqueMinimo'] as num?)?.toDouble(),
      dataUltimaMovimentacao:
          jsonSerialization['dataUltimaMovimentacao'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dataUltimaMovimentacao']),
      tipoId: jsonSerialization['tipoId'] as int,
      unidadeMedidaId: jsonSerialization['unidadeMedidaId'] as int,
      baseId: jsonSerialization['baseId'] as int?,
      veiculoId: jsonSerialization['veiculoId'] as int?,
    );
  }

  static final t = MaterialTable();

  static const db = MaterialRepository._();

  @override
  int? id;

  int codigoSap;

  String descricao;

  double quantidade;

  double? estoqueMinimo;

  DateTime? dataUltimaMovimentacao;

  int tipoId;

  int unidadeMedidaId;

  int? baseId;

  int? veiculoId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Material copyWith({
    int? id,
    int? codigoSap,
    String? descricao,
    double? quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    int? tipoId,
    int? unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'tipoId': tipoId,
      'unidadeMedidaId': unidadeMedidaId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'tipoId': tipoId,
      'unidadeMedidaId': unidadeMedidaId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
    };
  }

  static MaterialInclude include() {
    return MaterialInclude._();
  }

  static MaterialIncludeList includeList({
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    MaterialInclude? include,
  }) {
    return MaterialIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Material.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Material.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaterialImpl extends Material {
  _MaterialImpl({
    int? id,
    required int codigoSap,
    required String descricao,
    required double quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    required int tipoId,
    required int unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  }) : super._(
          id: id,
          codigoSap: codigoSap,
          descricao: descricao,
          quantidade: quantidade,
          estoqueMinimo: estoqueMinimo,
          dataUltimaMovimentacao: dataUltimaMovimentacao,
          tipoId: tipoId,
          unidadeMedidaId: unidadeMedidaId,
          baseId: baseId,
          veiculoId: veiculoId,
        );

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Material copyWith({
    Object? id = _Undefined,
    int? codigoSap,
    String? descricao,
    double? quantidade,
    Object? estoqueMinimo = _Undefined,
    Object? dataUltimaMovimentacao = _Undefined,
    int? tipoId,
    int? unidadeMedidaId,
    Object? baseId = _Undefined,
    Object? veiculoId = _Undefined,
  }) {
    return Material(
      id: id is int? ? id : this.id,
      codigoSap: codigoSap ?? this.codigoSap,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      estoqueMinimo:
          estoqueMinimo is double? ? estoqueMinimo : this.estoqueMinimo,
      dataUltimaMovimentacao: dataUltimaMovimentacao is DateTime?
          ? dataUltimaMovimentacao
          : this.dataUltimaMovimentacao,
      tipoId: tipoId ?? this.tipoId,
      unidadeMedidaId: unidadeMedidaId ?? this.unidadeMedidaId,
      baseId: baseId is int? ? baseId : this.baseId,
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
    );
  }
}

class MaterialTable extends _i1.Table<int?> {
  MaterialTable({super.tableRelation}) : super(tableName: 'material') {
    codigoSap = _i1.ColumnInt(
      'codigoSap',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    quantidade = _i1.ColumnDouble(
      'quantidade',
      this,
    );
    estoqueMinimo = _i1.ColumnDouble(
      'estoqueMinimo',
      this,
    );
    dataUltimaMovimentacao = _i1.ColumnDateTime(
      'dataUltimaMovimentacao',
      this,
    );
    tipoId = _i1.ColumnInt(
      'tipoId',
      this,
    );
    unidadeMedidaId = _i1.ColumnInt(
      'unidadeMedidaId',
      this,
    );
    baseId = _i1.ColumnInt(
      'baseId',
      this,
    );
    veiculoId = _i1.ColumnInt(
      'veiculoId',
      this,
    );
  }

  late final _i1.ColumnInt codigoSap;

  late final _i1.ColumnString descricao;

  late final _i1.ColumnDouble quantidade;

  late final _i1.ColumnDouble estoqueMinimo;

  late final _i1.ColumnDateTime dataUltimaMovimentacao;

  late final _i1.ColumnInt tipoId;

  late final _i1.ColumnInt unidadeMedidaId;

  late final _i1.ColumnInt baseId;

  late final _i1.ColumnInt veiculoId;

  @override
  List<_i1.Column> get columns => [
        id,
        codigoSap,
        descricao,
        quantidade,
        estoqueMinimo,
        dataUltimaMovimentacao,
        tipoId,
        unidadeMedidaId,
        baseId,
        veiculoId,
      ];
}

class MaterialInclude extends _i1.IncludeObject {
  MaterialInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Material.t;
}

class MaterialIncludeList extends _i1.IncludeList {
  MaterialIncludeList._({
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Material.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Material.t;
}

class MaterialRepository {
  const MaterialRepository._();

  /// Returns a list of [Material]s matching the given query parameters.
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
  Future<List<Material>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Material>(
      where: where?.call(Material.t),
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Material] matching the given query parameters.
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
  Future<Material?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? offset,
    _i1.OrderByBuilder<MaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Material>(
      where: where?.call(Material.t),
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Material] by its [id] or null if no such row exists.
  Future<Material?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Material>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Material]s in the list and returns the inserted rows.
  ///
  /// The returned [Material]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Material>> insert(
    _i1.Session session,
    List<Material> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Material>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Material] and returns the inserted row.
  ///
  /// The returned [Material] will have its `id` field set.
  Future<Material> insertRow(
    _i1.Session session,
    Material row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Material>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Material]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Material>> update(
    _i1.Session session,
    List<Material> rows, {
    _i1.ColumnSelections<MaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Material>(
      rows,
      columns: columns?.call(Material.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Material]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Material> updateRow(
    _i1.Session session,
    Material row, {
    _i1.ColumnSelections<MaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Material>(
      row,
      columns: columns?.call(Material.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Material]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Material>> delete(
    _i1.Session session,
    List<Material> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Material>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Material].
  Future<Material> deleteRow(
    _i1.Session session,
    Material row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Material>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Material>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MaterialTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Material>(
      where: where(Material.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaterialTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Material>(
      where: where?.call(Material.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
