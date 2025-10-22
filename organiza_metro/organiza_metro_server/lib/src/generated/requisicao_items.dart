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
import 'material.dart' as _i2;
import 'ferramenta.dart' as _i3;

abstract class RequisicaoItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RequisicaoItem._({
    this.id,
    this.materialId,
    this.material,
    this.ferramentaId,
    this.ferramenta,
    required this.quantidade,
  });

  factory RequisicaoItem({
    int? id,
    int? materialId,
    _i2.Material? material,
    int? ferramentaId,
    _i3.Ferramenta? ferramenta,
    required double quantidade,
  }) = _RequisicaoItemImpl;

  factory RequisicaoItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequisicaoItem(
      id: jsonSerialization['id'] as int?,
      materialId: jsonSerialization['materialId'] as int?,
      material: jsonSerialization['material'] == null
          ? null
          : _i2.Material.fromJson(
              (jsonSerialization['material'] as Map<String, dynamic>)),
      ferramentaId: jsonSerialization['ferramentaId'] as int?,
      ferramenta: jsonSerialization['ferramenta'] == null
          ? null
          : _i3.Ferramenta.fromJson(
              (jsonSerialization['ferramenta'] as Map<String, dynamic>)),
      quantidade: (jsonSerialization['quantidade'] as num).toDouble(),
    );
  }

  static final t = RequisicaoItemTable();

  static const db = RequisicaoItemRepository._();

  @override
  int? id;

  int? materialId;

  _i2.Material? material;

  int? ferramentaId;

  _i3.Ferramenta? ferramenta;

  double quantidade;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RequisicaoItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequisicaoItem copyWith({
    int? id,
    int? materialId,
    _i2.Material? material,
    int? ferramentaId,
    _i3.Ferramenta? ferramenta,
    double? quantidade,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (materialId != null) 'materialId': materialId,
      if (material != null) 'material': material?.toJson(),
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJson(),
      'quantidade': quantidade,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (materialId != null) 'materialId': materialId,
      if (material != null) 'material': material?.toJsonForProtocol(),
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJsonForProtocol(),
      'quantidade': quantidade,
    };
  }

  static RequisicaoItemInclude include({
    _i2.MaterialInclude? material,
    _i3.FerramentaInclude? ferramenta,
  }) {
    return RequisicaoItemInclude._(
      material: material,
      ferramenta: ferramenta,
    );
  }

  static RequisicaoItemIncludeList includeList({
    _i1.WhereExpressionBuilder<RequisicaoItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RequisicaoItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RequisicaoItemTable>? orderByList,
    RequisicaoItemInclude? include,
  }) {
    return RequisicaoItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RequisicaoItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RequisicaoItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequisicaoItemImpl extends RequisicaoItem {
  _RequisicaoItemImpl({
    int? id,
    int? materialId,
    _i2.Material? material,
    int? ferramentaId,
    _i3.Ferramenta? ferramenta,
    required double quantidade,
  }) : super._(
          id: id,
          materialId: materialId,
          material: material,
          ferramentaId: ferramentaId,
          ferramenta: ferramenta,
          quantidade: quantidade,
        );

  /// Returns a shallow copy of this [RequisicaoItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequisicaoItem copyWith({
    Object? id = _Undefined,
    Object? materialId = _Undefined,
    Object? material = _Undefined,
    Object? ferramentaId = _Undefined,
    Object? ferramenta = _Undefined,
    double? quantidade,
  }) {
    return RequisicaoItem(
      id: id is int? ? id : this.id,
      materialId: materialId is int? ? materialId : this.materialId,
      material:
          material is _i2.Material? ? material : this.material?.copyWith(),
      ferramentaId: ferramentaId is int? ? ferramentaId : this.ferramentaId,
      ferramenta: ferramenta is _i3.Ferramenta?
          ? ferramenta
          : this.ferramenta?.copyWith(),
      quantidade: quantidade ?? this.quantidade,
    );
  }
}

