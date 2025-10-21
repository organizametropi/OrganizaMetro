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

abstract class Ferramenta
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Ferramenta._({
    this.id,
    required this.codigoSap,
    required this.descricao,
    this.patrimonio,
    required this.emUso,
    required this.tipo,
    required this.status,
    this.dataAquisicao,
    this.dataUltimaMovimentacao,
    required this.unidadeMedidaId,
    this.baseId,
    this.veiculoId,
    this.empenhadoParaId,
  });

  factory Ferramenta({
    int? id,
    required int codigoSap,
    required String descricao,
    String? patrimonio,
    required bool emUso,
    required String tipo,
    required String status,
    DateTime? dataAquisicao,
    DateTime? dataUltimaMovimentacao,
    required int unidadeMedidaId,
    int? baseId,
    int? veiculoId,
    int? empenhadoParaId,
  }) = _FerramentaImpl;

  factory Ferramenta.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ferramenta(
      id: jsonSerialization['id'] as int?,
      codigoSap: jsonSerialization['codigoSap'] as int,
      descricao: jsonSerialization['descricao'] as String,
      patrimonio: jsonSerialization['patrimonio'] as String?,
      emUso: jsonSerialization['emUso'] as bool,
      tipo: jsonSerialization['tipo'] as String,
      status: jsonSerialization['status'] as String,
      dataAquisicao: jsonSerialization['dataAquisicao'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dataAquisicao']),
      dataUltimaMovimentacao:
          jsonSerialization['dataUltimaMovimentacao'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dataUltimaMovimentacao']),
      unidadeMedidaId: jsonSerialization['unidadeMedidaId'] as int,
      baseId: jsonSerialization['baseId'] as int?,
      veiculoId: jsonSerialization['veiculoId'] as int?,
      empenhadoParaId: jsonSerialization['empenhadoParaId'] as int?,
    );
  }

  static final t = FerramentaTable();

  static const db = FerramentaRepository._();

  @override
  int? id;

  int codigoSap;

  String descricao;

  String? patrimonio;

  bool emUso;

  String tipo;

  String status;

  DateTime? dataAquisicao;

  DateTime? dataUltimaMovimentacao;

  int unidadeMedidaId;

  int? baseId;

  int? veiculoId;

  int? empenhadoParaId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Ferramenta]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ferramenta copyWith({
    int? id,
    int? codigoSap,
    String? descricao,
    String? patrimonio,
    bool? emUso,
    String? tipo,
    String? status,
    DateTime? dataAquisicao,
    DateTime? dataUltimaMovimentacao,
    int? unidadeMedidaId,
    int? baseId,
    int? veiculoId,
    int? empenhadoParaId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      if (patrimonio != null) 'patrimonio': patrimonio,
      'emUso': emUso,
      'tipo': tipo,
      'status': status,
      if (dataAquisicao != null) 'dataAquisicao': dataAquisicao?.toJson(),
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'unidadeMedidaId': unidadeMedidaId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
      if (empenhadoParaId != null) 'empenhadoParaId': empenhadoParaId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      if (patrimonio != null) 'patrimonio': patrimonio,
      'emUso': emUso,
      'tipo': tipo,
      'status': status,
      if (dataAquisicao != null) 'dataAquisicao': dataAquisicao?.toJson(),
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'unidadeMedidaId': unidadeMedidaId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
      if (empenhadoParaId != null) 'empenhadoParaId': empenhadoParaId,
    };
  }

  static FerramentaInclude include() {
    return FerramentaInclude._();
  }

  static FerramentaIncludeList includeList({
    _i1.WhereExpressionBuilder<FerramentaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FerramentaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FerramentaTable>? orderByList,
    FerramentaInclude? include,
  }) {
    return FerramentaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Ferramenta.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Ferramenta.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FerramentaImpl extends Ferramenta {
  _FerramentaImpl({
    int? id,
    required int codigoSap,
    required String descricao,
    String? patrimonio,
    required bool emUso,
    required String tipo,
    required String status,
    DateTime? dataAquisicao,
    DateTime? dataUltimaMovimentacao,
    required int unidadeMedidaId,
    int? baseId,
    int? veiculoId,
    int? empenhadoParaId,
  }) : super._(
          id: id,
          codigoSap: codigoSap,
          descricao: descricao,
          patrimonio: patrimonio,
          emUso: emUso,
          tipo: tipo,
          status: status,
          dataAquisicao: dataAquisicao,
          dataUltimaMovimentacao: dataUltimaMovimentacao,
          unidadeMedidaId: unidadeMedidaId,
          baseId: baseId,
          veiculoId: veiculoId,
          empenhadoParaId: empenhadoParaId,
        );

  /// Returns a shallow copy of this [Ferramenta]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Ferramenta copyWith({
    Object? id = _Undefined,
    int? codigoSap,
    String? descricao,
    Object? patrimonio = _Undefined,
    bool? emUso,
    String? tipo,
    String? status,
    Object? dataAquisicao = _Undefined,
    Object? dataUltimaMovimentacao = _Undefined,
    int? unidadeMedidaId,
    Object? baseId = _Undefined,
    Object? veiculoId = _Undefined,
    Object? empenhadoParaId = _Undefined,
  }) {
    return Ferramenta(
      id: id is int? ? id : this.id,
      codigoSap: codigoSap ?? this.codigoSap,
      descricao: descricao ?? this.descricao,
      patrimonio: patrimonio is String? ? patrimonio : this.patrimonio,
      emUso: emUso ?? this.emUso,
      tipo: tipo ?? this.tipo,
      status: status ?? this.status,
      dataAquisicao:
          dataAquisicao is DateTime? ? dataAquisicao : this.dataAquisicao,
      dataUltimaMovimentacao: dataUltimaMovimentacao is DateTime?
          ? dataUltimaMovimentacao
          : this.dataUltimaMovimentacao,
      unidadeMedidaId: unidadeMedidaId ?? this.unidadeMedidaId,
      baseId: baseId is int? ? baseId : this.baseId,
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
      empenhadoParaId:
          empenhadoParaId is int? ? empenhadoParaId : this.empenhadoParaId,
    );
  }
}

