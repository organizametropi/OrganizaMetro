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

abstract class Base implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Base._({
    this.id,
    required this.codigo,
    required this.nome,
    this.endereco,
    this.responsavelId,
  });

  factory Base({
    int? id,
    required String codigo,
    required String nome,
    String? endereco,
    int? responsavelId,
  }) = _BaseImpl;

  factory Base.fromJson(Map<String, dynamic> jsonSerialization) {
    return Base(
      id: jsonSerialization['id'] as int?,
      codigo: jsonSerialization['codigo'] as String,
      nome: jsonSerialization['nome'] as String,
      endereco: jsonSerialization['endereco'] as String?,
      responsavelId: jsonSerialization['responsavelId'] as int?,
    );
  }

  static final t = BaseTable();

  static const db = BaseRepository._();

  @override
  int? id;

  String codigo;

  String nome;

  String? endereco;

  int? responsavelId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Base]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Base copyWith({
    int? id,
    String? codigo,
    String? nome,
    String? endereco,
    int? responsavelId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      'nome': nome,
      if (endereco != null) 'endereco': endereco,
      if (responsavelId != null) 'responsavelId': responsavelId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      'nome': nome,
      if (endereco != null) 'endereco': endereco,
      if (responsavelId != null) 'responsavelId': responsavelId,
    };
  }

  static BaseInclude include() {
    return BaseInclude._();
  }

  static BaseIncludeList includeList({
    _i1.WhereExpressionBuilder<BaseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BaseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BaseTable>? orderByList,
    BaseInclude? include,
  }) {
    return BaseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Base.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Base.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BaseImpl extends Base {
  _BaseImpl({
    int? id,
    required String codigo,
    required String nome,
    String? endereco,
    int? responsavelId,
  }) : super._(
          id: id,
          codigo: codigo,
          nome: nome,
          endereco: endereco,
          responsavelId: responsavelId,
        );

  /// Returns a shallow copy of this [Base]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Base copyWith({
    Object? id = _Undefined,
    String? codigo,
    String? nome,
    Object? endereco = _Undefined,
    Object? responsavelId = _Undefined,
  }) {
    return Base(
      id: id is int? ? id : this.id,
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
      endereco: endereco is String? ? endereco : this.endereco,
      responsavelId: responsavelId is int? ? responsavelId : this.responsavelId,
    );
  }
}

class BaseTable extends _i1.Table<int?> {
  BaseTable({super.tableRelation}) : super(tableName: 'base') {
    codigo = _i1.ColumnString(
      'codigo',
      this,
    );
    nome = _i1.ColumnString(
      'nome',
      this,
    );
    endereco = _i1.ColumnString(
      'endereco',
      this,
    );
    responsavelId = _i1.ColumnInt(
      'responsavelId',
      this,
    );
  }

  late final _i1.ColumnString codigo;

  late final _i1.ColumnString nome;

  late final _i1.ColumnString endereco;

  late final _i1.ColumnInt responsavelId;

  @override
  List<_i1.Column> get columns => [
        id,
        codigo,
        nome,
        endereco,
        responsavelId,
      ];
}

class BaseInclude extends _i1.IncludeObject {
  BaseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Base.t;
}

class BaseIncludeList extends _i1.IncludeList {
  BaseIncludeList._({
    _i1.WhereExpressionBuilder<BaseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Base.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Base.t;
}

class BaseRepository {
  const BaseRepository._();

  /// Returns a list of [Base]s matching the given query parameters.
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
  Future<List<Base>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BaseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BaseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BaseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Base>(
      where: where?.call(Base.t),
      orderBy: orderBy?.call(Base.t),
      orderByList: orderByList?.call(Base.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Base] matching the given query parameters.
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
  Future<Base?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BaseTable>? where,
    int? offset,
    _i1.OrderByBuilder<BaseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BaseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Base>(
      where: where?.call(Base.t),
      orderBy: orderBy?.call(Base.t),
      orderByList: orderByList?.call(Base.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Base] by its [id] or null if no such row exists.
  Future<Base?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Base>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Base]s in the list and returns the inserted rows.
  ///
  /// The returned [Base]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Base>> insert(
    _i1.Session session,
    List<Base> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Base>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Base] and returns the inserted row.
  ///
  /// The returned [Base] will have its `id` field set.
  Future<Base> insertRow(
    _i1.Session session,
    Base row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Base>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Base]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Base>> update(
    _i1.Session session,
    List<Base> rows, {
    _i1.ColumnSelections<BaseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Base>(
      rows,
      columns: columns?.call(Base.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Base]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Base> updateRow(
    _i1.Session session,
    Base row, {
    _i1.ColumnSelections<BaseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Base>(
      row,
      columns: columns?.call(Base.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Base]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Base>> delete(
    _i1.Session session,
    List<Base> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Base>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Base].
  Future<Base> deleteRow(
    _i1.Session session,
    Base row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Base>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Base>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BaseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Base>(
      where: where(Base.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BaseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Base>(
      where: where?.call(Base.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
