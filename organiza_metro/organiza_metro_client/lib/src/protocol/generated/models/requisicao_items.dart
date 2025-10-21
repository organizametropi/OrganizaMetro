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

abstract class RequisicaoItem implements _i1.SerializableModel {
  RequisicaoItem._({
    this.materialId,
    this.ferramentaId,
    required this.quantidade,
  });

  factory RequisicaoItem({
    int? materialId,
    int? ferramentaId,
    required double quantidade,
  }) = _RequisicaoItemImpl;

  factory RequisicaoItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequisicaoItem(
      materialId: jsonSerialization['materialId'] as int?,
      ferramentaId: jsonSerialization['ferramentaId'] as int?,
      quantidade: (jsonSerialization['quantidade'] as num).toDouble(),
    );
  }

  int? materialId;

  int? ferramentaId;

  double quantidade;

  /// Returns a shallow copy of this [RequisicaoItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequisicaoItem copyWith({
    int? materialId,
    int? ferramentaId,
    double? quantidade,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (materialId != null) 'materialId': materialId,
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      'quantidade': quantidade,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequisicaoItemImpl extends RequisicaoItem {
  _RequisicaoItemImpl({
    int? materialId,
    int? ferramentaId,
    required double quantidade,
  }) : super._(
          materialId: materialId,
          ferramentaId: ferramentaId,
          quantidade: quantidade,
        );

  /// Returns a shallow copy of this [RequisicaoItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequisicaoItem copyWith({
    Object? materialId = _Undefined,
    Object? ferramentaId = _Undefined,
    double? quantidade,
  }) {
    return RequisicaoItem(
      materialId: materialId is int? ? materialId : this.materialId,
      ferramentaId: ferramentaId is int? ? ferramentaId : this.ferramentaId,
      quantidade: quantidade ?? this.quantidade,
    );
  }
}