class RequisicaoItemTable extends _i1.Table<int?> {
  RequisicaoItemTable({super.tableRelation})
      : super(tableName: 'requisicao_item') {
    materialId = _i1.ColumnInt(
      'materialId',
      this,
    );
    ferramentaId = _i1.ColumnInt(
      'ferramentaId',
      this,
    );
    quantidade = _i1.ColumnDouble(
      'quantidade',
      this,
    );
  }

  late final _i1.ColumnInt materialId;

  _i2.MaterialTable? _material;

  late final _i1.ColumnInt ferramentaId;

  _i3.FerramentaTable? _ferramenta;

  late final _i1.ColumnDouble quantidade;

  _i2.MaterialTable get material {
    if (_material != null) return _material!;
    _material = _i1.createRelationTable(
      relationFieldName: 'material',
      field: RequisicaoItem.t.materialId,
      foreignField: _i2.Material.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MaterialTable(tableRelation: foreignTableRelation),
    );
    return _material!;
  }

  _i3.FerramentaTable get ferramenta {
    if (_ferramenta != null) return _ferramenta!;
    _ferramenta = _i1.createRelationTable(
      relationFieldName: 'ferramenta',
      field: RequisicaoItem.t.ferramentaId,
      foreignField: _i3.Ferramenta.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.FerramentaTable(tableRelation: foreignTableRelation),
    );
    return _ferramenta!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        materialId,
        ferramentaId,
        quantidade,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'material') {
      return material;
    }
    if (relationField == 'ferramenta') {
      return ferramenta;
    }
    return null;
  }
}

class RequisicaoItemInclude extends _i1.IncludeObject {
  RequisicaoItemInclude._({
    _i2.MaterialInclude? material,
    _i3.FerramentaInclude? ferramenta,
  }) {
    _material = material;
    _ferramenta = ferramenta;
  }

  _i2.MaterialInclude? _material;

  _i3.FerramentaInclude? _ferramenta;

  @override
  Map<String, _i1.Include?> get includes => {
        'material': _material,
        'ferramenta': _ferramenta,
      };

  @override
  _i1.Table<int?> get table => RequisicaoItem.t;
}

