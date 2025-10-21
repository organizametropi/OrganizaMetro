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

abstract class Movimentacao implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