class FerramentaTable extends _i1.Table<int?> {
  FerramentaTable({super.tableRelation}) : super(tableName: 'ferramenta') {
    codigoSap = _i1.ColumnInt(
      'codigoSap',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    patrimonio = _i1.ColumnString(
      'patrimonio',
      this,
    );
    emUso = _i1.ColumnBool(
      'emUso',
      this,
    );
    tipo = _i1.ColumnString(
      'tipo',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    dataAquisicao = _i1.ColumnDateTime(
      'dataAquisicao',
      this,
    );
    dataUltimaMovimentacao = _i1.ColumnDateTime(
      'dataUltimaMovimentacao',
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
    empenhadoParaId = _i1.ColumnInt(
      'empenhadoParaId',
      this,
    );
  }

  late final _i1.ColumnInt codigoSap;

  late final _i1.ColumnString descricao;

  late final _i1.ColumnString patrimonio;

  late final _i1.ColumnBool emUso;

  late final _i1.ColumnString tipo;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime dataAquisicao;

  late final _i1.ColumnDateTime dataUltimaMovimentacao;

  late final _i1.ColumnInt unidadeMedidaId;

  late final _i1.ColumnInt baseId;

  late final _i1.ColumnInt veiculoId;

  late final _i1.ColumnInt empenhadoParaId;

  @override
  List<_i1.Column> get columns => [
        id,
        codigoSap,
        descricao,
        patrimonio,
        emUso,
        tipo,
        status,
        dataAquisicao,
        dataUltimaMovimentacao,
        unidadeMedidaId,
        baseId,
        veiculoId,
        empenhadoParaId,
      ];
}

class FerramentaInclude extends _i1.IncludeObject {
  FerramentaInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Ferramenta.t;
}

class FerramentaIncludeList extends _i1.IncludeList {
  FerramentaIncludeList._({
    _i1.WhereExpressionBuilder<FerramentaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Ferramenta.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Ferramenta.t;
}

class FerramentaRepository {
  const FerramentaRepository._();

  /// Returns a list of [Ferramenta]s matching the given query parameters.
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
  Future<List<Ferramenta>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FerramentaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FerramentaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FerramentaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Ferramenta>(
      where: where?.call(Ferramenta.t),
      orderBy: orderBy?.call(Ferramenta.t),
      orderByList: orderByList?.call(Ferramenta.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Ferramenta] matching the given query parameters.
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
  Future<Ferramenta?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FerramentaTable>? where,
    int? offset,
    _i1.OrderByBuilder<FerramentaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FerramentaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Ferramenta>(
      where: where?.call(Ferramenta.t),
      orderBy: orderBy?.call(Ferramenta.t),
      orderByList: orderByList?.call(Ferramenta.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Ferramenta] by its [id] or null if no such row exists.
  Future<Ferramenta?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Ferramenta>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Ferramenta]s in the list and returns the inserted rows.
  ///
  /// The returned [Ferramenta]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Ferramenta>> insert(
    _i1.Session session,
    List<Ferramenta> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Ferramenta>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Ferramenta] and returns the inserted row.
  ///
  /// The returned [Ferramenta] will have its `id` field set.
  Future<Ferramenta> insertRow(
    _i1.Session session,
    Ferramenta row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Ferramenta>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Ferramenta]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Ferramenta>> update(
    _i1.Session session,
    List<Ferramenta> rows, {
    _i1.ColumnSelections<FerramentaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Ferramenta>(
      rows,
      columns: columns?.call(Ferramenta.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Ferramenta]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Ferramenta> updateRow(
    _i1.Session session,
    Ferramenta row, {
    _i1.ColumnSelections<FerramentaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Ferramenta>(
      row,
      columns: columns?.call(Ferramenta.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Ferramenta]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Ferramenta>> delete(
    _i1.Session session,
    List<Ferramenta> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Ferramenta>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Ferramenta].
  Future<Ferramenta> deleteRow(
    _i1.Session session,
    Ferramenta row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Ferramenta>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Ferramenta>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FerramentaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Ferramenta>(
      where: where(Ferramenta.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FerramentaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Ferramenta>(
      where: where?.call(Ferramenta.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
