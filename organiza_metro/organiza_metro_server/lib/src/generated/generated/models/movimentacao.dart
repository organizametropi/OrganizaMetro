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
import '../../generated/models/material.dart' as _i3;
import '../../generated/models/ferramenta.dart' as _i4;
import '../../generated/models/base.dart' as _i5;
import '../../generated/models/veiculo.dart' as _i6;

abstract class Movimentacao
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Movimentacao._({
    this.id,
    required this.usuarioId,
    this.usuario,
    required this.materialId,
    this.material,
    required this.ferramentaId,
    this.ferramenta,
    this.quantidade,
    required this.tipoMovimentacao,
    required this.dataMovimentacao,
    this.dataDevolucao,
    this.modalidadeEntrega,
    this.observacao,
    required this.origemBaseId,
    this.origemBase,
    required this.destinoBaseId,
    this.destinoBase,
    required this.origemVeiculoId,
    this.origemVeiculo,
    required this.destinoVeiculoId,
    this.destinoVeiculo,
  });

  factory Movimentacao({
    int? id,
    required int usuarioId,
    _i2.UserInfo? usuario,
    required int materialId,
    _i3.Material? material,
    required int ferramentaId,
    _i4.Ferramenta? ferramenta,
    double? quantidade,
    required String tipoMovimentacao,
    required DateTime dataMovimentacao,
    DateTime? dataDevolucao,
    String? modalidadeEntrega,
    String? observacao,
    required int origemBaseId,
    _i5.Base? origemBase,
    required int destinoBaseId,
    _i5.Base? destinoBase,
    required int origemVeiculoId,
    _i6.Veiculo? origemVeiculo,
    required int destinoVeiculoId,
    _i6.Veiculo? destinoVeiculo,
  }) = _MovimentacaoImpl;

  factory Movimentacao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Movimentacao(
      id: jsonSerialization['id'] as int?,
      usuarioId: jsonSerialization['usuarioId'] as int,
      usuario: jsonSerialization['usuario'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['usuario'] as Map<String, dynamic>)),
      materialId: jsonSerialization['materialId'] as int,
      material: jsonSerialization['material'] == null
          ? null
          : _i3.Material.fromJson(
              (jsonSerialization['material'] as Map<String, dynamic>)),
      ferramentaId: jsonSerialization['ferramentaId'] as int,
      ferramenta: jsonSerialization['ferramenta'] == null
          ? null
          : _i4.Ferramenta.fromJson(
              (jsonSerialization['ferramenta'] as Map<String, dynamic>)),
      quantidade: (jsonSerialization['quantidade'] as num?)?.toDouble(),
      tipoMovimentacao: jsonSerialization['tipoMovimentacao'] as String,
      dataMovimentacao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dataMovimentacao']),
      dataDevolucao: jsonSerialization['dataDevolucao'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dataDevolucao']),
      modalidadeEntrega: jsonSerialization['modalidadeEntrega'] as String?,
      observacao: jsonSerialization['observacao'] as String?,
      origemBaseId: jsonSerialization['origemBaseId'] as int,
      origemBase: jsonSerialization['origemBase'] == null
          ? null
          : _i5.Base.fromJson(
              (jsonSerialization['origemBase'] as Map<String, dynamic>)),
      destinoBaseId: jsonSerialization['destinoBaseId'] as int,
      destinoBase: jsonSerialization['destinoBase'] == null
          ? null
          : _i5.Base.fromJson(
              (jsonSerialization['destinoBase'] as Map<String, dynamic>)),
      origemVeiculoId: jsonSerialization['origemVeiculoId'] as int,
      origemVeiculo: jsonSerialization['origemVeiculo'] == null
          ? null
          : _i6.Veiculo.fromJson(
              (jsonSerialization['origemVeiculo'] as Map<String, dynamic>)),
      destinoVeiculoId: jsonSerialization['destinoVeiculoId'] as int,
      destinoVeiculo: jsonSerialization['destinoVeiculo'] == null
          ? null
          : _i6.Veiculo.fromJson(
              (jsonSerialization['destinoVeiculo'] as Map<String, dynamic>)),
    );
  }

  static final t = MovimentacaoTable();

  static const db = MovimentacaoRepository._();

  @override
  int? id;

  int usuarioId;

  _i2.UserInfo? usuario;

  int materialId;

  _i3.Material? material;

  int ferramentaId;

  _i4.Ferramenta? ferramenta;

  double? quantidade;

  String tipoMovimentacao;

  DateTime dataMovimentacao;

  DateTime? dataDevolucao;

  String? modalidadeEntrega;

  String? observacao;

  int origemBaseId;

  _i5.Base? origemBase;

  int destinoBaseId;

  _i5.Base? destinoBase;

  int origemVeiculoId;

  _i6.Veiculo? origemVeiculo;

  int destinoVeiculoId;

  _i6.Veiculo? destinoVeiculo;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Movimentacao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Movimentacao copyWith({
    int? id,
    int? usuarioId,
    _i2.UserInfo? usuario,
    int? materialId,
    _i3.Material? material,
    int? ferramentaId,
    _i4.Ferramenta? ferramenta,
    double? quantidade,
    String? tipoMovimentacao,
    DateTime? dataMovimentacao,
    DateTime? dataDevolucao,
    String? modalidadeEntrega,
    String? observacao,
    int? origemBaseId,
    _i5.Base? origemBase,
    int? destinoBaseId,
    _i5.Base? destinoBase,
    int? origemVeiculoId,
    _i6.Veiculo? origemVeiculo,
    int? destinoVeiculoId,
    _i6.Veiculo? destinoVeiculo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'usuarioId': usuarioId,
      if (usuario != null) 'usuario': usuario?.toJson(),
      'materialId': materialId,
      if (material != null) 'material': material?.toJson(),
      'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJson(),
      if (quantidade != null) 'quantidade': quantidade,
      'tipoMovimentacao': tipoMovimentacao,
      'dataMovimentacao': dataMovimentacao.toJson(),
      if (dataDevolucao != null) 'dataDevolucao': dataDevolucao?.toJson(),
      if (modalidadeEntrega != null) 'modalidadeEntrega': modalidadeEntrega,
      if (observacao != null) 'observacao': observacao,
      'origemBaseId': origemBaseId,
      if (origemBase != null) 'origemBase': origemBase?.toJson(),
      'destinoBaseId': destinoBaseId,
      if (destinoBase != null) 'destinoBase': destinoBase?.toJson(),
      'origemVeiculoId': origemVeiculoId,
      if (origemVeiculo != null) 'origemVeiculo': origemVeiculo?.toJson(),
      'destinoVeiculoId': destinoVeiculoId,
      if (destinoVeiculo != null) 'destinoVeiculo': destinoVeiculo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'usuarioId': usuarioId,
      if (usuario != null) 'usuario': usuario?.toJsonForProtocol(),
      'materialId': materialId,
      if (material != null) 'material': material?.toJsonForProtocol(),
      'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJsonForProtocol(),
      if (quantidade != null) 'quantidade': quantidade,
      'tipoMovimentacao': tipoMovimentacao,
      'dataMovimentacao': dataMovimentacao.toJson(),
      if (dataDevolucao != null) 'dataDevolucao': dataDevolucao?.toJson(),
      if (modalidadeEntrega != null) 'modalidadeEntrega': modalidadeEntrega,
      if (observacao != null) 'observacao': observacao,
      'origemBaseId': origemBaseId,
      if (origemBase != null) 'origemBase': origemBase?.toJsonForProtocol(),
      'destinoBaseId': destinoBaseId,
      if (destinoBase != null) 'destinoBase': destinoBase?.toJsonForProtocol(),
      'origemVeiculoId': origemVeiculoId,
      if (origemVeiculo != null)
        'origemVeiculo': origemVeiculo?.toJsonForProtocol(),
      'destinoVeiculoId': destinoVeiculoId,
      if (destinoVeiculo != null)
        'destinoVeiculo': destinoVeiculo?.toJsonForProtocol(),
    };
  }

  static MovimentacaoInclude include({
    _i2.UserInfoInclude? usuario,
    _i3.MaterialInclude? material,
    _i4.FerramentaInclude? ferramenta,
    _i5.BaseInclude? origemBase,
    _i5.BaseInclude? destinoBase,
    _i6.VeiculoInclude? origemVeiculo,
    _i6.VeiculoInclude? destinoVeiculo,
  }) {
    return MovimentacaoInclude._(
      usuario: usuario,
      material: material,
      ferramenta: ferramenta,
      origemBase: origemBase,
      destinoBase: destinoBase,
      origemVeiculo: origemVeiculo,
      destinoVeiculo: destinoVeiculo,
    );
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
    _i2.UserInfo? usuario,
    required int materialId,
    _i3.Material? material,
    required int ferramentaId,
    _i4.Ferramenta? ferramenta,
    double? quantidade,
    required String tipoMovimentacao,
    required DateTime dataMovimentacao,
    DateTime? dataDevolucao,
    String? modalidadeEntrega,
    String? observacao,
    required int origemBaseId,
    _i5.Base? origemBase,
    required int destinoBaseId,
    _i5.Base? destinoBase,
    required int origemVeiculoId,
    _i6.Veiculo? origemVeiculo,
    required int destinoVeiculoId,
    _i6.Veiculo? destinoVeiculo,
  }) : super._(
          id: id,
          usuarioId: usuarioId,
          usuario: usuario,
          materialId: materialId,
          material: material,
          ferramentaId: ferramentaId,
          ferramenta: ferramenta,
          quantidade: quantidade,
          tipoMovimentacao: tipoMovimentacao,
          dataMovimentacao: dataMovimentacao,
          dataDevolucao: dataDevolucao,
          modalidadeEntrega: modalidadeEntrega,
          observacao: observacao,
          origemBaseId: origemBaseId,
          origemBase: origemBase,
          destinoBaseId: destinoBaseId,
          destinoBase: destinoBase,
          origemVeiculoId: origemVeiculoId,
          origemVeiculo: origemVeiculo,
          destinoVeiculoId: destinoVeiculoId,
          destinoVeiculo: destinoVeiculo,
        );

  /// Returns a shallow copy of this [Movimentacao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Movimentacao copyWith({
    Object? id = _Undefined,
    int? usuarioId,
    Object? usuario = _Undefined,
    int? materialId,
    Object? material = _Undefined,
    int? ferramentaId,
    Object? ferramenta = _Undefined,
    Object? quantidade = _Undefined,
    String? tipoMovimentacao,
    DateTime? dataMovimentacao,
    Object? dataDevolucao = _Undefined,
    Object? modalidadeEntrega = _Undefined,
    Object? observacao = _Undefined,
    int? origemBaseId,
    Object? origemBase = _Undefined,
    int? destinoBaseId,
    Object? destinoBase = _Undefined,
    int? origemVeiculoId,
    Object? origemVeiculo = _Undefined,
    int? destinoVeiculoId,
    Object? destinoVeiculo = _Undefined,
  }) {
    return Movimentacao(
      id: id is int? ? id : this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      usuario: usuario is _i2.UserInfo? ? usuario : this.usuario?.copyWith(),
      materialId: materialId ?? this.materialId,
      material:
          material is _i3.Material? ? material : this.material?.copyWith(),
      ferramentaId: ferramentaId ?? this.ferramentaId,
      ferramenta: ferramenta is _i4.Ferramenta?
          ? ferramenta
          : this.ferramenta?.copyWith(),
      quantidade: quantidade is double? ? quantidade : this.quantidade,
      tipoMovimentacao: tipoMovimentacao ?? this.tipoMovimentacao,
      dataMovimentacao: dataMovimentacao ?? this.dataMovimentacao,
      dataDevolucao:
          dataDevolucao is DateTime? ? dataDevolucao : this.dataDevolucao,
      modalidadeEntrega: modalidadeEntrega is String?
          ? modalidadeEntrega
          : this.modalidadeEntrega,
      observacao: observacao is String? ? observacao : this.observacao,
      origemBaseId: origemBaseId ?? this.origemBaseId,
      origemBase:
          origemBase is _i5.Base? ? origemBase : this.origemBase?.copyWith(),
      destinoBaseId: destinoBaseId ?? this.destinoBaseId,
      destinoBase:
          destinoBase is _i5.Base? ? destinoBase : this.destinoBase?.copyWith(),
      origemVeiculoId: origemVeiculoId ?? this.origemVeiculoId,
      origemVeiculo: origemVeiculo is _i6.Veiculo?
          ? origemVeiculo
          : this.origemVeiculo?.copyWith(),
      destinoVeiculoId: destinoVeiculoId ?? this.destinoVeiculoId,
      destinoVeiculo: destinoVeiculo is _i6.Veiculo?
          ? destinoVeiculo
          : this.destinoVeiculo?.copyWith(),
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

  _i2.UserInfoTable? _usuario;

  late final _i1.ColumnInt materialId;

  _i3.MaterialTable? _material;

  late final _i1.ColumnInt ferramentaId;

  _i4.FerramentaTable? _ferramenta;

  late final _i1.ColumnDouble quantidade;

  late final _i1.ColumnString tipoMovimentacao;

  late final _i1.ColumnDateTime dataMovimentacao;

  late final _i1.ColumnDateTime dataDevolucao;

  late final _i1.ColumnString modalidadeEntrega;

  late final _i1.ColumnString observacao;

  late final _i1.ColumnInt origemBaseId;

  _i5.BaseTable? _origemBase;

  late final _i1.ColumnInt destinoBaseId;

  _i5.BaseTable? _destinoBase;

  late final _i1.ColumnInt origemVeiculoId;

  _i6.VeiculoTable? _origemVeiculo;

  late final _i1.ColumnInt destinoVeiculoId;

  _i6.VeiculoTable? _destinoVeiculo;

  _i2.UserInfoTable get usuario {
    if (_usuario != null) return _usuario!;
    _usuario = _i1.createRelationTable(
      relationFieldName: 'usuario',
      field: Movimentacao.t.usuarioId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _usuario!;
  }

  _i3.MaterialTable get material {
    if (_material != null) return _material!;
    _material = _i1.createRelationTable(
      relationFieldName: 'material',
      field: Movimentacao.t.materialId,
      foreignField: _i3.Material.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MaterialTable(tableRelation: foreignTableRelation),
    );
    return _material!;
  }

  _i4.FerramentaTable get ferramenta {
    if (_ferramenta != null) return _ferramenta!;
    _ferramenta = _i1.createRelationTable(
      relationFieldName: 'ferramenta',
      field: Movimentacao.t.ferramentaId,
      foreignField: _i4.Ferramenta.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.FerramentaTable(tableRelation: foreignTableRelation),
    );
    return _ferramenta!;
  }

  _i5.BaseTable get origemBase {
    if (_origemBase != null) return _origemBase!;
    _origemBase = _i1.createRelationTable(
      relationFieldName: 'origemBase',
      field: Movimentacao.t.origemBaseId,
      foreignField: _i5.Base.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.BaseTable(tableRelation: foreignTableRelation),
    );
    return _origemBase!;
  }

  _i5.BaseTable get destinoBase {
    if (_destinoBase != null) return _destinoBase!;
    _destinoBase = _i1.createRelationTable(
      relationFieldName: 'destinoBase',
      field: Movimentacao.t.destinoBaseId,
      foreignField: _i5.Base.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.BaseTable(tableRelation: foreignTableRelation),
    );
    return _destinoBase!;
  }

  _i6.VeiculoTable get origemVeiculo {
    if (_origemVeiculo != null) return _origemVeiculo!;
    _origemVeiculo = _i1.createRelationTable(
      relationFieldName: 'origemVeiculo',
      field: Movimentacao.t.origemVeiculoId,
      foreignField: _i6.Veiculo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.VeiculoTable(tableRelation: foreignTableRelation),
    );
    return _origemVeiculo!;
  }

  _i6.VeiculoTable get destinoVeiculo {
    if (_destinoVeiculo != null) return _destinoVeiculo!;
    _destinoVeiculo = _i1.createRelationTable(
      relationFieldName: 'destinoVeiculo',
      field: Movimentacao.t.destinoVeiculoId,
      foreignField: _i6.Veiculo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.VeiculoTable(tableRelation: foreignTableRelation),
    );
    return _destinoVeiculo!;
  }

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

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'usuario') {
      return usuario;
    }
    if (relationField == 'material') {
      return material;
    }
    if (relationField == 'ferramenta') {
      return ferramenta;
    }
    if (relationField == 'origemBase') {
      return origemBase;
    }
    if (relationField == 'destinoBase') {
      return destinoBase;
    }
    if (relationField == 'origemVeiculo') {
      return origemVeiculo;
    }
    if (relationField == 'destinoVeiculo') {
      return destinoVeiculo;
    }
    return null;
  }
}

