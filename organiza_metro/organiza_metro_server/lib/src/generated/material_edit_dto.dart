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

abstract class MaterialEditDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MaterialEditDto._({
    required this.id,
    this.descricao,
    this.codigoSap,
    this.quantidade,
    this.estoqueMinimo,
    this.unidadeMedidaId,
    this.tipoMaterialId,
    this.baseId,
    this.veiculoId,
    this.nome,
  });

  factory MaterialEditDto({
    required int id,
    String? descricao,
    int? codigoSap,
    double? quantidade,
    double? estoqueMinimo,
    int? unidadeMedidaId,
    int? tipoMaterialId,
    int? baseId,
    int? veiculoId,
    String? nome,
  }) = _MaterialEditDtoImpl;

  factory MaterialEditDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return MaterialEditDto(
      id: jsonSerialization['id'] as int,
      descricao: jsonSerialization['descricao'] as String?,
      codigoSap: jsonSerialization['codigoSap'] as int?,
      quantidade: (jsonSerialization['quantidade'] as num?)?.toDouble(),
      estoqueMinimo: (jsonSerialization['estoqueMinimo'] as num?)?.toDouble(),
      unidadeMedidaId: jsonSerialization['unidadeMedidaId'] as int?,
      tipoMaterialId: jsonSerialization['tipoMaterialId'] as int?,
      baseId: jsonSerialization['baseId'] as int?,
      veiculoId: jsonSerialization['veiculoId'] as int?,
      nome: jsonSerialization['nome'] as String?,
    );
  }

  int id;

  String? descricao;

  int? codigoSap;

  double? quantidade;

  double? estoqueMinimo;

  int? unidadeMedidaId;

  int? tipoMaterialId;

  int? baseId;

  int? veiculoId;

  String? nome;

  /// Returns a shallow copy of this [MaterialEditDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MaterialEditDto copyWith({
    int? id,
    String? descricao,
    int? codigoSap,
    double? quantidade,
    double? estoqueMinimo,
    int? unidadeMedidaId,
    int? tipoMaterialId,
    int? baseId,
    int? veiculoId,
    String? nome,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (descricao != null) 'descricao': descricao,
      if (codigoSap != null) 'codigoSap': codigoSap,
      if (quantidade != null) 'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (unidadeMedidaId != null) 'unidadeMedidaId': unidadeMedidaId,
      if (tipoMaterialId != null) 'tipoMaterialId': tipoMaterialId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
      if (nome != null) 'nome': nome,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      if (descricao != null) 'descricao': descricao,
      if (codigoSap != null) 'codigoSap': codigoSap,
      if (quantidade != null) 'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (unidadeMedidaId != null) 'unidadeMedidaId': unidadeMedidaId,
      if (tipoMaterialId != null) 'tipoMaterialId': tipoMaterialId,
      if (baseId != null) 'baseId': baseId,
      if (veiculoId != null) 'veiculoId': veiculoId,
      if (nome != null) 'nome': nome,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaterialEditDtoImpl extends MaterialEditDto {
  _MaterialEditDtoImpl({
    required int id,
    String? descricao,
    int? codigoSap,
    double? quantidade,
    double? estoqueMinimo,
    int? unidadeMedidaId,
    int? tipoMaterialId,
    int? baseId,
    int? veiculoId,
    String? nome,
  }) : super._(
          id: id,
          descricao: descricao,
          codigoSap: codigoSap,
          quantidade: quantidade,
          estoqueMinimo: estoqueMinimo,
          unidadeMedidaId: unidadeMedidaId,
          tipoMaterialId: tipoMaterialId,
          baseId: baseId,
          veiculoId: veiculoId,
          nome: nome,
        );

  /// Returns a shallow copy of this [MaterialEditDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MaterialEditDto copyWith({
    int? id,
    Object? descricao = _Undefined,
    Object? codigoSap = _Undefined,
    Object? quantidade = _Undefined,
    Object? estoqueMinimo = _Undefined,
    Object? unidadeMedidaId = _Undefined,
    Object? tipoMaterialId = _Undefined,
    Object? baseId = _Undefined,
    Object? veiculoId = _Undefined,
    Object? nome = _Undefined,
  }) {
    return MaterialEditDto(
      id: id ?? this.id,
      descricao: descricao is String? ? descricao : this.descricao,
      codigoSap: codigoSap is int? ? codigoSap : this.codigoSap,
      quantidade: quantidade is double? ? quantidade : this.quantidade,
      estoqueMinimo:
          estoqueMinimo is double? ? estoqueMinimo : this.estoqueMinimo,
      unidadeMedidaId:
          unidadeMedidaId is int? ? unidadeMedidaId : this.unidadeMedidaId,
      tipoMaterialId:
          tipoMaterialId is int? ? tipoMaterialId : this.tipoMaterialId,
      baseId: baseId is int? ? baseId : this.baseId,
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
      nome: nome is String? ? nome : this.nome,
    );
  }
}
