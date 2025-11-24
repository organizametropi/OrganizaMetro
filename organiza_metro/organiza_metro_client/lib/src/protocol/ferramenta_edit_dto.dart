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

abstract class FerramentaEditDto implements _i1.SerializableModel {
  FerramentaEditDto._({
    required this.id,
    this.nome,
    this.codigoSap,
    this.descricao,
    this.patrimonio,
    this.quantidade,
    this.divisao,
    this.tipoMaterialId,
    this.status,
    this.dataAquisicao,
    this.unidadeMedidaId,
    this.baseId,
    this.veiculoId,
  });

  factory FerramentaEditDto({
    required int id,
    String? nome,
    int? codigoSap,
    String? descricao,
    String? patrimonio,
    int? quantidade,
    String? divisao,
    int? tipoMaterialId,
    String? status,
    DateTime? dataAquisicao,
    int? unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  }) = _FerramentaEditDtoImpl;

  factory FerramentaEditDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return FerramentaEditDto(
      id: jsonSerialization['id'] as int,
      nome: jsonSerialization['nome'] as String?,
      codigoSap: jsonSerialization['codigoSap'] as int?,
      descricao: jsonSerialization['descricao'] as String?,
      patrimonio: jsonSerialization['patrimonio'] as String?,
      quantidade: jsonSerialization['quantidade'] as int?,
      divisao: jsonSerialization['divisao'] as String?,
      tipoMaterialId: jsonSerialization['tipoMaterialId'] as int?,
      status: jsonSerialization['status'] as String?,
      dataAquisicao: jsonSerialization['dataAquisicao'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dataAquisicao']),
      unidadeMedidaId: jsonSerialization['unidadeMedidaId'] as int?,
      baseId: jsonSerialization['baseId'] as int?,
      veiculoId: jsonSerialization['veiculoId'] as int?,
    );
  }

  int id;

  String? nome;

  int? codigoSap;

  String? descricao;

  String? patrimonio;

  int? quantidade;

  String? divisao;

  int? tipoMaterialId;

  String? status;

  DateTime? dataAquisicao;

  int? unidadeMedidaId;

  int? baseId;

  int? veiculoId;

  /// Returns a shallow copy of this [FerramentaEditDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FerramentaEditDto copyWith({
    int? id,
    String? nome,
    int? codigoSap,
    String? descricao,
    String? patrimonio,
    int? quantidade,
    String? divisao,
    int? tipoMaterialId,
    String? status,
    DateTime? dataAquisicao,
    int? unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (nome != null) 'nome': nome,
      if (codigoSap != null) 'codigoSap': codigoSap,
      if (descricao != null) 'descricao': descricao,
      if (patrimonio != null) 'patrimonio': patrimonio,
      if (quantidade != null) 'quantidade': quantidade,
      if (divisao != null) 'divisao': divisao,
      if (tipoMaterialId != null) 'tipoMaterialId': tipoMaterialId,
      if (status != null) 'status': status,
      if (dataAquisicao != null) 'dataAquisicao': dataAquisicao?.toJson(),
      if (unidadeMedidaId != null) 'unidadeMedidaId': unidadeMedidaId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FerramentaEditDtoImpl extends FerramentaEditDto {
  _FerramentaEditDtoImpl({
    required int id,
    String? nome,
    int? codigoSap,
    String? descricao,
    String? patrimonio,
    int? quantidade,
    String? divisao,
    int? tipoMaterialId,
    String? status,
    DateTime? dataAquisicao,
    int? unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  }) : super._(
          id: id,
          nome: nome,
          codigoSap: codigoSap,
          descricao: descricao,
          patrimonio: patrimonio,
          quantidade: quantidade,
          divisao: divisao,
          tipoMaterialId: tipoMaterialId,
          status: status,
          dataAquisicao: dataAquisicao,
          unidadeMedidaId: unidadeMedidaId,
          baseId: baseId,
          veiculoId: veiculoId,
        );

  /// Returns a shallow copy of this [FerramentaEditDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FerramentaEditDto copyWith({
    int? id,
    Object? nome = _Undefined,
    Object? codigoSap = _Undefined,
    Object? descricao = _Undefined,
    Object? patrimonio = _Undefined,
    Object? quantidade = _Undefined,
    Object? divisao = _Undefined,
    Object? tipoMaterialId = _Undefined,
    Object? status = _Undefined,
    Object? dataAquisicao = _Undefined,
    Object? unidadeMedidaId = _Undefined,
    Object? baseId = _Undefined,
    Object? veiculoId = _Undefined,
  }) {
    return FerramentaEditDto(
      id: id ?? this.id,
      nome: nome is String? ? nome : this.nome,
      codigoSap: codigoSap is int? ? codigoSap : this.codigoSap,
      descricao: descricao is String? ? descricao : this.descricao,
      patrimonio: patrimonio is String? ? patrimonio : this.patrimonio,
      quantidade: quantidade is int? ? quantidade : this.quantidade,
      divisao: divisao is String? ? divisao : this.divisao,
      tipoMaterialId:
          tipoMaterialId is int? ? tipoMaterialId : this.tipoMaterialId,
      status: status is String? ? status : this.status,
      dataAquisicao:
          dataAquisicao is DateTime? ? dataAquisicao : this.dataAquisicao,
      unidadeMedidaId:
          unidadeMedidaId is int? ? unidadeMedidaId : this.unidadeMedidaId,
      baseId: baseId is int? ? baseId : this.baseId,
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
    );
  }
}