class MovimentacaoInclude extends _i1.IncludeObject {
  MovimentacaoInclude._({
    _i2.UserInfoInclude? usuario,
    _i3.MaterialInclude? material,
    _i4.FerramentaInclude? ferramenta,
    _i5.BaseInclude? origemBase,
    _i5.BaseInclude? destinoBase,
    _i6.VeiculoInclude? origemVeiculo,
    _i6.VeiculoInclude? destinoVeiculo,
  }) {
    _usuario = usuario;
    _material = material;
    _ferramenta = ferramenta;
    _origemBase = origemBase;
    _destinoBase = destinoBase;
    _origemVeiculo = origemVeiculo;
    _destinoVeiculo = destinoVeiculo;
  }

  _i2.UserInfoInclude? _usuario;

  _i3.MaterialInclude? _material;

  _i4.FerramentaInclude? _ferramenta;

  _i5.BaseInclude? _origemBase;

  _i5.BaseInclude? _destinoBase;

  _i6.VeiculoInclude? _origemVeiculo;

  _i6.VeiculoInclude? _destinoVeiculo;

  @override
  Map<String, _i1.Include?> get includes => {
        'usuario': _usuario,
        'material': _material,
        'ferramenta': _ferramenta,
        'origemBase': _origemBase,
        'destinoBase': _destinoBase,
        'origemVeiculo': _origemVeiculo,
        'destinoVeiculo': _destinoVeiculo,
      };

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

