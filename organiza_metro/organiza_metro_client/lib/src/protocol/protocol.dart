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
import 'greeting.dart' as _i2;
import 'base.dart' as _i3;
import 'calibracao.dart' as _i4;
import 'ferramenta.dart' as _i5;
import 'material.dart' as _i6;
import 'movimentacao.dart' as _i7;
import 'requisicao_items.dart' as _i8;
import 'tipo_material.dart' as _i9;
import 'unidade_medida.dart' as _i10;
import 'user_info.dart' as _i11;
import 'veiculo.dart' as _i12;
import 'package:organiza_metro_client/src/protocol/ferramenta.dart' as _i13;
import 'package:organiza_metro_client/src/protocol/material.dart' as _i14;
import 'package:organiza_metro_client/src/protocol/requisicao_items.dart'
    as _i15;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i16;
export 'greeting.dart';
export 'base.dart';
export 'calibracao.dart';
export 'ferramenta.dart';
export 'material.dart';
export 'movimentacao.dart';
export 'requisicao_items.dart';
export 'tipo_material.dart';
export 'unidade_medida.dart';
export 'user_info.dart';
export 'veiculo.dart';
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
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.Base) {
      return _i3.Base.fromJson(data) as T;
    }
    if (t == _i4.Calibracao) {
      return _i4.Calibracao.fromJson(data) as T;
    }
    if (t == _i5.Ferramenta) {
      return _i5.Ferramenta.fromJson(data) as T;
    }
    if (t == _i6.Material) {
      return _i6.Material.fromJson(data) as T;
    }
    if (t == _i7.Movimentacao) {
      return _i7.Movimentacao.fromJson(data) as T;
    }
    if (t == _i8.RequisicaoItem) {
      return _i8.RequisicaoItem.fromJson(data) as T;
    }
    if (t == _i9.TipoMaterial) {
      return _i9.TipoMaterial.fromJson(data) as T;
    }
    if (t == _i10.UnidadeMedida) {
      return _i10.UnidadeMedida.fromJson(data) as T;
    }
    if (t == _i11.LocalUserInfo) {
      return _i11.LocalUserInfo.fromJson(data) as T;
    }
    if (t == _i12.Veiculo) {
      return _i12.Veiculo.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Base?>()) {
      return (data != null ? _i3.Base.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Calibracao?>()) {
      return (data != null ? _i4.Calibracao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Ferramenta?>()) {
      return (data != null ? _i5.Ferramenta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Material?>()) {
      return (data != null ? _i6.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Movimentacao?>()) {
      return (data != null ? _i7.Movimentacao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.RequisicaoItem?>()) {
      return (data != null ? _i8.RequisicaoItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TipoMaterial?>()) {
      return (data != null ? _i9.TipoMaterial.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.UnidadeMedida?>()) {
      return (data != null ? _i10.UnidadeMedida.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.LocalUserInfo?>()) {
      return (data != null ? _i11.LocalUserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Veiculo?>()) {
      return (data != null ? _i12.Veiculo.fromJson(data) : null) as T;
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
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.Base) {
      return 'Base';
    }
    if (data is _i4.Calibracao) {
      return 'Calibracao';
    }
    if (data is _i5.Ferramenta) {
      return 'Ferramenta';
    }
    if (data is _i6.Material) {
      return 'Material';
    }
    if (data is _i7.Movimentacao) {
      return 'Movimentacao';
    }
    if (data is _i8.RequisicaoItem) {
      return 'RequisicaoItem';
    }
    if (data is _i9.TipoMaterial) {
      return 'TipoMaterial';
    }
    if (data is _i10.UnidadeMedida) {
      return 'UnidadeMedida';
    }
    if (data is _i11.LocalUserInfo) {
      return 'LocalUserInfo';
    }
    if (data is _i12.Veiculo) {
      return 'Veiculo';
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
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'Base') {
      return deserialize<_i3.Base>(data['data']);
    }
    if (dataClassName == 'Calibracao') {
      return deserialize<_i4.Calibracao>(data['data']);
    }
    if (dataClassName == 'Ferramenta') {
      return deserialize<_i5.Ferramenta>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i6.Material>(data['data']);
    }
    if (dataClassName == 'Movimentacao') {
      return deserialize<_i7.Movimentacao>(data['data']);
    }
    if (dataClassName == 'RequisicaoItem') {
      return deserialize<_i8.RequisicaoItem>(data['data']);
    }
    if (dataClassName == 'TipoMaterial') {
      return deserialize<_i9.TipoMaterial>(data['data']);
    }
    if (dataClassName == 'UnidadeMedida') {
      return deserialize<_i10.UnidadeMedida>(data['data']);
    }
    if (dataClassName == 'LocalUserInfo') {
      return deserialize<_i11.LocalUserInfo>(data['data']);
    }
    if (dataClassName == 'Veiculo') {
      return deserialize<_i12.Veiculo>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
