/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../generated/models/tipo_material.dart' as _i2;
import '../../generated/models/unidade_medida.dart' as _i3;
import '../../generated/models/base.dart' as _i4;
import '../../generated/models/veiculo.dart' as _i5;

abstract class Material
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Material._({
    this.id,
    required this.codigoSap,
    required this.descricao,
    this.quantidade,
    this.estoqueMinimo,
    this.dataUltimaMovimentacao,
    required this.tipoId,
    this.tipo,
    required this.unidadeMedidaId,
    this.unidadeMedida,
    required this.baseId,
    this.base,
    required this.veiculoId,
    this.veiculo,
  });

  factory Material({
    int? id,
    required int codigoSap,
    required String descricao,
    double? quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    required int tipoId,
    _i2.TipoMaterial? tipo,
    required int unidadeMedidaId,
    _i3.UnidadeMedida? unidadeMedida,
    required int baseId,
    _i4.Base? base,
    required int veiculoId,
    _i5.Veiculo? veiculo,
  }) = _MaterialImpl;

  factory Material.fromJson(Map<String, dynamic> jsonSerialization) {
    return Material(
      id: jsonSerialization['id'] as int?,
      codigoSap: jsonSerialization['codigoSap'] as int,
      descricao: jsonSerialization['descricao'] as String,
      quantidade: (jsonSerialization['quantidade'] as num?)?.toDouble(),
      estoqueMinimo: (jsonSerialization['estoqueMinimo'] as num?)?.toDouble(),
      dataUltimaMovimentacao:
          jsonSerialization['dataUltimaMovimentacao'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dataUltimaMovimentacao']),
      tipoId: jsonSerialization['tipoId'] as int,
      tipo: jsonSerialization['tipo'] == null
          ? null
          : _i2.TipoMaterial.fromJson(
              (jsonSerialization['tipo'] as Map<String, dynamic>)),
      unidadeMedidaId: jsonSerialization['unidadeMedidaId'] as int,
      unidadeMedida: jsonSerialization['unidadeMedida'] == null
          ? null
          : _i3.UnidadeMedida.fromJson(
              (jsonSerialization['unidadeMedida'] as Map<String, dynamic>)),
      baseId: jsonSerialization['baseId'] as int,
      base: jsonSerialization['base'] == null
          ? null
          : _i4.Base.fromJson(
              (jsonSerialization['base'] as Map<String, dynamic>)),
      veiculoId: jsonSerialization['veiculoId'] as int,
      veiculo: jsonSerialization['veiculo'] == null
          ? null
          : _i5.Veiculo.fromJson(
              (jsonSerialization['veiculo'] as Map<String, dynamic>)),
    );
  }

  static final t = MaterialTable();

  static const db = MaterialRepository._();

  @override
  int? id;

  int codigoSap;

  String descricao;

  double? quantidade;

  double? estoqueMinimo;

  DateTime? dataUltimaMovimentacao;

  int tipoId;

  _i2.TipoMaterial? tipo;

  int unidadeMedidaId;

  _i3.UnidadeMedida? unidadeMedida;

  int baseId;

  _i4.Base? base;

  int veiculoId;

  _i5.Veiculo? veiculo;

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
    _i2.TipoMaterial? tipo,
    int? unidadeMedidaId,
    _i3.UnidadeMedida? unidadeMedida,
    int? baseId,
    _i4.Base? base,
    int? veiculoId,
    _i5.Veiculo? veiculo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      if (quantidade != null) 'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'tipoId': tipoId,
      if (tipo != null) 'tipo': tipo?.toJson(),
      'unidadeMedidaId': unidadeMedidaId,
      if (unidadeMedida != null) 'unidadeMedida': unidadeMedida?.toJson(),
      'baseId': baseId,
      if (base != null) 'base': base?.toJson(),
      'veiculoId': veiculoId,
      if (veiculo != null) 'veiculo': veiculo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      if (quantidade != null) 'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'tipoId': tipoId,
      if (tipo != null) 'tipo': tipo?.toJsonForProtocol(),
      'unidadeMedidaId': unidadeMedidaId,
      if (unidadeMedida != null)
        'unidadeMedida': unidadeMedida?.toJsonForProtocol(),
      'baseId': baseId,
      if (base != null) 'base': base?.toJsonForProtocol(),
      'veiculoId': veiculoId,
      if (veiculo != null) 'veiculo': veiculo?.toJsonForProtocol(),
    };
  }

  static MaterialInclude include({
    _i2.TipoMaterialInclude? tipo,
    _i3.UnidadeMedidaInclude? unidadeMedida,
    _i4.BaseInclude? base,
    _i5.VeiculoInclude? veiculo,
  }) {
    return MaterialInclude._(
      tipo: tipo,
      unidadeMedida: unidadeMedida,
      base: base,
      veiculo: veiculo,
    );
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
    double? quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    required int tipoId,
    _i2.TipoMaterial? tipo,
    required int unidadeMedidaId,
    _i3.UnidadeMedida? unidadeMedida,
    required int baseId,
    _i4.Base? base,
    required int veiculoId,
    _i5.Veiculo? veiculo,
  }) : super._(
          id: id,
          codigoSap: codigoSap,
          descricao: descricao,
          quantidade: quantidade,
          estoqueMinimo: estoqueMinimo,
          dataUltimaMovimentacao: dataUltimaMovimentacao,
          tipoId: tipoId,
          tipo: tipo,
          unidadeMedidaId: unidadeMedidaId,
          unidadeMedida: unidadeMedida,
          baseId: baseId,
          base: base,
          veiculoId: veiculoId,
          veiculo: veiculo,
        );

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Material copyWith({
    Object? id = _Undefined,
    int? codigoSap,
    String? descricao,
    Object? quantidade = _Undefined,
    Object? estoqueMinimo = _Undefined,
    Object? dataUltimaMovimentacao = _Undefined,
    int? tipoId,
    Object? tipo = _Undefined,
    int? unidadeMedidaId,
    Object? unidadeMedida = _Undefined,
    int? baseId,
    Object? base = _Undefined,
    int? veiculoId,
    Object? veiculo = _Undefined,
  }) {
    return Material(
      id: id is int? ? id : this.id,
      codigoSap: codigoSap ?? this.codigoSap,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade is double? ? quantidade : this.quantidade,
      estoqueMinimo:
          estoqueMinimo is double? ? estoqueMinimo : this.estoqueMinimo,
      dataUltimaMovimentacao: dataUltimaMovimentacao is DateTime?
          ? dataUltimaMovimentacao
          : this.dataUltimaMovimentacao,
      tipoId: tipoId ?? this.tipoId,
      tipo: tipo is _i2.TipoMaterial? ? tipo : this.tipo?.copyWith(),
      unidadeMedidaId: unidadeMedidaId ?? this.unidadeMedidaId,
      unidadeMedida: unidadeMedida is _i3.UnidadeMedida?
          ? unidadeMedida
          : this.unidadeMedida?.copyWith(),
      baseId: baseId ?? this.baseId,
      base: base is _i4.Base? ? base : this.base?.copyWith(),
      veiculoId: veiculoId ?? this.veiculoId,
      veiculo: veiculo is _i5.Veiculo? ? veiculo : this.veiculo?.copyWith(),
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

  _i2.TipoMaterialTable? _tipo;

  late final _i1.ColumnInt unidadeMedidaId;

  _i3.UnidadeMedidaTable? _unidadeMedida;

  late final _i1.ColumnInt baseId;

  _i4.BaseTable? _base;

  late final _i1.ColumnInt veiculoId;

  _i5.VeiculoTable? _veiculo;

  _i2.TipoMaterialTable get tipo {
    if (_tipo != null) return _tipo!;
    _tipo = _i1.createRelationTable(
      relationFieldName: 'tipo',
      field: Material.t.tipoId,
      foreignField: _i2.TipoMaterial.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TipoMaterialTable(tableRelation: foreignTableRelation),
    );
    return _tipo!;
  }

  _i3.UnidadeMedidaTable get unidadeMedida {
    if (_unidadeMedida != null) return _unidadeMedida!;
    _unidadeMedida = _i1.createRelationTable(
      relationFieldName: 'unidadeMedida',
      field: Material.t.unidadeMedidaId,
      foreignField: _i3.UnidadeMedida.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UnidadeMedidaTable(tableRelation: foreignTableRelation),
    );
    return _unidadeMedida!;
  }

  _i4.BaseTable get base {
    if (_base != null) return _base!;
    _base = _i1.createRelationTable(
      relationFieldName: 'base',
      field: Material.t.baseId,
      foreignField: _i4.Base.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.BaseTable(tableRelation: foreignTableRelation),
    );
    return _base!;
  }

  _i5.VeiculoTable get veiculo {
    if (_veiculo != null) return _veiculo!;
    _veiculo = _i1.createRelationTable(
      relationFieldName: 'veiculo',
      field: Material.t.veiculoId,
      foreignField: _i5.Veiculo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.VeiculoTable(tableRelation: foreignTableRelation),
    );
    return _veiculo!;
  }

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

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tipo') {
      return tipo;
    }
    if (relationField == 'unidadeMedida') {
      return unidadeMedida;
    }
    if (relationField == 'base') {
      return base;
    }
    if (relationField == 'veiculo') {
      return veiculo;
    }
    return null;
  }
}

