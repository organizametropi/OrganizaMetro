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

abstract class Movimentacao
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Movimentacao._({
    this.id,
    required this.usuarioId,
    this.materialId,
    this.ferramentaId,
    required this.quantidade,
    required this.tipoMovimentacao,
    required this.dataMovimentacao,
    this.dataDevolucao,
    this.modalidadeEntrega,
    this.observacao,
    this.origemBaseId,
    this.destinoBaseId,
    this.origemVeiculoId,
    this.destinoVeiculoId,
  });

  factory Movimentacao({
    int? id,
    required int usuarioId,
    int? materialId,
    int? ferramentaId,
    required double quantidade,
    required String tipoMovimentacao,
    required DateTime dataMovimentacao,
    DateTime? dataDevolucao,
    String? modalidadeEntrega,
    String? observacao,
    int? origemBaseId,
    int? destinoBaseId,
    int? origemVeiculoId,
    int? destinoVeiculoId,
  }) = _MovimentacaoImpl;

  factory Movimentacao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Movimentacao(
      id: jsonSerialization['id'] as int?,
      usuarioId: jsonSerialization['usuarioId'] as int,
      materialId: jsonSerialization['materialId'] as int?,
      ferramentaId: jsonSerialization['ferramentaId'] as int?,
      quantidade: (jsonSerialization['quantidade'] as num).toDouble(),
      tipoMovimentacao: jsonSerialization['tipoMovimentacao'] as String,
      dataMovimentacao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dataMovimentacao']),
      dataDevolucao: jsonSerialization['dataDevolucao'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dataDevolucao']),
      modalidadeEntrega: jsonSerialization['modalidadeEntrega'] as String?,
      observacao: jsonSerialization['observacao'] as String?,
      origemBaseId: jsonSerialization['origemBaseId'] as int?,
      destinoBaseId: jsonSerialization['destinoBaseId'] as int?,
      origemVeiculoId: jsonSerialization['origemVeiculoId'] as int?,
      destinoVeiculoId: jsonSerialization['destinoVeiculoId'] as int?,
    );
  }

  static final t = MovimentacaoTable();

  static const db = MovimentacaoRepository._();

  @override
  int? id;

  int usuarioId;

  int? materialId;

  int? ferramentaId;

  double quantidade;

  String tipoMovimentacao;

  DateTime dataMovimentacao;

  DateTime? dataDevolucao;

  String? modalidadeEntrega;

  String? observacao;

  int? origemBaseId;

  int? destinoBaseId;

  int? origemVeiculoId;

  int? destinoVeiculoId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Movimentacao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Movimentacao copyWith({
    int? id,
    int? usuarioId,
    int? materialId,
    int? ferramentaId,
    double? quantidade,
    String? tipoMovimentacao,
    DateTime? dataMovimentacao,
    DateTime? dataDevolucao,
    String? modalidadeEntrega,
    String? observacao,
    int? origemBaseId,
    int? destinoBaseId,
    int? origemVeiculoId,
    int? destinoVeiculoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'usuarioId': usuarioId,
      if (materialId != null) 'materialId': materialId,
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      'quantidade': quantidade,
      'tipoMovimentacao': tipoMovimentacao,
      'dataMovimentacao': dataMovimentacao.toJson(),
      if (dataDevolucao != null) 'dataDevolucao': dataDevolucao?.toJson(),
      if (modalidadeEntrega != null) 'modalidadeEntrega': modalidadeEntrega,
      if (observacao != null) 'observacao': observacao,
      if (origemBaseId != null) 'origemBaseId': origemBaseId,
      if (destinoBaseId != null) 'destinoBaseId': destinoBaseId,
      if (origemVeiculoId != null) 'origemVeiculoId': origemVeiculoId,
      if (destinoVeiculoId != null) 'destinoVeiculoId': destinoVeiculoId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'usuarioId': usuarioId,
      if (materialId != null) 'materialId': materialId,
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      'quantidade': quantidade,
      'tipoMovimentacao': tipoMovimentacao,
      'dataMovimentacao': dataMovimentacao.toJson(),
      if (dataDevolucao != null) 'dataDevolucao': dataDevolucao?.toJson(),
      if (modalidadeEntrega != null) 'modalidadeEntrega': modalidadeEntrega,
      if (observacao != null) 'observacao': observacao,
      if (origemBaseId != null) 'origemBaseId': origemBaseId,
      if (destinoBaseId != null) 'destinoBaseId': destinoBaseId,
      if (origemVeiculoId != null) 'origemVeiculoId': origemVeiculoId,
      if (destinoVeiculoId != null) 'destinoVeiculoId': destinoVeiculoId,
    };
  }

  static MovimentacaoInclude include() {
    return MovimentacaoInclude._();
  }

  static MovimentacaoIncludeList includeList({
    _i1.WhereExpressionBuilder<MovimentacaoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovimentacaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovimentacaoTable>? orderByList,
    MovimentacaoInclude? include,
  }) {
    return MovimentacaoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Movimentacao.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Movimentacao.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MovimentacaoImpl extends Movimentacao {
  _MovimentacaoImpl({
    int? id,
    required int usuarioId,
    int? materialId,
    int? ferramentaId,
    required double quantidade,
    required String tipoMovimentacao,
    required DateTime dataMovimentacao,
    DateTime? dataDevolucao,
    String? modalidadeEntrega,
    String? observacao,
    int? origemBaseId,
    int? destinoBaseId,
    int? origemVeiculoId,
    int? destinoVeiculoId,
  }) : super._(
          id: id,
          usuarioId: usuarioId,
          materialId: materialId,
          ferramentaId: ferramentaId,
          quantidade: quantidade,
          tipoMovimentacao: tipoMovimentacao,
          dataMovimentacao: dataMovimentacao,
          dataDevolucao: dataDevolucao,
          modalidadeEntrega: modalidadeEntrega,
          observacao: observacao,
          origemBaseId: origemBaseId,
          destinoBaseId: destinoBaseId,
          origemVeiculoId: origemVeiculoId,
          destinoVeiculoId: destinoVeiculoId,
        );

  /// Returns a shallow copy of this [Movimentacao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Movimentacao copyWith({
    Object? id = _Undefined,
    int? usuarioId,
    Object? materialId = _Undefined,
    Object? ferramentaId = _Undefined,
    double? quantidade,
    String? tipoMovimentacao,
    DateTime? dataMovimentacao,
    Object? dataDevolucao = _Undefined,
    Object? modalidadeEntrega = _Undefined,
    Object? observacao = _Undefined,
    Object? origemBaseId = _Undefined,
    Object? destinoBaseId = _Undefined,
    Object? origemVeiculoId = _Undefined,
    Object? destinoVeiculoId = _Undefined,
  }) {
    return Movimentacao(
      id: id is int? ? id : this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      materialId: materialId is int? ? materialId : this.materialId,
      ferramentaId: ferramentaId is int? ? ferramentaId : this.ferramentaId,
      quantidade: quantidade ?? this.quantidade,
      tipoMovimentacao: tipoMovimentacao ?? this.tipoMovimentacao,
      dataMovimentacao: dataMovimentacao ?? this.dataMovimentacao,
      dataDevolucao:
          dataDevolucao is DateTime? ? dataDevolucao : this.dataDevolucao,
      modalidadeEntrega: modalidadeEntrega is String?
          ? modalidadeEntrega
          : this.modalidadeEntrega,
      observacao: observacao is String? ? observacao : this.observacao,
      origemBaseId: origemBaseId is int? ? origemBaseId : this.origemBaseId,
      destinoBaseId: destinoBaseId is int? ? destinoBaseId : this.destinoBaseId,
      origemVeiculoId:
          origemVeiculoId is int? ? origemVeiculoId : this.origemVeiculoId,
      destinoVeiculoId:
          destinoVeiculoId is int? ? destinoVeiculoId : this.destinoVeiculoId,
    );
  }
}

