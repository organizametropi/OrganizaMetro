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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;

abstract class Ferramenta implements _i1.SerializableModel {
  Ferramenta._({
    this.id,
    required this.codigoSap,
    required this.descricao,
    this.patrimonio,
    required this.emUso,
    required this.divisao,
    required this.tipoId,
    this.tipo,
    required this.status,
    required this.dataAquisicao,
    this.dataUltimaMovimentacao,
    required this.unidadeMedidaId,
    this.unidadeMedida,
    this.baseId,
    this.base,
    this.veiculoId,
    this.veiculo,
    this.empenhadoParaId,
    this.empenhadoPara,
  });

  factory Ferramenta({
    int? id,
    required int codigoSap,
    required String descricao,
    String? patrimonio,
    required bool emUso,
    required String divisao,
    required int tipoId,
    _i2.TipoMaterial? tipo,
    required String status,
    required DateTime dataAquisicao,
    DateTime? dataUltimaMovimentacao,
    required int unidadeMedidaId,
    _i3.UnidadeMedida? unidadeMedida,
    int? baseId,
    _i4.Base? base,
    int? veiculoId,
    _i5.Veiculo? veiculo,
    int? empenhadoParaId,
    _i6.UserInfo? empenhadoPara,
  }) = _FerramentaImpl;

