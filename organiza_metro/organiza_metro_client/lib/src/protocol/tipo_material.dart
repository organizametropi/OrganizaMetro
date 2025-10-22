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

abstract class TipoMaterial implements _i1.SerializableModel {
  TipoMaterial._({
    this.id,
    required this.nome,
    required this.faixaInicial,
    required this.faixaFinal,
    required this.descricao,
  });

  factory TipoMaterial({
    int? id,
    required String nome,
    required int faixaInicial,
    required int faixaFinal,
    required String descricao,
  }) = _TipoMaterialImpl;

  factory TipoMaterial.fromJson(Map<String, dynamic> jsonSerialization) {
    return TipoMaterial(
      id: jsonSerialization['id'] as int?,
      nome: jsonSerialization['nome'] as String,
      faixaInicial: jsonSerialization['faixaInicial'] as int,
      faixaFinal: jsonSerialization['faixaFinal'] as int,
      descricao: jsonSerialization['descricao'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String nome;

  int faixaInicial;

  int faixaFinal;

  String descricao;

  /// Returns a shallow copy of this [TipoMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TipoMaterial copyWith({
    int? id,
    String? nome,
    int? faixaInicial,
    int? faixaFinal,
    String? descricao,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'faixaInicial': faixaInicial,
      'faixaFinal': faixaFinal,
      'descricao': descricao,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TipoMaterialImpl extends TipoMaterial {
  _TipoMaterialImpl({
    int? id,
    required String nome,
    required int faixaInicial,
    required int faixaFinal,
    required String descricao,
  }) : super._(
          id: id,
          nome: nome,
          faixaInicial: faixaInicial,
          faixaFinal: faixaFinal,
          descricao: descricao,
        );

  /// Returns a shallow copy of this [TipoMaterial]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TipoMaterial copyWith({
    Object? id = _Undefined,
    String? nome,
    int? faixaInicial,
    int? faixaFinal,
    String? descricao,
  }) {
    return TipoMaterial(
      id: id is int? ? id : this.id,
      nome: nome ?? this.nome,
      faixaInicial: faixaInicial ?? this.faixaInicial,
      faixaFinal: faixaFinal ?? this.faixaFinal,
      descricao: descricao ?? this.descricao,
    );
  }
}