class MovimentacaoTable extends _i1.Table<int?> {
  MovimentacaoTable({super.tableRelation}) : super(tableName: 'movimentacao') {
    usuarioId = _i1.ColumnInt(
      'usuarioId',
      this,
    );
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
    tipoMovimentacao = _i1.ColumnString(
      'tipoMovimentacao',
      this,
    );
    dataMovimentacao = _i1.ColumnDateTime(
      'dataMovimentacao',
      this,
    );
    dataDevolucao = _i1.ColumnDateTime(
      'dataDevolucao',
      this,
    );
    modalidadeEntrega = _i1.ColumnString(
      'modalidadeEntrega',
      this,
    );
    observacao = _i1.ColumnString(
      'observacao',
      this,
    );
    origemBaseId = _i1.ColumnInt(
      'origemBaseId',
      this,
    );
    destinoBaseId = _i1.ColumnInt(
      'destinoBaseId',
      this,
    );
    origemVeiculoId = _i1.ColumnInt(
      'origemVeiculoId',
      this,
    );
    destinoVeiculoId = _i1.ColumnInt(
      'destinoVeiculoId',
      this,
    );
  }

  late final _i1.ColumnInt usuarioId;

  late final _i1.ColumnInt materialId;

  late final _i1.ColumnInt ferramentaId;