  final attachRow = const MovimentacaoAttachRowRepository._();

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
    MovimentacaoInclude? include,
  }) async {
    return session.db.find<Movimentacao>(
      where: where?.call(Movimentacao.t),
      orderBy: orderBy?.call(Movimentacao.t),
      orderByList: orderByList?.call(Movimentacao.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    MovimentacaoInclude? include,
  }) async {
    return session.db.findFirstRow<Movimentacao>(
      where: where?.call(Movimentacao.t),
      orderBy: orderBy?.call(Movimentacao.t),
      orderByList: orderByList?.call(Movimentacao.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Movimentacao] by its [id] or null if no such row exists.
  Future<Movimentacao?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MovimentacaoInclude? include,
  }) async {
    return session.db.findById<Movimentacao>(
      id,
      transaction: transaction,
      include: include,
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

class MovimentacaoAttachRowRepository {
  const MovimentacaoAttachRowRepository._();

  /// Creates a relation between the given [Movimentacao] and [UserInfo]
  /// by setting the [Movimentacao]'s foreign key `usuarioId` to refer to the [UserInfo].
  Future<void> usuario(
    _i1.Session session,
    Movimentacao movimentacao,
    _i2.UserInfo usuario, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (usuario.id == null) {
      throw ArgumentError.notNull('usuario.id');
    }

    var $movimentacao = movimentacao.copyWith(usuarioId: usuario.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.usuarioId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Movimentacao] and [Material]
  /// by setting the [Movimentacao]'s foreign key `materialId` to refer to the [Material].
  Future<void> material(
    _i1.Session session,
    Movimentacao movimentacao,
    _i3.Material material, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (material.id == null) {
      throw ArgumentError.notNull('material.id');
    }

    var $movimentacao = movimentacao.copyWith(materialId: material.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.materialId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Movimentacao] and [Ferramenta]
  /// by setting the [Movimentacao]'s foreign key `ferramentaId` to refer to the [Ferramenta].
  Future<void> ferramenta(
    _i1.Session session,
    Movimentacao movimentacao,
    _i4.Ferramenta ferramenta, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (ferramenta.id == null) {
      throw ArgumentError.notNull('ferramenta.id');
    }

    var $movimentacao = movimentacao.copyWith(ferramentaId: ferramenta.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.ferramentaId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Movimentacao] and [Base]
  /// by setting the [Movimentacao]'s foreign key `origemBaseId` to refer to the [Base].
  Future<void> origemBase(
    _i1.Session session,
    Movimentacao movimentacao,
    _i5.Base origemBase, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (origemBase.id == null) {
      throw ArgumentError.notNull('origemBase.id');
    }

    var $movimentacao = movimentacao.copyWith(origemBaseId: origemBase.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.origemBaseId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Movimentacao] and [Base]
  /// by setting the [Movimentacao]'s foreign key `destinoBaseId` to refer to the [Base].
  Future<void> destinoBase(
    _i1.Session session,
    Movimentacao movimentacao,
    _i5.Base destinoBase, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (destinoBase.id == null) {
      throw ArgumentError.notNull('destinoBase.id');
    }

    var $movimentacao = movimentacao.copyWith(destinoBaseId: destinoBase.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.destinoBaseId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Movimentacao] and [Veiculo]
  /// by setting the [Movimentacao]'s foreign key `origemVeiculoId` to refer to the [Veiculo].
  Future<void> origemVeiculo(
    _i1.Session session,
    Movimentacao movimentacao,
    _i6.Veiculo origemVeiculo, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (origemVeiculo.id == null) {
      throw ArgumentError.notNull('origemVeiculo.id');
    }

    var $movimentacao =
        movimentacao.copyWith(origemVeiculoId: origemVeiculo.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.origemVeiculoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Movimentacao] and [Veiculo]
  /// by setting the [Movimentacao]'s foreign key `destinoVeiculoId` to refer to the [Veiculo].
  Future<void> destinoVeiculo(
    _i1.Session session,
    Movimentacao movimentacao,
    _i6.Veiculo destinoVeiculo, {
    _i1.Transaction? transaction,
  }) async {
    if (movimentacao.id == null) {
      throw ArgumentError.notNull('movimentacao.id');
    }
    if (destinoVeiculo.id == null) {
      throw ArgumentError.notNull('destinoVeiculo.id');
    }

    var $movimentacao =
        movimentacao.copyWith(destinoVeiculoId: destinoVeiculo.id);
    await session.db.updateRow<Movimentacao>(
      $movimentacao,
      columns: [Movimentacao.t.destinoVeiculoId],
      transaction: transaction,
    );
  }
}
