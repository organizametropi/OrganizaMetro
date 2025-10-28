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
import 'calibracao.dart' as _i3;
import 'movimentacao.dart' as _i4;
import 'material.dart' as _i5;
import 'ferramenta.dart' as _i6;

abstract class Alerta implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