  late final _i1.ColumnDouble quantidade;

  late final _i1.ColumnString tipoMovimentacao;

  late final _i1.ColumnDateTime dataMovimentacao;

  late final _i1.ColumnDateTime dataDevolucao;

  late final _i1.ColumnString modalidadeEntrega;

  late final _i1.ColumnString observacao;

  late final _i1.ColumnInt origemBaseId;

  late final _i1.ColumnInt destinoBaseId;

  late final _i1.ColumnInt origemVeiculoId;

  late final _i1.ColumnInt destinoVeiculoId;

  @override
  List<_i1.Column> get columns => [
        id,
        usuarioId,
        materialId,
        ferramentaId,
        quantidade,
        tipoMovimentacao,
        dataMovimentacao,
        dataDevolucao,
        modalidadeEntrega,
        observacao,
        origemBaseId,
        destinoBaseId,
        origemVeiculoId,
        destinoVeiculoId,
      ];
}

class MovimentacaoInclude extends _i1.IncludeObject {
  MovimentacaoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Movimentacao.t;
}

class MovimentacaoIncludeList extends _i1.IncludeList {
  MovimentacaoIncludeList._({
    _i1.WhereExpressionBuilder<MovimentacaoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Movimentacao.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Movimentacao.t;
}

class MovimentacaoRepository {
  const MovimentacaoRepository._();

  /// Returns a list of [Movimentacao]s matching the given query parameters.
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
  Future<List<Movimentacao>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovimentacaoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovimentacaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovimentacaoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Movimentacao>(
      where: where?.call(Movimentacao.t),
      orderBy: orderBy?.call(Movimentacao.t),
      orderByList: orderByList?.call(Movimentacao.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Movimentacao] matching the given query parameters.
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
  Future<Movimentacao?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovimentacaoTable>? where,
    int? offset,
    _i1.OrderByBuilder<MovimentacaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovimentacaoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Movimentacao>(
      where: where?.call(Movimentacao.t),
      orderBy: orderBy?.call(Movimentacao.t),
      orderByList: orderByList?.call(Movimentacao.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Movimentacao] by its [id] or null if no such row exists.
  Future<Movimentacao?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Movimentacao>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Movimentacao]s in the list and returns the inserted rows.
  ///
  /// The returned [Movimentacao]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Movimentacao>> insert(
    _i1.Session session,
    List<Movimentacao> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Movimentacao>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Movimentacao] and returns the inserted row.
  ///
  /// The returned [Movimentacao] will have its `id` field set.
  Future<Movimentacao> insertRow(
    _i1.Session session,
    Movimentacao row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Movimentacao>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Movimentacao]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Movimentacao>> update(
    _i1.Session session,
    List<Movimentacao> rows, {
    _i1.ColumnSelections<MovimentacaoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Movimentacao>(
      rows,
      columns: columns?.call(Movimentacao.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Movimentacao]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Movimentacao> updateRow(
    _i1.Session session,
    Movimentacao row, {
    _i1.ColumnSelections<MovimentacaoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Movimentacao>(
      row,
      columns: columns?.call(Movimentacao.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Movimentacao]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Movimentacao>> delete(
    _i1.Session session,
    List<Movimentacao> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Movimentacao>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Movimentacao].
  Future<Movimentacao> deleteRow(
    _i1.Session session,
    Movimentacao row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Movimentacao>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Movimentacao>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MovimentacaoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Movimentacao>(
      where: where(Movimentacao.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovimentacaoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Movimentacao>(
      where: where?.call(Movimentacao.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
