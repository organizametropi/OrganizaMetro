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
import 'alertas.dart' as _i3;
import 'base.dart' as _i4;
import 'calibracao.dart' as _i5;
import 'consumo_mensal.dart' as _i6;
import 'ferramenta.dart' as _i7;
import 'material.dart' as _i8;
import 'movimentacao.dart' as _i9;
import 'requisicao_items.dart' as _i10;
import 'tipo_material.dart' as _i11;
import 'unidade_medida.dart' as _i12;
import 'user_info.dart' as _i13;
import 'veiculo.dart' as _i14;
import 'package:organiza_metro_client/src/protocol/alertas.dart' as _i15;
import 'package:organiza_metro_client/src/protocol/ferramenta.dart' as _i16;
import 'package:organiza_metro_client/src/protocol/material.dart' as _i17;
import 'package:organiza_metro_client/src/protocol/requisicao_items.dart'
    as _i18;
import 'package:organiza_metro_client/src/protocol/consumo_mensal.dart' as _i19;
import 'package:organiza_metro_client/src/protocol/movimentacao.dart' as _i20;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i21;
export 'greeting.dart';
export 'alertas.dart';
export 'base.dart';
export 'calibracao.dart';
export 'consumo_mensal.dart';
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
    if (t == _i3.Alerta) {
      return _i3.Alerta.fromJson(data) as T;
    }
    if (t == _i4.Base) {
      return _i4.Base.fromJson(data) as T;
    }
    if (t == _i5.Calibracao) {
      return _i5.Calibracao.fromJson(data) as T;
    }
    if (t == _i6.ConsumoMensal) {
      return _i6.ConsumoMensal.fromJson(data) as T;
    }
    if (t == _i7.Ferramenta) {
      return _i7.Ferramenta.fromJson(data) as T;
    }
    if (t == _i8.Material) {
      return _i8.Material.fromJson(data) as T;
    }
    if (t == _i9.Movimentacao) {
      return _i9.Movimentacao.fromJson(data) as T;
    }
    if (t == _i10.RequisicaoItem) {
      return _i10.RequisicaoItem.fromJson(data) as T;
    }
    if (t == _i11.TipoMaterial) {
      return _i11.TipoMaterial.fromJson(data) as T;
    }
    if (t == _i12.UnidadeMedida) {
      return _i12.UnidadeMedida.fromJson(data) as T;
    }
    if (t == _i13.LocalUserInfo) {
      return _i13.LocalUserInfo.fromJson(data) as T;
    }
    if (t == _i14.Veiculo) {
      return _i14.Veiculo.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Alerta?>()) {
      return (data != null ? _i3.Alerta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Base?>()) {
      return (data != null ? _i4.Base.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Calibracao?>()) {
      return (data != null ? _i5.Calibracao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ConsumoMensal?>()) {
      return (data != null ? _i6.ConsumoMensal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Ferramenta?>()) {
      return (data != null ? _i7.Ferramenta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Material?>()) {
      return (data != null ? _i8.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Movimentacao?>()) {
      return (data != null ? _i9.Movimentacao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.RequisicaoItem?>()) {
      return (data != null ? _i10.RequisicaoItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TipoMaterial?>()) {
      return (data != null ? _i11.TipoMaterial.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UnidadeMedida?>()) {
      return (data != null ? _i12.UnidadeMedida.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.LocalUserInfo?>()) {
      return (data != null ? _i13.LocalUserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Veiculo?>()) {
      return (data != null ? _i14.Veiculo.fromJson(data) : null) as T;
    }
    if (t == List<_i15.Alerta>) {
      return (data as List).map((e) => deserialize<_i15.Alerta>(e)).toList()
          as T;
    }
    if (t == List<_i16.Ferramenta>) {
      return (data as List).map((e) => deserialize<_i16.Ferramenta>(e)).toList()
          as T;
    }
    if (t == List<_i17.Material>) {
      return (data as List).map((e) => deserialize<_i17.Material>(e)).toList()
          as T;
    }
    if (t == List<_i18.RequisicaoItem>) {
      return (data as List)
          .map((e) => deserialize<_i18.RequisicaoItem>(e))
          .toList() as T;
    }
    if (t == List<_i19.ConsumoMensal>) {
      return (data as List)
          .map((e) => deserialize<_i19.ConsumoMensal>(e))
          .toList() as T;
    }
    if (t == List<_i20.Movimentacao>) {
      return (data as List)
          .map((e) => deserialize<_i20.Movimentacao>(e))
          .toList() as T;
    }
    try {
      return _i21.Protocol().deserialize<T>(data, t);
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
    if (data is _i3.Alerta) {
      return 'Alerta';
    }
    if (data is _i4.Base) {
      return 'Base';
    }
    if (data is _i5.Calibracao) {
      return 'Calibracao';
    }
    if (data is _i6.ConsumoMensal) {
      return 'ConsumoMensal';
    }
    if (data is _i7.Ferramenta) {
      return 'Ferramenta';
    }
    if (data is _i8.Material) {
      return 'Material';
    }
    if (data is _i9.Movimentacao) {
      return 'Movimentacao';
    }
    if (data is _i10.RequisicaoItem) {
      return 'RequisicaoItem';
    }
    if (data is _i11.TipoMaterial) {
      return 'TipoMaterial';
    }
    if (data is _i12.UnidadeMedida) {
      return 'UnidadeMedida';
    }
    if (data is _i13.LocalUserInfo) {
      return 'LocalUserInfo';
    }
    if (data is _i14.Veiculo) {
      return 'Veiculo';
    }
    className = _i21.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Alerta') {
      return deserialize<_i3.Alerta>(data['data']);
    }
    if (dataClassName == 'Base') {
      return deserialize<_i4.Base>(data['data']);
    }
    if (dataClassName == 'Calibracao') {
      return deserialize<_i5.Calibracao>(data['data']);
    }
    if (dataClassName == 'ConsumoMensal') {
      return deserialize<_i6.ConsumoMensal>(data['data']);
    }
    if (dataClassName == 'Ferramenta') {
      return deserialize<_i7.Ferramenta>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i8.Material>(data['data']);
    }
    if (dataClassName == 'Movimentacao') {
      return deserialize<_i9.Movimentacao>(data['data']);
    }
    if (dataClassName == 'RequisicaoItem') {
      return deserialize<_i10.RequisicaoItem>(data['data']);
    }
    if (dataClassName == 'TipoMaterial') {
      return deserialize<_i11.TipoMaterial>(data['data']);
    }
    if (dataClassName == 'UnidadeMedida') {
      return deserialize<_i12.UnidadeMedida>(data['data']);
    }
    if (dataClassName == 'LocalUserInfo') {
      return deserialize<_i13.LocalUserInfo>(data['data']);
    }
    if (dataClassName == 'Veiculo') {
      return deserialize<_i14.Veiculo>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i21.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
