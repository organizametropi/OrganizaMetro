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

abstract class TipoMaterial
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TipoMaterial._({
    this.id,
    required this.nome,
    required this.faixaInicial,
    required this.faixaFinal,
    required this.descricao,
  });

  factory TipoMaterial({
    int? id,
    required String nome,
    required int faixaInicial,
    required int faixaFinal,
    required String descricao,
  }) = _TipoMaterialImpl;

  factory TipoMaterial.fromJson(Map<String, dynamic> jsonSerialization) {
    return TipoMaterial(
      id: jsonSerialization['id'] as int?,
      nome: jsonSerialization['nome'] as String,
      faixaInicial: jsonSerialization['faixaInicial'] as int,
      faixaFinal: jsonSerialization['faixaFinal'] as int,
      descricao: jsonSerialization['descricao'] as String,
    );
  }

  static final t = TipoMaterialTable();

  static const db = TipoMaterialRepository._();

  @override
  int? id;

  String nome;

  int faixaInicial;

  int faixaFinal;

  String descricao;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TipoMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TipoMaterial copyWith({
    int? id,
    String? nome,
    int? faixaInicial,
    int? faixaFinal,
    String? descricao,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'faixaInicial': faixaInicial,
      'faixaFinal': faixaFinal,
      'descricao': descricao,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'faixaInicial': faixaInicial,
      'faixaFinal': faixaFinal,
      'descricao': descricao,
    };
  }

  static TipoMaterialInclude include() {
    return TipoMaterialInclude._();
  }

  static TipoMaterialIncludeList includeList({
    _i1.WhereExpressionBuilder<TipoMaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TipoMaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TipoMaterialTable>? orderByList,
    TipoMaterialInclude? include,
  }) {
    return TipoMaterialIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TipoMaterial.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TipoMaterial.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TipoMaterialImpl extends TipoMaterial {
  _TipoMaterialImpl({
    int? id,
    required String nome,
    required int faixaInicial,
    required int faixaFinal,
    required String descricao,
  }) : super._(
          id: id,
          nome: nome,
          faixaInicial: faixaInicial,
          faixaFinal: faixaFinal,
          descricao: descricao,
        );

  /// Returns a shallow copy of this [TipoMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TipoMaterial copyWith({
    Object? id = _Undefined,
    String? nome,
    int? faixaInicial,
    int? faixaFinal,
    String? descricao,
  }) {
    return TipoMaterial(
      id: id is int? ? id : this.id,
      nome: nome ?? this.nome,
      faixaInicial: faixaInicial ?? this.faixaInicial,
      faixaFinal: faixaFinal ?? this.faixaFinal,
      descricao: descricao ?? this.descricao,
    );
  }
}

class TipoMaterialTable extends _i1.Table<int?> {
  TipoMaterialTable({super.tableRelation}) : super(tableName: 'tipo_material') {
    nome = _i1.ColumnString(
      'nome',
      this,
    );
    faixaInicial = _i1.ColumnInt(
      'faixaInicial',
      this,
    );
    faixaFinal = _i1.ColumnInt(
      'faixaFinal',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
  }

  late final _i1.ColumnString nome;

  late final _i1.ColumnInt faixaInicial;

  late final _i1.ColumnInt faixaFinal;

  late final _i1.ColumnString descricao;

  @override
  List<_i1.Column> get columns => [
        id,
        nome,
        faixaInicial,
        faixaFinal,
        descricao,
      ];
}

class TipoMaterialInclude extends _i1.IncludeObject {
  TipoMaterialInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TipoMaterial.t;
}

class TipoMaterialIncludeList extends _i1.IncludeList {
  TipoMaterialIncludeList._({
    _i1.WhereExpressionBuilder<TipoMaterialTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TipoMaterial.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TipoMaterial.t;
}

class TipoMaterialRepository {
  const TipoMaterialRepository._();

  /// Returns a list of [TipoMaterial]s matching the given query parameters.
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
  Future<List<TipoMaterial>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TipoMaterialTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TipoMaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TipoMaterialTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TipoMaterial>(
      where: where?.call(TipoMaterial.t),
      orderBy: orderBy?.call(TipoMaterial.t),
      orderByList: orderByList?.call(TipoMaterial.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TipoMaterial] matching the given query parameters.
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
  Future<TipoMaterial?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TipoMaterialTable>? where,
    int? offset,
    _i1.OrderByBuilder<TipoMaterialTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TipoMaterialTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TipoMaterial>(
      where: where?.call(TipoMaterial.t),
      orderBy: orderBy?.call(TipoMaterial.t),
      orderByList: orderByList?.call(TipoMaterial.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TipoMaterial] by its [id] or null if no such row exists.
  Future<TipoMaterial?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TipoMaterial>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TipoMaterial]s in the list and returns the inserted rows.
  ///
  /// The returned [TipoMaterial]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TipoMaterial>> insert(
    _i1.Session session,
    List<TipoMaterial> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TipoMaterial>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TipoMaterial] and returns the inserted row.
  ///
  /// The returned [TipoMaterial] will have its `id` field set.
  Future<TipoMaterial> insertRow(
    _i1.Session session,
    TipoMaterial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TipoMaterial>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TipoMaterial]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TipoMaterial>> update(
    _i1.Session session,
    List<TipoMaterial> rows, {
    _i1.ColumnSelections<TipoMaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TipoMaterial>(
      rows,
      columns: columns?.call(TipoMaterial.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TipoMaterial]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TipoMaterial> updateRow(
    _i1.Session session,
    TipoMaterial row, {
    _i1.ColumnSelections<TipoMaterialTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TipoMaterial>(
      row,
      columns: columns?.call(TipoMaterial.t),
      transaction: transaction,
    );
  }

  /// Deletes all [TipoMaterial]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TipoMaterial>> delete(
    _i1.Session session,
    List<TipoMaterial> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TipoMaterial>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TipoMaterial].
  Future<TipoMaterial> deleteRow(
    _i1.Session session,
    TipoMaterial row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TipoMaterial>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TipoMaterial>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TipoMaterialTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TipoMaterial>(
      where: where(TipoMaterial.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TipoMaterialTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TipoMaterial>(
      where: where?.call(TipoMaterial.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
