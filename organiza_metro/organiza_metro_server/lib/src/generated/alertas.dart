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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'calibracao.dart' as _i3;
import 'movimentacao.dart' as _i4;
import 'material.dart' as _i5;
import 'ferramenta.dart' as _i6;

abstract class Alerta implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Alerta._({
    this.id,
    required this.usuarioIdId,
    this.usuarioId,
    required this.tipo,
    required this.titulo,
    required this.mensagem,
    DateTime? dataCriacao,
    bool? lido,
    this.calibracaoId,
    this.calibracao,
    this.movimentacaoId,
    this.movimentacao,
    this.materialId,
    this.material,
    this.ferramentaId,
    this.ferramenta,
    int? nivelPrioridade,
    bool? ativo,
  })  : dataCriacao = dataCriacao ?? DateTime.now(),
        lido = lido ?? false,
        nivelPrioridade = nivelPrioridade ?? 1,
        ativo = ativo ?? true;

  factory Alerta({
    int? id,
    required int usuarioIdId,
    _i2.UserInfo? usuarioId,
    required String tipo,
    required String titulo,
    required String mensagem,
    DateTime? dataCriacao,
    bool? lido,
    int? calibracaoId,
    _i3.Calibracao? calibracao,
    int? movimentacaoId,
    _i4.Movimentacao? movimentacao,
    int? materialId,
    _i5.Material? material,
    int? ferramentaId,
    _i6.Ferramenta? ferramenta,
    int? nivelPrioridade,
    bool? ativo,
  }) = _AlertaImpl;

  factory Alerta.fromJson(Map<String, dynamic> jsonSerialization) {
    return Alerta(
      id: jsonSerialization['id'] as int?,
      usuarioIdId: jsonSerialization['usuarioIdId'] as int,
      usuarioId: jsonSerialization['usuarioId'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['usuarioId'] as Map<String, dynamic>)),
      tipo: jsonSerialization['tipo'] as String,
      titulo: jsonSerialization['titulo'] as String,
      mensagem: jsonSerialization['mensagem'] as String,
      dataCriacao:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dataCriacao']),
      lido: jsonSerialization['lido'] as bool,
      calibracaoId: jsonSerialization['calibracaoId'] as int?,
      calibracao: jsonSerialization['calibracao'] == null
          ? null
          : _i3.Calibracao.fromJson(
              (jsonSerialization['calibracao'] as Map<String, dynamic>)),
      movimentacaoId: jsonSerialization['movimentacaoId'] as int?,
      movimentacao: jsonSerialization['movimentacao'] == null
          ? null
          : _i4.Movimentacao.fromJson(
              (jsonSerialization['movimentacao'] as Map<String, dynamic>)),
      materialId: jsonSerialization['materialId'] as int?,
      material: jsonSerialization['material'] == null
          ? null
          : _i5.Material.fromJson(
              (jsonSerialization['material'] as Map<String, dynamic>)),
      ferramentaId: jsonSerialization['ferramentaId'] as int?,
      ferramenta: jsonSerialization['ferramenta'] == null
          ? null
          : _i6.Ferramenta.fromJson(
              (jsonSerialization['ferramenta'] as Map<String, dynamic>)),
      nivelPrioridade: jsonSerialization['nivelPrioridade'] as int?,
      ativo: jsonSerialization['ativo'] as bool,
    );
  }

  static final t = AlertaTable();

  static const db = AlertaRepository._();

  @override
  int? id;

  int usuarioIdId;

  _i2.UserInfo? usuarioId;

  String tipo;

  String titulo;

  String mensagem;

  DateTime dataCriacao;

  bool lido;

  int? calibracaoId;

  _i3.Calibracao? calibracao;

  int? movimentacaoId;

  _i4.Movimentacao? movimentacao;

  int? materialId;

  _i5.Material? material;

  int? ferramentaId;

  _i6.Ferramenta? ferramenta;

  int? nivelPrioridade;

  bool ativo;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Alerta]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Alerta copyWith({
    int? id,
    int? usuarioIdId,
    _i2.UserInfo? usuarioId,
    String? tipo,
    String? titulo,
    String? mensagem,
    DateTime? dataCriacao,
    bool? lido,
    int? calibracaoId,
    _i3.Calibracao? calibracao,
    int? movimentacaoId,
    _i4.Movimentacao? movimentacao,
    int? materialId,
    _i5.Material? material,
    int? ferramentaId,
    _i6.Ferramenta? ferramenta,
    int? nivelPrioridade,
    bool? ativo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'usuarioIdId': usuarioIdId,
      if (usuarioId != null) 'usuarioId': usuarioId?.toJson(),
      'tipo': tipo,
      'titulo': titulo,
      'mensagem': mensagem,
      'dataCriacao': dataCriacao.toJson(),
      'lido': lido,
      if (calibracaoId != null) 'calibracaoId': calibracaoId,
      if (calibracao != null) 'calibracao': calibracao?.toJson(),
      if (movimentacaoId != null) 'movimentacaoId': movimentacaoId,
      if (movimentacao != null) 'movimentacao': movimentacao?.toJson(),
      if (materialId != null) 'materialId': materialId,
      if (material != null) 'material': material?.toJson(),
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJson(),
      if (nivelPrioridade != null) 'nivelPrioridade': nivelPrioridade,
      'ativo': ativo,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'usuarioIdId': usuarioIdId,
      if (usuarioId != null) 'usuarioId': usuarioId?.toJsonForProtocol(),
      'tipo': tipo,
      'titulo': titulo,
      'mensagem': mensagem,
      'dataCriacao': dataCriacao.toJson(),
      'lido': lido,
      if (calibracaoId != null) 'calibracaoId': calibracaoId,
      if (calibracao != null) 'calibracao': calibracao?.toJsonForProtocol(),
      if (movimentacaoId != null) 'movimentacaoId': movimentacaoId,
      if (movimentacao != null)
        'movimentacao': movimentacao?.toJsonForProtocol(),
      if (materialId != null) 'materialId': materialId,
      if (material != null) 'material': material?.toJsonForProtocol(),
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJsonForProtocol(),
      if (nivelPrioridade != null) 'nivelPrioridade': nivelPrioridade,
      'ativo': ativo,
    };
  }

  static AlertaInclude include({
    _i2.UserInfoInclude? usuarioId,
    _i3.CalibracaoInclude? calibracao,
    _i4.MovimentacaoInclude? movimentacao,
    _i5.MaterialInclude? material,
    _i6.FerramentaInclude? ferramenta,
  }) {
    return AlertaInclude._(
      usuarioId: usuarioId,
      calibracao: calibracao,
      movimentacao: movimentacao,
      material: material,
      ferramenta: ferramenta,
    );
  }

  static AlertaIncludeList includeList({
    _i1.WhereExpressionBuilder<AlertaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AlertaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlertaTable>? orderByList,
    AlertaInclude? include,
  }) {
    return AlertaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Alerta.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Alerta.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AlertaImpl extends Alerta {
  _AlertaImpl({
    int? id,
    required int usuarioIdId,
    _i2.UserInfo? usuarioId,
    required String tipo,
    required String titulo,
    required String mensagem,
    DateTime? dataCriacao,
    bool? lido,
    int? calibracaoId,
    _i3.Calibracao? calibracao,
    int? movimentacaoId,
    _i4.Movimentacao? movimentacao,
    int? materialId,
    _i5.Material? material,
    int? ferramentaId,
    _i6.Ferramenta? ferramenta,
    int? nivelPrioridade,
    bool? ativo,
  }) : super._(
          id: id,
          usuarioIdId: usuarioIdId,
          usuarioId: usuarioId,
          tipo: tipo,
          titulo: titulo,
          mensagem: mensagem,
          dataCriacao: dataCriacao,
          lido: lido,
          calibracaoId: calibracaoId,
          calibracao: calibracao,
          movimentacaoId: movimentacaoId,
          movimentacao: movimentacao,
          materialId: materialId,
          material: material,
          ferramentaId: ferramentaId,
          ferramenta: ferramenta,
          nivelPrioridade: nivelPrioridade,
          ativo: ativo,
        );

  /// Returns a shallow copy of this [Alerta]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Alerta copyWith({
    Object? id = _Undefined,
    int? usuarioIdId,
    Object? usuarioId = _Undefined,
    String? tipo,
    String? titulo,
    String? mensagem,
    DateTime? dataCriacao,
    bool? lido,
    Object? calibracaoId = _Undefined,
    Object? calibracao = _Undefined,
    Object? movimentacaoId = _Undefined,
    Object? movimentacao = _Undefined,
    Object? materialId = _Undefined,
    Object? material = _Undefined,
    Object? ferramentaId = _Undefined,
    Object? ferramenta = _Undefined,
    Object? nivelPrioridade = _Undefined,
    bool? ativo,
  }) {
    return Alerta(
      id: id is int? ? id : this.id,
      usuarioIdId: usuarioIdId ?? this.usuarioIdId,
      usuarioId:
          usuarioId is _i2.UserInfo? ? usuarioId : this.usuarioId?.copyWith(),
      tipo: tipo ?? this.tipo,
      titulo: titulo ?? this.titulo,
      mensagem: mensagem ?? this.mensagem,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      lido: lido ?? this.lido,
      calibracaoId: calibracaoId is int? ? calibracaoId : this.calibracaoId,
      calibracao: calibracao is _i3.Calibracao?
          ? calibracao
          : this.calibracao?.copyWith(),
      movimentacaoId:
          movimentacaoId is int? ? movimentacaoId : this.movimentacaoId,
      movimentacao: movimentacao is _i4.Movimentacao?
          ? movimentacao
          : this.movimentacao?.copyWith(),
      materialId: materialId is int? ? materialId : this.materialId,
      material:
          material is _i5.Material? ? material : this.material?.copyWith(),
      ferramentaId: ferramentaId is int? ? ferramentaId : this.ferramentaId,
      ferramenta: ferramenta is _i6.Ferramenta?
          ? ferramenta
          : this.ferramenta?.copyWith(),
      nivelPrioridade:
          nivelPrioridade is int? ? nivelPrioridade : this.nivelPrioridade,
      ativo: ativo ?? this.ativo,
    );
  }
}

