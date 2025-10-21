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

abstract class Material implements _i1.SerializableModel {
  Material._({
    this.id,
    required this.codigoSap,
    required this.descricao,
    required this.quantidade,
    this.estoqueMinimo,
    this.dataUltimaMovimentacao,
    required this.tipoId,
    required this.unidadeMedidaId,
    this.baseId,
    this.veiculoId,
  });

  factory Material({
    int? id,
    required int codigoSap,
    required String descricao,
    required double quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    required int tipoId,
    required int unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  }) = _MaterialImpl;

  factory Material.fromJson(Map<String, dynamic> jsonSerialization) {
    return Material(
      id: jsonSerialization['id'] as int?,
      codigoSap: jsonSerialization['codigoSap'] as int,
      descricao: jsonSerialization['descricao'] as String,
      quantidade: (jsonSerialization['quantidade'] as num).toDouble(),
      estoqueMinimo: (jsonSerialization['estoqueMinimo'] as num?)?.toDouble(),
      dataUltimaMovimentacao:
          jsonSerialization['dataUltimaMovimentacao'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dataUltimaMovimentacao']),
      tipoId: jsonSerialization['tipoId'] as int,
      unidadeMedidaId: jsonSerialization['unidadeMedidaId'] as int,
      baseId: jsonSerialization['baseId'] as int?,
      veiculoId: jsonSerialization['veiculoId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int codigoSap;

  String descricao;

  double quantidade;

  double? estoqueMinimo;

  DateTime? dataUltimaMovimentacao;

  int tipoId;

  int unidadeMedidaId;

  int? baseId;

  int? veiculoId;

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
    int? unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigoSap': codigoSap,
      'descricao': descricao,
      'quantidade': quantidade,
      if (estoqueMinimo != null) 'estoqueMinimo': estoqueMinimo,
      if (dataUltimaMovimentacao != null)
        'dataUltimaMovimentacao': dataUltimaMovimentacao?.toJson(),
      'tipoId': tipoId,
      'unidadeMedidaId': unidadeMedidaId,
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

class _MaterialImpl extends Material {
  _MaterialImpl({
    int? id,
    required int codigoSap,
    required String descricao,
    required double quantidade,
    double? estoqueMinimo,
    DateTime? dataUltimaMovimentacao,
    required int tipoId,
    required int unidadeMedidaId,
    int? baseId,
    int? veiculoId,
  }) : super._(
          id: id,
          codigoSap: codigoSap,
          descricao: descricao,
          quantidade: quantidade,
          estoqueMinimo: estoqueMinimo,
          dataUltimaMovimentacao: dataUltimaMovimentacao,
          tipoId: tipoId,
          unidadeMedidaId: unidadeMedidaId,
          baseId: baseId,
          veiculoId: veiculoId,
        );

  /// Returns a shallow copy of this [Material]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Material copyWith({
    Object? id = _Undefined,
    int? codigoSap,
    String? descricao,
    double? quantidade,
    Object? estoqueMinimo = _Undefined,
    Object? dataUltimaMovimentacao = _Undefined,
    int? tipoId,
    int? unidadeMedidaId,
    Object? baseId = _Undefined,
    Object? veiculoId = _Undefined,
  }) {
    return Material(
      id: id is int? ? id : this.id,
      codigoSap: codigoSap ?? this.codigoSap,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      estoqueMinimo:
          estoqueMinimo is double? ? estoqueMinimo : this.estoqueMinimo,
      dataUltimaMovimentacao: dataUltimaMovimentacao is DateTime?
          ? dataUltimaMovimentacao
          : this.dataUltimaMovimentacao,
      tipoId: tipoId ?? this.tipoId,
      unidadeMedidaId: unidadeMedidaId ?? this.unidadeMedidaId,
      baseId: baseId is int? ? baseId : this.baseId,
      veiculoId: veiculoId is int? ? veiculoId : this.veiculoId,
    );
  }
}