class RequisicaoItemIncludeList extends _i1.IncludeList {
  RequisicaoItemIncludeList._({
    _i1.WhereExpressionBuilder<RequisicaoItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RequisicaoItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RequisicaoItem.t;
}

class RequisicaoItemRepository {
  const RequisicaoItemRepository._();

  final attachRow = const RequisicaoItemAttachRowRepository._();

  final detachRow = const RequisicaoItemDetachRowRepository._();

  /// Returns a list of [RequisicaoItem]s matching the given query parameters.
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
  Future<List<RequisicaoItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RequisicaoItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RequisicaoItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RequisicaoItemTable>? orderByList,
    _i1.Transaction? transaction,
    RequisicaoItemInclude? include,
  }) async {
    return session.db.find<RequisicaoItem>(
      where: where?.call(RequisicaoItem.t),
      orderBy: orderBy?.call(RequisicaoItem.t),
      orderByList: orderByList?.call(RequisicaoItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [RequisicaoItem] matching the given query parameters.
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
  Future<RequisicaoItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RequisicaoItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<RequisicaoItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RequisicaoItemTable>? orderByList,
    _i1.Transaction? transaction,
    RequisicaoItemInclude? include,
  }) async {
    return session.db.findFirstRow<RequisicaoItem>(
      where: where?.call(RequisicaoItem.t),
      orderBy: orderBy?.call(RequisicaoItem.t),
      orderByList: orderByList?.call(RequisicaoItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [RequisicaoItem] by its [id] or null if no such row exists.
  Future<RequisicaoItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RequisicaoItemInclude? include,
  }) async {
    return session.db.findById<RequisicaoItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [RequisicaoItem]s in the list and returns the inserted rows.
  ///
  /// The returned [RequisicaoItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RequisicaoItem>> insert(
    _i1.Session session,
    List<RequisicaoItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RequisicaoItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RequisicaoItem] and returns the inserted row.
  ///
  /// The returned [RequisicaoItem] will have its `id` field set.
  Future<RequisicaoItem> insertRow(
    _i1.Session session,
    RequisicaoItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RequisicaoItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RequisicaoItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RequisicaoItem>> update(
    _i1.Session session,
    List<RequisicaoItem> rows, {
    _i1.ColumnSelections<RequisicaoItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RequisicaoItem>(
      rows,
      columns: columns?.call(RequisicaoItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RequisicaoItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RequisicaoItem> updateRow(
    _i1.Session session,
    RequisicaoItem row, {
    _i1.ColumnSelections<RequisicaoItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RequisicaoItem>(
      row,
      columns: columns?.call(RequisicaoItem.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RequisicaoItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RequisicaoItem>> delete(
    _i1.Session session,
    List<RequisicaoItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RequisicaoItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RequisicaoItem].
  Future<RequisicaoItem> deleteRow(
    _i1.Session session,
    RequisicaoItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RequisicaoItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RequisicaoItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RequisicaoItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RequisicaoItem>(
      where: where(RequisicaoItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RequisicaoItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RequisicaoItem>(
      where: where?.call(RequisicaoItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RequisicaoItemAttachRowRepository {
  const RequisicaoItemAttachRowRepository._();

  /// Creates a relation between the given [RequisicaoItem] and [Material]
  /// by setting the [RequisicaoItem]'s foreign key `materialId` to refer to the [Material].
  Future<void> material(
    _i1.Session session,
    RequisicaoItem requisicaoItem,
    _i2.Material material, {
    _i1.Transaction? transaction,
  }) async {
    if (requisicaoItem.id == null) {
      throw ArgumentError.notNull('requisicaoItem.id');
    }
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }

    var $requisicaoItem = requisicaoItem.copyWith(materialId: material.id);
    await session.db.updateRow<RequisicaoItem>(
      $requisicaoItem,
      columns: [RequisicaoItem.t.materialId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [RequisicaoItem] and [Ferramenta]
  /// by setting the [RequisicaoItem]'s foreign key `ferramentaId` to refer to the [Ferramenta].
  Future<void> ferramenta(
    _i1.Session session,
    RequisicaoItem requisicaoItem,
    _i3.Ferramenta ferramenta, {
    _i1.Transaction? transaction,
  }) async {
    if (requisicaoItem.id == null) {
      throw ArgumentError.notNull('requisicaoItem.id');
    }
    if (ferramenta.id == null) {
      throw ArgumentError.notNull('ferramenta.id');
    }

    var $requisicaoItem = requisicaoItem.copyWith(ferramentaId: ferramenta.id);
    await session.db.updateRow<RequisicaoItem>(
      $requisicaoItem,
      columns: [RequisicaoItem.t.ferramentaId],
      transaction: transaction,
    );
  }
}

class RequisicaoItemDetachRowRepository {
  const RequisicaoItemDetachRowRepository._();

  /// Detaches the relation between this [RequisicaoItem] and the [Material] set in `material`
  /// by setting the [RequisicaoItem]'s foreign key `materialId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> material(
    _i1.Session session,
    RequisicaoItem requisicaoitem, {
    _i1.Transaction? transaction,
  }) async {
    if (requisicaoitem.id == null) {
      throw ArgumentError.notNull('requisicaoitem.id');
    }

    var $requisicaoitem = requisicaoitem.copyWith(materialId: null);
    await session.db.updateRow<RequisicaoItem>(
      $requisicaoitem,
      columns: [RequisicaoItem.t.materialId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [RequisicaoItem] and the [Ferramenta] set in `ferramenta`
  /// by setting the [RequisicaoItem]'s foreign key `ferramentaId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ferramenta(
    _i1.Session session,
    RequisicaoItem requisicaoitem, {
    _i1.Transaction? transaction,
  }) async {
    if (requisicaoitem.id == null) {
      throw ArgumentError.notNull('requisicaoitem.id');
    }

    var $requisicaoitem = requisicaoitem.copyWith(ferramentaId: null);
    await session.db.updateRow<RequisicaoItem>(
      $requisicaoitem,
      columns: [RequisicaoItem.t.ferramentaId],
      transaction: transaction,
    );
  }
}
