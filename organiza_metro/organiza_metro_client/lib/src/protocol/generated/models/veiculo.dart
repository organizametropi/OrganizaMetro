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

abstract class Veiculo implements _i1.SerializableModel {
  Veiculo._({
    this.id,
    required this.codigo,
    this.descricao,
    required this.baseId,
  });

  factory Veiculo({
    int? id,
    required String codigo,
    String? descricao,
    required int baseId,
  }) = _VeiculoImpl;

  factory Veiculo.fromJson(Map<String, dynamic> jsonSerialization) {
    return Veiculo(
      id: jsonSerialization['id'] as int?,
      codigo: jsonSerialization['codigo'] as String,
      descricao: jsonSerialization['descricao'] as String?,
      baseId: jsonSerialization['baseId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String codigo;

  String? descricao;

  int baseId;

  /// Returns a shallow copy of this [Veiculo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Veiculo copyWith({
    int? id,
    String? codigo,
    String? descricao,
    int? baseId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      if (descricao != null) 'descricao': descricao,
      'baseId': baseId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VeiculoImpl extends Veiculo {
  _VeiculoImpl({
    int? id,
    required String codigo,
    String? descricao,
    required int baseId,
  }) : super._(
          id: id,
          codigo: codigo,
          descricao: descricao,
          baseId: baseId,
        );

  /// Returns a shallow copy of this [Veiculo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Veiculo copyWith({
    Object? id = _Undefined,
    String? codigo,
    Object? descricao = _Undefined,
    int? baseId,
  }) {
    return Veiculo(
      id: id is int? ? id : this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao is String? ? descricao : this.descricao,
      baseId: baseId ?? this.baseId,
    );
  }
}
