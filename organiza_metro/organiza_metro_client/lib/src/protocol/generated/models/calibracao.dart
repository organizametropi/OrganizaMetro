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

abstract class Calibracao implements _i1.SerializableModel {
  Calibracao._({
    this.id,
    required this.ferramentaId,
    required this.dataCalibracao,
    required this.validadeCalibracao,
    required this.status,
  });

  factory Calibracao({
    int? id,
    required int ferramentaId,
    required DateTime dataCalibracao,
    required DateTime validadeCalibracao,
    required String status,
  }) = _CalibracaoImpl;

  factory Calibracao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Calibracao(
      id: jsonSerialization['id'] as int?,
      ferramentaId: jsonSerialization['ferramentaId'] as int,
      dataCalibracao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dataCalibracao']),
      validadeCalibracao: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['validadeCalibracao']),
      status: jsonSerialization['status'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int ferramentaId;

  DateTime dataCalibracao;

  DateTime validadeCalibracao;

  String status;

  /// Returns a shallow copy of this [Calibracao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Calibracao copyWith({
    int? id,
    int? ferramentaId,
    DateTime? dataCalibracao,
    DateTime? validadeCalibracao,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ferramentaId': ferramentaId,
      'dataCalibracao': dataCalibracao.toJson(),
      'validadeCalibracao': validadeCalibracao.toJson(),
      'status': status,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CalibracaoImpl extends Calibracao {
  _CalibracaoImpl({
    int? id,
    required int ferramentaId,
    required DateTime dataCalibracao,
    required DateTime validadeCalibracao,
    required String status,
  }) : super._(
          id: id,
          ferramentaId: ferramentaId,
          dataCalibracao: dataCalibracao,
          validadeCalibracao: validadeCalibracao,
          status: status,
        );

  /// Returns a shallow copy of this [Calibracao]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Calibracao copyWith({
    Object? id = _Undefined,
    int? ferramentaId,
    DateTime? dataCalibracao,
    DateTime? validadeCalibracao,
    String? status,
  }) {
    return Calibracao(
      id: id is int? ? id : this.id,
      ferramentaId: ferramentaId ?? this.ferramentaId,
      dataCalibracao: dataCalibracao ?? this.dataCalibracao,
      validadeCalibracao: validadeCalibracao ?? this.validadeCalibracao,
      status: status ?? this.status,
    );
  }
}
