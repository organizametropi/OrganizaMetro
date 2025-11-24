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

abstract class Base implements _i1.SerializableModel {
  Base._({
    this.id,
    required this.codigo,
    required this.nome,
    this.endereco,
    this.responsavelId,
  });

  factory Base({
    int? id,
    required String codigo,
    required String nome,
    String? endereco,
    int? responsavelId,
  }) = _BaseImpl;

  factory Base.fromJson(Map<String, dynamic> jsonSerialization) {
    return Base(
      id: jsonSerialization['id'] as int?,
      codigo: jsonSerialization['codigo'] as String,
      nome: jsonSerialization['nome'] as String,
      endereco: jsonSerialization['endereco'] as String?,
      responsavelId: jsonSerialization['responsavelId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String codigo;

  String nome;

  String? endereco;

  int? responsavelId;

  /// Returns a shallow copy of this [Base]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Base copyWith({
    int? id,
    String? codigo,
    String? nome,
    String? endereco,
    int? responsavelId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'codigo': codigo,
      'nome': nome,
      if (endereco != null) 'endereco': endereco,
      if (responsavelId != null) 'responsavelId': responsavelId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BaseImpl extends Base {
  _BaseImpl({
    int? id,
    required String codigo,
    required String nome,
    String? endereco,
    int? responsavelId,
  }) : super._(
          id: id,
          codigo: codigo,
          nome: nome,
          endereco: endereco,
          responsavelId: responsavelId,
        );

  /// Returns a shallow copy of this [Base]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Base copyWith({
    Object? id = _Undefined,
    String? codigo,
    String? nome,
    Object? endereco = _Undefined,
    Object? responsavelId = _Undefined,
  }) {
    return Base(
      id: id is int? ? id : this.id,
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
      endereco: endereco is String? ? endereco : this.endereco,
      responsavelId: responsavelId is int? ? responsavelId : this.responsavelId,
    );
  }
}
