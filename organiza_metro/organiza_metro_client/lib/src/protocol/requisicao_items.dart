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
import 'material.dart' as _i2;
import 'ferramenta.dart' as _i3;

abstract class RequisicaoItem implements _i1.SerializableModel {
  RequisicaoItem._({
    this.id,
    this.materialId,
    this.material,
    this.ferramentaId,
    this.ferramenta,
    required this.quantidade,
  });

  factory RequisicaoItem({
    int? id,
    int? materialId,
    _i2.Material? material,
    int? ferramentaId,
    _i3.Ferramenta? ferramenta,
    required double quantidade,
  }) = _RequisicaoItemImpl;

  factory RequisicaoItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequisicaoItem(
      id: jsonSerialization['id'] as int?,
      materialId: jsonSerialization['materialId'] as int?,
      material: jsonSerialization['material'] == null
          ? null
          : _i2.Material.fromJson(
              (jsonSerialization['material'] as Map<String, dynamic>)),
      ferramentaId: jsonSerialization['ferramentaId'] as int?,
      ferramenta: jsonSerialization['ferramenta'] == null
          ? null
          : _i3.Ferramenta.fromJson(
              (jsonSerialization['ferramenta'] as Map<String, dynamic>)),
      quantidade: (jsonSerialization['quantidade'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? materialId;

  _i2.Material? material;

  int? ferramentaId;

  _i3.Ferramenta? ferramenta;

  double quantidade;

  /// Returns a shallow copy of this [RequisicaoItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequisicaoItem copyWith({
    int? id,
    int? materialId,
    _i2.Material? material,
    int? ferramentaId,
    _i3.Ferramenta? ferramenta,
    double? quantidade,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (materialId != null) 'materialId': materialId,
      if (material != null) 'material': material?.toJson(),
      if (ferramentaId != null) 'ferramentaId': ferramentaId,
      if (ferramenta != null) 'ferramenta': ferramenta?.toJson(),
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
    int? id,
    int? materialId,
    _i2.Material? material,
    int? ferramentaId,
    _i3.Ferramenta? ferramenta,
    required double quantidade,
  }) : super._(
          id: id,
          materialId: materialId,
          material: material,
          ferramentaId: ferramentaId,
          ferramenta: ferramenta,
          quantidade: quantidade,
        );

  /// Returns a shallow copy of this [RequisicaoItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequisicaoItem copyWith({
    Object? id = _Undefined,
    Object? materialId = _Undefined,
    Object? material = _Undefined,
    Object? ferramentaId = _Undefined,
    Object? ferramenta = _Undefined,
    double? quantidade,
  }) {
    return RequisicaoItem(
      id: id is int? ? id : this.id,
      materialId: materialId is int? ? materialId : this.materialId,
      material:
          material is _i2.Material? ? material : this.material?.copyWith(),
      ferramentaId: ferramentaId is int? ? ferramentaId : this.ferramentaId,
      ferramenta: ferramenta is _i3.Ferramenta?
          ? ferramenta
          : this.ferramenta?.copyWith(),
      quantidade: quantidade ?? this.quantidade,
    );
  }
}
