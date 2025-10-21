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
import 'generated/models/base.dart' as _i2;
import 'generated/models/calibracao.dart' as _i3;
import 'generated/models/ferramenta.dart' as _i4;
import 'generated/models/material.dart' as _i5;
import 'generated/models/movimentacao.dart' as _i6;
import 'generated/models/requisicao_items.dart' as _i7;
import 'generated/models/tipo_material.dart' as _i8;
import 'generated/models/unidade_medida.dart' as _i9;
import 'generated/models/user_info.dart' as _i10;
import 'generated/models/veiculo.dart' as _i11;
import 'greeting.dart' as _i12;
import 'package:organiza_metro_client/src/protocol/generated/models/ferramenta.dart'
    as _i13;
import 'package:organiza_metro_client/src/protocol/generated/models/material.dart'
    as _i14;
import 'package:organiza_metro_client/src/protocol/generated/models/requisicao_items.dart'
    as _i15;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i16;
export 'generated/models/base.dart';
export 'generated/models/calibracao.dart';
export 'generated/models/ferramenta.dart';
export 'generated/models/material.dart';
export 'generated/models/movimentacao.dart';
export 'generated/models/requisicao_items.dart';
export 'generated/models/tipo_material.dart';
export 'generated/models/unidade_medida.dart';
export 'generated/models/user_info.dart';
export 'generated/models/veiculo.dart';
export 'greeting.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Base) {
      return _i2.Base.fromJson(data) as T;
    }
    if (t == _i3.Calibracao) {
      return _i3.Calibracao.fromJson(data) as T;
    }
    if (t == _i4.Ferramenta) {
      return _i4.Ferramenta.fromJson(data) as T;
    }
    if (t == _i5.Material) {
      return _i5.Material.fromJson(data) as T;
    }
    if (t == _i6.Movimentacao) {
      return _i6.Movimentacao.fromJson(data) as T;
    }
    if (t == _i7.RequisicaoItem) {
      return _i7.RequisicaoItem.fromJson(data) as T;
    }
    if (t == _i8.TipoMaterial) {
      return _i8.TipoMaterial.fromJson(data) as T;
    }
    if (t == _i9.UnidadeMedida) {
      return _i9.UnidadeMedida.fromJson(data) as T;
    }
    if (t == _i10.UserInfo) {
      return _i10.UserInfo.fromJson(data) as T;
    }
    if (t == _i11.Veiculo) {
      return _i11.Veiculo.fromJson(data) as T;
    }
    if (t == _i12.Greeting) {
      return _i12.Greeting.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Base?>()) {
      return (data != null ? _i2.Base.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Calibracao?>()) {
      return (data != null ? _i3.Calibracao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Ferramenta?>()) {
      return (data != null ? _i4.Ferramenta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Material?>()) {
      return (data != null ? _i5.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Movimentacao?>()) {
      return (data != null ? _i6.Movimentacao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.RequisicaoItem?>()) {
      return (data != null ? _i7.RequisicaoItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.TipoMaterial?>()) {
      return (data != null ? _i8.TipoMaterial.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UnidadeMedida?>()) {
      return (data != null ? _i9.UnidadeMedida.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.UserInfo?>()) {
      return (data != null ? _i10.UserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Veiculo?>()) {
      return (data != null ? _i11.Veiculo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Greeting?>()) {
      return (data != null ? _i12.Greeting.fromJson(data) : null) as T;
    }
    if (t == List<_i13.Ferramenta>) {
      return (data as List).map((e) => deserialize<_i13.Ferramenta>(e)).toList()
          as T;
    }
    if (t == List<_i14.Material>) {
      return (data as List).map((e) => deserialize<_i14.Material>(e)).toList()
          as T;
    }
    if (t == List<_i15.RequisicaoItem>) {
      return (data as List)
          .map((e) => deserialize<_i15.RequisicaoItem>(e))
          .toList() as T;
    }
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Base) {
      return 'Base';
    }
    if (data is _i3.Calibracao) {
      return 'Calibracao';
    }
    if (data is _i4.Ferramenta) {
      return 'Ferramenta';
    }
    if (data is _i5.Material) {
      return 'Material';
    }
    if (data is _i6.Movimentacao) {
      return 'Movimentacao';
    }
    if (data is _i7.RequisicaoItem) {
      return 'RequisicaoItem';
    }
    if (data is _i8.TipoMaterial) {
      return 'TipoMaterial';
    }
    if (data is _i9.UnidadeMedida) {
      return 'UnidadeMedida';
    }
    if (data is _i10.UserInfo) {
      return 'UserInfo';
    }
    if (data is _i11.Veiculo) {
      return 'Veiculo';
    }
    if (data is _i12.Greeting) {
      return 'Greeting';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Base') {
      return deserialize<_i2.Base>(data['data']);
    }
    if (dataClassName == 'Calibracao') {
      return deserialize<_i3.Calibracao>(data['data']);
    }
    if (dataClassName == 'Ferramenta') {
      return deserialize<_i4.Ferramenta>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i5.Material>(data['data']);
    }
    if (dataClassName == 'Movimentacao') {
      return deserialize<_i6.Movimentacao>(data['data']);
    }
    if (dataClassName == 'RequisicaoItem') {
      return deserialize<_i7.RequisicaoItem>(data['data']);
    }
    if (dataClassName == 'TipoMaterial') {
      return deserialize<_i8.TipoMaterial>(data['data']);
    }
    if (dataClassName == 'UnidadeMedida') {
      return deserialize<_i9.UnidadeMedida>(data['data']);
    }
    if (dataClassName == 'UserInfo') {
      return deserialize<_i10.UserInfo>(data['data']);
    }
    if (dataClassName == 'Veiculo') {
      return deserialize<_i11.Veiculo>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i12.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
