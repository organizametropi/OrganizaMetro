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

abstract class ConsumoPeriodoDetalhado implements _i1.SerializableModel {
  ConsumoPeriodoDetalhado._({
    required this.data,
    required this.totalMaterial,
    required this.totalFerramenta,
  });

  factory ConsumoPeriodoDetalhado({
    required DateTime data,
    required double totalMaterial,
    required double totalFerramenta,
  }) = _ConsumoPeriodoDetalhadoImpl;

  factory ConsumoPeriodoDetalhado.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ConsumoPeriodoDetalhado(
      data: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['data']),
      totalMaterial: (jsonSerialization['totalMaterial'] as num).toDouble(),
      totalFerramenta: (jsonSerialization['totalFerramenta'] as num).toDouble(),
    );
  }

  DateTime data;

  double totalMaterial;

  double totalFerramenta;

  /// Returns a shallow copy of this [ConsumoPeriodoDetalhado]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ConsumoPeriodoDetalhado copyWith({
    DateTime? data,
    double? totalMaterial,
    double? totalFerramenta,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'totalMaterial': totalMaterial,
      'totalFerramenta': totalFerramenta,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ConsumoPeriodoDetalhadoImpl extends ConsumoPeriodoDetalhado {
  _ConsumoPeriodoDetalhadoImpl({
    required DateTime data,
    required double totalMaterial,
    required double totalFerramenta,
  }) : super._(
          data: data,
          totalMaterial: totalMaterial,
          totalFerramenta: totalFerramenta,
        );

  /// Returns a shallow copy of this [ConsumoPeriodoDetalhado]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ConsumoPeriodoDetalhado copyWith({
    DateTime? data,
    double? totalMaterial,
    double? totalFerramenta,
  }) {
    return ConsumoPeriodoDetalhado(
      data: data ?? this.data,
      totalMaterial: totalMaterial ?? this.totalMaterial,
      totalFerramenta: totalFerramenta ?? this.totalFerramenta,
    );
  }
}
