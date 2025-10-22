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
import 'tipo_material.dart' as _i2;
import 'unidade_medida.dart' as _i3;
import 'base.dart' as _i4;
import 'veiculo.dart' as _i5;

abstract class Material implements _i1.SerializableModel {
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
    this.baseId,
    this.base,
    this.veiculoId,
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
    int? baseId,
    _i4.Base? base,
    int? veiculoId,
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
      baseId: jsonSerialization['baseId'] as int?,
      base: jsonSerialization['base'] == null
          ? null
          : _i4.Base.fromJson(
              (jsonSerialization['base'] as Map<String, dynamic>)),
      veiculoId: jsonSerialization['veiculoId'] as int?,
      veiculo: jsonSerialization['veiculo'] == null
          ? null
          : _i5.Veiculo.fromJson(
              (jsonSerialization['veiculo'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  int? baseId;

  _i4.Base? base;

  int? veiculoId;

  _i5.Veiculo? veiculo;

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
      if (baseId != null) 'baseId': baseId,
      if (base != null) 'base': base?.toJson(),
      if (veiculoId != null) 'veiculoId': veiculoId,
      if (veiculo != null) 'veiculo': veiculo?.toJson(),
    };
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
    int? baseId,
    _i4.Base? base,
    int? veiculoId,
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
    Object? baseId = _Undefined,
    Object? base = _Undefined,
    Object? veiculoId = _Undefined,
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
      baseId: baseId is int? ? baseId : this.baseId,
      base: base is _i4.Base? ? base : this.base?.copyWith(),
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
      veiculo: veiculo is _i5.Veiculo? ? veiculo : this.veiculo?.copyWith(),
    );
  }
}