class AlertaTable extends _i1.Table<int?> {
  AlertaTable({super.tableRelation}) : super(tableName: 'alertas') {
    usuarioIdId = _i1.ColumnInt(
      'usuarioIdId',
      this,
    );
    tipo = _i1.ColumnString(
      'tipo',
      this,
    );
    titulo = _i1.ColumnString(
      'titulo',
      this,
    );
    mensagem = _i1.ColumnString(
      'mensagem',
      this,
    );
    dataCriacao = _i1.ColumnDateTime(
      'dataCriacao',
      this,
      hasDefault: true,
    );
    lido = _i1.ColumnBool(
      'lido',
      this,
      hasDefault: true,
    );
    calibracaoId = _i1.ColumnInt(
      'calibracaoId',
      this,
    );
    movimentacaoId = _i1.ColumnInt(
      'movimentacaoId',
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
    nivelPrioridade = _i1.ColumnInt(
      'nivelPrioridade',
      this,
      hasDefault: true,
    );
    ativo = _i1.ColumnBool(
      'ativo',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt usuarioIdId;

  _i2.UserInfoTable? _usuarioId;

  late final _i1.ColumnString tipo;

  late final _i1.ColumnString titulo;

  late final _i1.ColumnString mensagem;

  late final _i1.ColumnDateTime dataCriacao;

  late final _i1.ColumnBool lido;

  late final _i1.ColumnInt calibracaoId;

  _i3.CalibracaoTable? _calibracao;

  late final _i1.ColumnInt movimentacaoId;

  _i4.MovimentacaoTable? _movimentacao;

  late final _i1.ColumnInt materialId;

  _i5.MaterialTable? _material;

  late final _i1.ColumnInt ferramentaId;

  _i6.FerramentaTable? _ferramenta;

  late final _i1.ColumnInt nivelPrioridade;

  late final _i1.ColumnBool ativo;

  _i2.UserInfoTable get usuarioId {
    if (_usuarioId != null) return _usuarioId!;
    _usuarioId = _i1.createRelationTable(
      relationFieldName: 'usuarioId',
      field: Alerta.t.usuarioIdId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _usuarioId!;
  }

  _i3.CalibracaoTable get calibracao {
    if (_calibracao != null) return _calibracao!;
    _calibracao = _i1.createRelationTable(
      relationFieldName: 'calibracao',
      field: Alerta.t.calibracaoId,
      foreignField: _i3.Calibracao.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CalibracaoTable(tableRelation: foreignTableRelation),
    );
    return _calibracao!;
  }

  _i4.MovimentacaoTable get movimentacao {
    if (_movimentacao != null) return _movimentacao!;
    _movimentacao = _i1.createRelationTable(
      relationFieldName: 'movimentacao',
      field: Alerta.t.movimentacaoId,
      foreignField: _i4.Movimentacao.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.MovimentacaoTable(tableRelation: foreignTableRelation),
    );
    return _movimentacao!;
  }

  _i5.MaterialTable get material {
    if (_material != null) return _material!;
    _material = _i1.createRelationTable(
      relationFieldName: 'material',
      field: Alerta.t.materialId,
      foreignField: _i5.Material.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MaterialTable(tableRelation: foreignTableRelation),
    );
    return _material!;
  }

  _i6.FerramentaTable get ferramenta {
    if (_ferramenta != null) return _ferramenta!;
    _ferramenta = _i1.createRelationTable(
      relationFieldName: 'ferramenta',
      field: Alerta.t.ferramentaId,
      foreignField: _i6.Ferramenta.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.FerramentaTable(tableRelation: foreignTableRelation),
    );
    return _ferramenta!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        usuarioIdId,
        tipo,
        titulo,
        mensagem,
        dataCriacao,
        lido,
        calibracaoId,
        movimentacaoId,
        materialId,
        ferramentaId,
        nivelPrioridade,
        ativo,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'usuarioId') {
      return usuarioId;
    }
    if (relationField == 'calibracao') {
      return calibracao;
    }
    if (relationField == 'movimentacao') {
      return movimentacao;
    }
    if (relationField == 'material') {
      return material;
    }
    if (relationField == 'ferramenta') {
      return ferramenta;
    }
    return null;
  }
}

class AlertaInclude extends _i1.IncludeObject {
  AlertaInclude._({
    _i2.UserInfoInclude? usuarioId,
    _i3.CalibracaoInclude? calibracao,
    _i4.MovimentacaoInclude? movimentacao,
    _i5.MaterialInclude? material,
    _i6.FerramentaInclude? ferramenta,
  }) {
    _usuarioId = usuarioId;
    _calibracao = calibracao;
    _movimentacao = movimentacao;
    _material = material;
    _ferramenta = ferramenta;
  }

  _i2.UserInfoInclude? _usuarioId;

  _i3.CalibracaoInclude? _calibracao;

  _i4.MovimentacaoInclude? _movimentacao;

  _i5.MaterialInclude? _material;

  _i6.FerramentaInclude? _ferramenta;

  @override
  Map<String, _i1.Include?> get includes => {
        'usuarioId': _usuarioId,
        'calibracao': _calibracao,
        'movimentacao': _movimentacao,
        'material': _material,
        'ferramenta': _ferramenta,
      };

  @override
  _i1.Table<int?> get table => Alerta.t;
}

class AlertaIncludeList extends _i1.IncludeList {
  AlertaIncludeList._({
    _i1.WhereExpressionBuilder<AlertaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Alerta.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Alerta.t;
}

class AlertaRepository {
  const AlertaRepository._();

  final attachRow = const AlertaAttachRowRepository._();

  final detachRow = const AlertaDetachRowRepository._();

  /// Returns a list of [Alerta]s matching the given query parameters.
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
  Future<List<Alerta>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlertaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AlertaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlertaTable>? orderByList,
    _i1.Transaction? transaction,
    AlertaInclude? include,
  }) async {
    return session.db.find<Alerta>(
      where: where?.call(Alerta.t),
      orderBy: orderBy?.call(Alerta.t),
      orderByList: orderByList?.call(Alerta.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Alerta] matching the given query parameters.
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
  Future<Alerta?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlertaTable>? where,
    int? offset,
    _i1.OrderByBuilder<AlertaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlertaTable>? orderByList,
    _i1.Transaction? transaction,
    AlertaInclude? include,
  }) async {
    return session.db.findFirstRow<Alerta>(
      where: where?.call(Alerta.t),
      orderBy: orderBy?.call(Alerta.t),
      orderByList: orderByList?.call(Alerta.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Alerta] by its [id] or null if no such row exists.
  Future<Alerta?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AlertaInclude? include,
  }) async {
    return session.db.findById<Alerta>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Alerta]s in the list and returns the inserted rows.
  ///
  /// The returned [Alerta]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Alerta>> insert(
    _i1.Session session,
    List<Alerta> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Alerta>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Alerta] and returns the inserted row.
  ///
  /// The returned [Alerta] will have its `id` field set.
  Future<Alerta> insertRow(
    _i1.Session session,
    Alerta row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Alerta>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Alerta]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Alerta>> update(
    _i1.Session session,
    List<Alerta> rows, {
    _i1.ColumnSelections<AlertaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Alerta>(
      rows,
      columns: columns?.call(Alerta.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Alerta]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Alerta> updateRow(
    _i1.Session session,
    Alerta row, {
    _i1.ColumnSelections<AlertaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Alerta>(
      row,
      columns: columns?.call(Alerta.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Alerta]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Alerta>> delete(
    _i1.Session session,
    List<Alerta> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Alerta>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Alerta].
  Future<Alerta> deleteRow(
    _i1.Session session,
    Alerta row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Alerta>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Alerta>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AlertaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Alerta>(
      where: where(Alerta.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlertaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Alerta>(
      where: where?.call(Alerta.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AlertaAttachRowRepository {
  const AlertaAttachRowRepository._();

  /// Creates a relation between the given [Alerta] and [UserInfo]
  /// by setting the [Alerta]'s foreign key `usuarioIdId` to refer to the [UserInfo].
  Future<void> usuarioId(
    _i1.Session session,
    Alerta alerta,
    _i2.UserInfo usuarioId, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }
    if (usuarioId.id == null) {
      throw ArgumentError.notNull('usuarioId.id');
    }

    var $alerta = alerta.copyWith(usuarioIdId: usuarioId.id);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.usuarioIdId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Alerta] and [Calibracao]
  /// by setting the [Alerta]'s foreign key `calibracaoId` to refer to the [Calibracao].
  Future<void> calibracao(
    _i1.Session session,
    Alerta alerta,
    _i3.Calibracao calibracao, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }
    if (calibracao.id == null) {
      throw ArgumentError.notNull('calibracao.id');
    }

    var $alerta = alerta.copyWith(calibracaoId: calibracao.id);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.calibracaoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Alerta] and [Movimentacao]
  /// by setting the [Alerta]'s foreign key `movimentacaoId` to refer to the [Movimentacao].
  Future<void> movimentacao(
    _i1.Session session,
    Alerta alerta,
    _i4.Movimentacao movimentacao, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }

    var $alerta = alerta.copyWith(movimentacaoId: movimentacao.id);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.movimentacaoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Alerta] and [Material]
  /// by setting the [Alerta]'s foreign key `materialId` to refer to the [Material].
  Future<void> material(
    _i1.Session session,
    Alerta alerta,
    _i5.Material material, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }

    var $alerta = alerta.copyWith(materialId: material.id);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.materialId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Alerta] and [Ferramenta]
  /// by setting the [Alerta]'s foreign key `ferramentaId` to refer to the [Ferramenta].
  Future<void> ferramenta(
    _i1.Session session,
    Alerta alerta,
    _i6.Ferramenta ferramenta, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }
    if (ferramenta.id == null) {
      throw ArgumentError.notNull('ferramenta.id');
    }

    var $alerta = alerta.copyWith(ferramentaId: ferramenta.id);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.ferramentaId],
      transaction: transaction,
    );
  }
}

class AlertaDetachRowRepository {
  const AlertaDetachRowRepository._();

  /// Detaches the relation between this [Alerta] and the [Calibracao] set in `calibracao`
  /// by setting the [Alerta]'s foreign key `calibracaoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> calibracao(
    _i1.Session session,
    Alerta alerta, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }

    var $alerta = alerta.copyWith(calibracaoId: null);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.calibracaoId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Alerta] and the [Movimentacao] set in `movimentacao`
  /// by setting the [Alerta]'s foreign key `movimentacaoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> movimentacao(
    _i1.Session session,
    Alerta alerta, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }

    var $alerta = alerta.copyWith(movimentacaoId: null);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.movimentacaoId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Alerta] and the [Material] set in `material`
  /// by setting the [Alerta]'s foreign key `materialId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> material(
    _i1.Session session,
    Alerta alerta, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }

    var $alerta = alerta.copyWith(materialId: null);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.materialId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Alerta] and the [Ferramenta] set in `ferramenta`
  /// by setting the [Alerta]'s foreign key `ferramentaId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ferramenta(
    _i1.Session session,
    Alerta alerta, {
    _i1.Transaction? transaction,
  }) async {
    if (alerta.id == null) {
      throw ArgumentError.notNull('alerta.id');
    }

    var $alerta = alerta.copyWith(ferramentaId: null);
    await session.db.updateRow<Alerta>(
      $alerta,
      columns: [Alerta.t.ferramentaId],
      transaction: transaction,
    );
  }
}
