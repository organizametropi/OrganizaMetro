/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'material.dart' as _i3;
import 'ferramenta.dart' as _i4;
import 'base.dart' as _i5;
import 'veiculo.dart' as _i6;

abstract class Movimentacao implements _i1.SerializableModel {
  Movimentacao._({
    this.id,
    required this.usuarioId,
    this.usuario,
    this.materialId,
    this.material,
    this.ferramentaId,
    this.ferramenta,
    this.quantidade,
    required this.tipoMovimentacao,
    required this.dataMovimentacao,
    this.dataDevolucao,
    this.modalidadeEntrega,
    this.observacao,
    this.origemBaseId,
    this.origemBase,
    this.destinoBaseId,
    this.destinoBase,
    this.origemVeiculoId,
    this.origemVeiculo,
    this.destinoVeiculoId,
    this.destinoVeiculo,
  });

  factory Movimentacao({
    int? id,
    required int usuarioId,
    _i2.UserInfo? usuario,
    int? materialId,
    _i3.Material? material,
    int? ferramentaId,
    _i4.Ferramenta? ferramenta,
    double? quantidade,
    required String tipoMovimentacao,
    required DateTime dataMovimentacao,
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
  }) = _MovimentacaoImpl;

  factory Movimentacao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Movimentacao(
      id: jsonSerialization['id'] as int?,
      usuarioId: jsonSerialization['usuarioId'] as int,
      usuario: jsonSerialization['usuario'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['usuario'] as Map<String, dynamic>)),
      materialId: jsonSerialization['materialId'] as int?,
      material: jsonSerialization['material'] == null
          ? null
          : _i3.Material.fromJson(
              (jsonSerialization['material'] as Map<String, dynamic>)),
      ferramentaId: jsonSerialization['ferramentaId'] as int?,
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
      origemBaseId: jsonSerialization['origemBaseId'] as int?,
      origemBase: jsonSerialization['origemBase'] == null
          ? null
          : _i5.Base.fromJson(
              (jsonSerialization['origemBase'] as Map<String, dynamic>)),
      destinoBaseId: jsonSerialization['destinoBaseId'] as int?,
      destinoBase: jsonSerialization['destinoBase'] == null
          ? null
          : _i5.Base.fromJson(
              (jsonSerialization['destinoBase'] as Map<String, dynamic>)),
      origemVeiculoId: jsonSerialization['origemVeiculoId'] as int?,
      origemVeiculo: jsonSerialization['origemVeiculo'] == null
          ? null
          : _i6.Veiculo.fromJson(
              (jsonSerialization['origemVeiculo'] as Map<String, dynamic>)),
      destinoVeiculoId: jsonSerialization['destinoVeiculoId'] as int?,
      destinoVeiculo: jsonSerialization['destinoVeiculo'] == null
          ? null
          : _i6.Veiculo.fromJson(
              (jsonSerialization['destinoVeiculo'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int usuarioId;

  _i2.UserInfo? usuario;

  int? materialId;

  _i3.Material? material;

  int? ferramentaId;

  _i4.Ferramenta? ferramenta;

  double? quantidade;

  String tipoMovimentacao;

  DateTime dataMovimentacao;

  DateTime? dataDevolucao;

  String? modalidadeEntrega;

  String? observacao;

  int? origemBaseId;

  _i5.Base? origemBase;

  int? destinoBaseId;

  _i5.Base? destinoBase;

  int? origemVeiculoId;

  _i6.Veiculo? origemVeiculo;

  int? destinoVeiculoId;

  _i6.Veiculo? destinoVeiculo;

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
      if (materialId != null) 'materialId': materialId,
      if (material != null) 'material': material?.toJson(),
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJson(),
      if (quantidade != null) 'quantidade': quantidade,
      'tipoMovimentacao': tipoMovimentacao,
      'dataMovimentacao': dataMovimentacao.toJson(),
      if (dataDevolucao != null) 'dataDevolucao': dataDevolucao?.toJson(),
      if (modalidadeEntrega != null) 'modalidadeEntrega': modalidadeEntrega,
      if (observacao != null) 'observacao': observacao,
      if (origemBaseId != null) 'origemBaseId': origemBaseId,
      if (origemBase != null) 'origemBase': origemBase?.toJson(),
      if (destinoBaseId != null) 'destinoBaseId': destinoBaseId,
      if (destinoBase != null) 'destinoBase': destinoBase?.toJson(),
      if (origemVeiculoId != null) 'origemVeiculoId': origemVeiculoId,
      if (origemVeiculo != null) 'origemVeiculo': origemVeiculo?.toJson(),
      if (destinoVeiculoId != null) 'destinoVeiculoId': destinoVeiculoId,
      if (destinoVeiculo != null) 'destinoVeiculo': destinoVeiculo?.toJson(),
    };
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
    int? materialId,
    _i3.Material? material,
    int? ferramentaId,
    _i4.Ferramenta? ferramenta,
    double? quantidade,
    required String tipoMovimentacao,
    required DateTime dataMovimentacao,
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
    Object? materialId = _Undefined,
    Object? material = _Undefined,
    Object? ferramentaId = _Undefined,
    Object? ferramenta = _Undefined,
    Object? quantidade = _Undefined,
    String? tipoMovimentacao,
    DateTime? dataMovimentacao,
    Object? dataDevolucao = _Undefined,
    Object? modalidadeEntrega = _Undefined,
    Object? observacao = _Undefined,
    Object? origemBaseId = _Undefined,
    Object? origemBase = _Undefined,
    Object? destinoBaseId = _Undefined,
    Object? destinoBase = _Undefined,
    Object? origemVeiculoId = _Undefined,
    Object? origemVeiculo = _Undefined,
    Object? destinoVeiculoId = _Undefined,
    Object? destinoVeiculo = _Undefined,
  }) {
    return Movimentacao(
      id: id is int? ? id : this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      usuario: usuario is _i2.UserInfo? ? usuario : this.usuario?.copyWith(),
      materialId: materialId is int? ? materialId : this.materialId,
      material:
          material is _i3.Material? ? material : this.material?.copyWith(),
      ferramentaId: ferramentaId is int? ? ferramentaId : this.ferramentaId,
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
      origemBaseId: origemBaseId is int? ? origemBaseId : this.origemBaseId,
      origemBase:
          origemBase is _i5.Base? ? origemBase : this.origemBase?.copyWith(),
      destinoBaseId: destinoBaseId is int? ? destinoBaseId : this.destinoBaseId,
      destinoBase:
          destinoBase is _i5.Base? ? destinoBase : this.destinoBase?.copyWith(),
      origemVeiculoId:
          origemVeiculoId is int? ? origemVeiculoId : this.origemVeiculoId,
      origemVeiculo: origemVeiculo is _i6.Veiculo?
          ? origemVeiculo
          : this.origemVeiculo?.copyWith(),
      destinoVeiculoId:
          destinoVeiculoId is int? ? destinoVeiculoId : this.destinoVeiculoId,
      destinoVeiculo: destinoVeiculo is _i6.Veiculo?
          ? destinoVeiculo
          : this.destinoVeiculo?.copyWith(),
    );
  }
}
