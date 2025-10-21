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

abstract class Ferramenta implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