class MaterialInclude extends _i1.IncludeObject {
  MaterialInclude._({
    _i2.TipoMaterialInclude? tipo,
    _i3.UnidadeMedidaInclude? unidadeMedida,
    _i4.BaseInclude? base,
    _i5.VeiculoInclude? veiculo,
  }) {
    _tipo = tipo;
    _unidadeMedida = unidadeMedida;
    _base = base;
    _veiculo = veiculo;
  }

  _i2.TipoMaterialInclude? _tipo;

  _i3.UnidadeMedidaInclude? _unidadeMedida;

  _i4.BaseInclude? _base;

  _i5.VeiculoInclude? _veiculo;

  @override
  Map<String, _i1.Include?> get includes => {
        'tipo': _tipo,
        'unidadeMedida': _unidadeMedida,
        'base': _base,
        'veiculo': _veiculo,
      };

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

  final attachRow = const MaterialAttachRowRepository._();

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
    MaterialInclude? include,
  }) async {
    return session.db.find<Material>(
      where: where?.call(Material.t),
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    MaterialInclude? include,
  }) async {
    return session.db.findFirstRow<Material>(
      where: where?.call(Material.t),
      orderBy: orderBy?.call(Material.t),
      orderByList: orderByList?.call(Material.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Material] by its [id] or null if no such row exists.
  Future<Material?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MaterialInclude? include,
  }) async {
    return session.db.findById<Material>(
      id,
      transaction: transaction,
      include: include,
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

class MaterialAttachRowRepository {
  const MaterialAttachRowRepository._();

  /// Creates a relation between the given [Material] and [TipoMaterial]
  /// by setting the [Material]'s foreign key `tipoId` to refer to the [TipoMaterial].
  Future<void> tipo(
    _i1.Session session,
    Material material,
    _i2.TipoMaterial tipo, {
    _i1.Transaction? transaction,
  }) async {
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }
    if (tipo.id == null) {
      throw ArgumentError.notNull('tipo.id');
    }

    var $material = material.copyWith(tipoId: tipo.id);
    await session.db.updateRow<Material>(
      $material,
      columns: [Material.t.tipoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Material] and [UnidadeMedida]
  /// by setting the [Material]'s foreign key `unidadeMedidaId` to refer to the [UnidadeMedida].
  Future<void> unidadeMedida(
    _i1.Session session,
    Material material,
    _i3.UnidadeMedida unidadeMedida, {
    _i1.Transaction? transaction,
  }) async {
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }
    if (unidadeMedida.id == null) {
      throw ArgumentError.notNull('unidadeMedida.id');
    }

    var $material = material.copyWith(unidadeMedidaId: unidadeMedida.id);
    await session.db.updateRow<Material>(
      $material,
      columns: [Material.t.unidadeMedidaId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Material] and [Base]
  /// by setting the [Material]'s foreign key `baseId` to refer to the [Base].
  Future<void> base(
    _i1.Session session,
    Material material,
    _i4.Base base, {
    _i1.Transaction? transaction,
  }) async {
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }
    if (base.id == null) {
      throw ArgumentError.notNull('base.id');
    }

    var $material = material.copyWith(baseId: base.id);
    await session.db.updateRow<Material>(
      $material,
      columns: [Material.t.baseId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Material] and [Veiculo]
  /// by setting the [Material]'s foreign key `veiculoId` to refer to the [Veiculo].
  Future<void> veiculo(
    _i1.Session session,
    Material material,
    _i5.Veiculo veiculo, {
    _i1.Transaction? transaction,
  }) async {
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }
    if (veiculo.id == null) {
      throw ArgumentError.notNull('veiculo.id');
    }

    var $material = material.copyWith(veiculoId: veiculo.id);
    await session.db.updateRow<Material>(
      $material,
      columns: [Material.t.veiculoId],
      transaction: transaction,
    );
  }
}