  factory Ferramenta.fromJson(Map<String, dynamic> jsonSerialization) {
    return Ferramenta(
      id: jsonSerialization['id'] as int?,
      codigoSap: jsonSerialization['codigoSap'] as int,
      descricao: jsonSerialization['descricao'] as String,
      patrimonio: jsonSerialization['patrimonio'] as String?,
      emUso: jsonSerialization['emUso'] as bool,
      divisao: jsonSerialization['divisao'] as String,
      tipoId: jsonSerialization['tipoId'] as int,
      tipo: jsonSerialization['tipo'] == null
          ? null
          : _i2.TipoMaterial.fromJson(
              (jsonSerialization['tipo'] as Map<String, dynamic>)),
      status: jsonSerialization['status'] as String,
      dataAquisicao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dataAquisicao']),
      dataUltimaMovimentacao:
          jsonSerialization['dataUltimaMovimentacao'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dataUltimaMovimentacao']),
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
      empenhadoParaId: jsonSerialization['empenhadoParaId'] as int?,
      empenhadoPara: jsonSerialization['empenhadoPara'] == null
          ? null
          : _i6.UserInfo.fromJson(
              (jsonSerialization['empenhadoPara'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int codigoSap;

  String descricao;

  String? patrimonio;

  bool emUso;

  String divisao;

  int tipoId;

  _i2.TipoMaterial? tipo;

  String status;

  DateTime dataAquisicao;

  DateTime? dataUltimaMovimentacao;

  int unidadeMedidaId;

  _i3.UnidadeMedida? unidadeMedida;

  int? baseId;

  _i4.Base? base;

  int? veiculoId;

  _i5.Veiculo? veiculo;

  int? empenhadoParaId;

  _i6.UserInfo? empenhadoPara;

  /// Returns a shallow copy of this [Ferramenta]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Ferramenta copyWith({
    int? id,
    int? codigoSap,
    String? descricao,
    String? patrimonio,
    bool? emUso,
    String? divisao,
    int? tipoId,
    _i2.TipoMaterial? tipo,
    String? status,
    DateTime? dataAquisicao,
    DateTime? dataUltimaMovimentacao,
    int? unidadeMedidaId,
    _i3.UnidadeMedida? unidadeMedida,
    int? baseId,
    _i4.Base? base,
    int? veiculoId,
    _i5.Veiculo? veiculo,
    int? empenhadoParaId,
    _i6.UserInfo? empenhadoPara,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      if (patrimonio != null) 'patrimonio': patrimonio,
      'emUso': emUso,
      'divisao': divisao,
      'tipoId': tipoId,
      if (tipo != null) 'tipo': tipo?.toJson(),
      'status': status,
      'dataAquisicao': dataAquisicao.toJson(),
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'unidadeMedidaId': unidadeMedidaId,
      if (unidadeMedida != null) 'unidadeMedida': unidadeMedida?.toJson(),
      if (baseId != null) 'baseId': baseId,
      if (base != null) 'base': base?.toJson(),
      if (veiculoId != null) 'veiculoId': veiculoId,
      if (veiculo != null) 'veiculo': veiculo?.toJson(),
      if (empenhadoParaId != null) 'empenhadoParaId': empenhadoParaId,
      if (empenhadoPara != null) 'empenhadoPara': empenhadoPara?.toJson(),
    };
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
    required String divisao,
    required int tipoId,
    _i2.TipoMaterial? tipo,
    required String status,
    required DateTime dataAquisicao,
    DateTime? dataUltimaMovimentacao,
    required int unidadeMedidaId,
    _i3.UnidadeMedida? unidadeMedida,
    int? baseId,
    _i4.Base? base,
    int? veiculoId,
    _i5.Veiculo? veiculo,
    int? empenhadoParaId,
    _i6.UserInfo? empenhadoPara,
  }) : super._(
          id: id,
          codigoSap: codigoSap,
          descricao: descricao,
          patrimonio: patrimonio,
          emUso: emUso,
          divisao: divisao,
          tipoId: tipoId,
          tipo: tipo,
          status: status,
          dataAquisicao: dataAquisicao,
          dataUltimaMovimentacao: dataUltimaMovimentacao,
          unidadeMedidaId: unidadeMedidaId,
          unidadeMedida: unidadeMedida,
          baseId: baseId,
          base: base,
          veiculoId: veiculoId,
          veiculo: veiculo,
          empenhadoParaId: empenhadoParaId,
          empenhadoPara: empenhadoPara,
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
    String? divisao,
    int? tipoId,
    Object? tipo = _Undefined,
    String? status,
    DateTime? dataAquisicao,
    Object? dataUltimaMovimentacao = _Undefined,
    int? unidadeMedidaId,
    Object? unidadeMedida = _Undefined,
    Object? baseId = _Undefined,
    Object? base = _Undefined,
    Object? veiculoId = _Undefined,
    Object? veiculo = _Undefined,
    Object? empenhadoParaId = _Undefined,
    Object? empenhadoPara = _Undefined,
  }) {
    return Ferramenta(
      id: id is int? ? id : this.id,
      codigoSap: codigoSap ?? this.codigoSap,
      descricao: descricao ?? this.descricao,
      patrimonio: patrimonio is String? ? patrimonio : this.patrimonio,
      emUso: emUso ?? this.emUso,
      divisao: divisao ?? this.divisao,
      tipoId: tipoId ?? this.tipoId,
      tipo: tipo is _i2.TipoMaterial? ? tipo : this.tipo?.copyWith(),
      status: status ?? this.status,
      dataAquisicao: dataAquisicao ?? this.dataAquisicao,
      dataUltimaMovimentacao: dataUltimaMovimentacao is DateTime?
          ? dataUltimaMovimentacao
          : this.dataUltimaMovimentacao,
      unidadeMedidaId: unidadeMedidaId ?? this.unidadeMedidaId,
      unidadeMedida: unidadeMedida is _i3.UnidadeMedida?
          ? unidadeMedida
          : this.unidadeMedida?.copyWith(),
      baseId: baseId is int? ? baseId : this.baseId,
      base: base is _i4.Base? ? base : this.base?.copyWith(),
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
      veiculo: veiculo is _i5.Veiculo? ? veiculo : this.veiculo?.copyWith(),
      empenhadoParaId:
          empenhadoParaId is int? ? empenhadoParaId : this.empenhadoParaId,
      empenhadoPara: empenhadoPara is _i6.UserInfo?
          ? empenhadoPara
          : this.empenhadoPara?.copyWith(),
    );
  }
}
