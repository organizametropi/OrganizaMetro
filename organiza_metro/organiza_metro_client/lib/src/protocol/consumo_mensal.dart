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

abstract class ConsumoMensal implements _i1.SerializableModel {
  ConsumoMensal._({
    required this.nome,
    required this.total,
  });

  factory ConsumoMensal({
    required String nome,
    required double total,
  }) = _ConsumoMensalImpl;

  factory ConsumoMensal.fromJson(Map<String, dynamic> jsonSerialization) {
    return ConsumoMensal(
      nome: jsonSerialization['nome'] as String,
      total: (jsonSerialization['total'] as num).toDouble(),
    );
  }

  String nome;

  double total;

  /// Returns a shallow copy of this [ConsumoMensal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ConsumoMensal copyWith({
    String? nome,
    double? total,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'total': total,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ConsumoMensalImpl extends ConsumoMensal {
  _ConsumoMensalImpl({
    required String nome,
    required double total,
  }) : super._(
          nome: nome,
          total: total,
        );

  /// Returns a shallow copy of this [ConsumoMensal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ConsumoMensal copyWith({
    String? nome,
    double? total,
  }) {
    return ConsumoMensal(
      nome: nome ?? this.nome,
      total: total ?? this.total,
    );
  }
}
