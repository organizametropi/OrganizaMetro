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
import 'alertas.dart' as _i2;
import 'base.dart' as _i3;
import 'calibracao.dart' as _i4;
import 'consumo_mensal.dart' as _i5;
import 'consumo_periodo_detalhado.dart' as _i6;
import 'ferramenta.dart' as _i7;
import 'ferramenta_edit_dto.dart' as _i8;
import 'material.dart' as _i9;
import 'material_edit_dto.dart' as _i10;
import 'movimentacao.dart' as _i11;
import 'requisicao_items.dart' as _i12;
import 'tipo_material.dart' as _i13;
import 'unidade_medida.dart' as _i14;
import 'user_info.dart' as _i15;
import 'veiculo.dart' as _i16;
import 'package:organiza_metro_client/src/protocol/ferramenta.dart' as _i17;
import 'package:organiza_metro_client/src/protocol/alertas.dart' as _i18;
import 'package:organiza_metro_client/src/protocol/material.dart' as _i19;
import 'package:organiza_metro_client/src/protocol/tipo_material.dart' as _i20;
import 'package:organiza_metro_client/src/protocol/unidade_medida.dart' as _i21;
import 'package:organiza_metro_client/src/protocol/base.dart' as _i22;
import 'package:organiza_metro_client/src/protocol/veiculo.dart' as _i23;
import 'package:organiza_metro_client/src/protocol/calibracao.dart' as _i24;
import 'package:organiza_metro_client/src/protocol/user_info.dart' as _i25;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i26;
import 'package:organiza_metro_client/src/protocol/requisicao_items.dart'
    as _i27;
import 'package:organiza_metro_client/src/protocol/consumo_mensal.dart' as _i28;
import 'package:organiza_metro_client/src/protocol/consumo_periodo_detalhado.dart'
    as _i29;
import 'package:organiza_metro_client/src/protocol/movimentacao.dart' as _i30;
export 'alertas.dart';
export 'base.dart';
export 'calibracao.dart';
export 'consumo_mensal.dart';
export 'consumo_periodo_detalhado.dart';
export 'ferramenta.dart';
export 'ferramenta_edit_dto.dart';
export 'material.dart';
export 'material_edit_dto.dart';
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
    if (t == _i2.Alerta) {
      return _i2.Alerta.fromJson(data) as T;
    }
    if (t == _i3.Base) {
      return _i3.Base.fromJson(data) as T;
    }
    if (t == _i4.Calibracao) {
      return _i4.Calibracao.fromJson(data) as T;
    }
    if (t == _i5.ConsumoMensal) {
      return _i5.ConsumoMensal.fromJson(data) as T;
    }
    if (t == _i6.ConsumoPeriodoDetalhado) {
      return _i6.ConsumoPeriodoDetalhado.fromJson(data) as T;
    }
    if (t == _i7.Ferramenta) {
      return _i7.Ferramenta.fromJson(data) as T;
    }
    if (t == _i8.FerramentaEditDto) {
      return _i8.FerramentaEditDto.fromJson(data) as T;
    }
    if (t == _i9.Material) {
      return _i9.Material.fromJson(data) as T;
    }
    if (t == _i10.MaterialEditDto) {
      return _i10.MaterialEditDto.fromJson(data) as T;
    }
    if (t == _i11.Movimentacao) {
      return _i11.Movimentacao.fromJson(data) as T;
    }
    if (t == _i12.RequisicaoItem) {
      return _i12.RequisicaoItem.fromJson(data) as T;
    }
    if (t == _i13.TipoMaterial) {
      return _i13.TipoMaterial.fromJson(data) as T;
    }
    if (t == _i14.UnidadeMedida) {
      return _i14.UnidadeMedida.fromJson(data) as T;
    }
    if (t == _i15.LocalUserInfo) {
      return _i15.LocalUserInfo.fromJson(data) as T;
    }
    if (t == _i16.Veiculo) {
      return _i16.Veiculo.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Alerta?>()) {
      return (data != null ? _i2.Alerta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Base?>()) {
      return (data != null ? _i3.Base.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Calibracao?>()) {
      return (data != null ? _i4.Calibracao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ConsumoMensal?>()) {
      return (data != null ? _i5.ConsumoMensal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ConsumoPeriodoDetalhado?>()) {
      return (data != null ? _i6.ConsumoPeriodoDetalhado.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.Ferramenta?>()) {
      return (data != null ? _i7.Ferramenta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.FerramentaEditDto?>()) {
      return (data != null ? _i8.FerramentaEditDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Material?>()) {
      return (data != null ? _i9.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.MaterialEditDto?>()) {
      return (data != null ? _i10.MaterialEditDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Movimentacao?>()) {
      return (data != null ? _i11.Movimentacao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.RequisicaoItem?>()) {
      return (data != null ? _i12.RequisicaoItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TipoMaterial?>()) {
      return (data != null ? _i13.TipoMaterial.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UnidadeMedida?>()) {
      return (data != null ? _i14.UnidadeMedida.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.LocalUserInfo?>()) {
      return (data != null ? _i15.LocalUserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Veiculo?>()) {
      return (data != null ? _i16.Veiculo.fromJson(data) : null) as T;
    }
    if (t == List<_i17.Ferramenta>) {
      return (data as List).map((e) => deserialize<_i17.Ferramenta>(e)).toList()
          as T;
    }
    if (t == List<_i18.Alerta>) {
      return (data as List).map((e) => deserialize<_i18.Alerta>(e)).toList()
          as T;
    }
    if (t == List<_i19.Material>) {
      return (data as List).map((e) => deserialize<_i19.Material>(e)).toList()
          as T;
    }
    if (t == List<_i20.TipoMaterial>) {
      return (data as List)
          .map((e) => deserialize<_i20.TipoMaterial>(e))
          .toList() as T;
    }
    if (t == List<_i21.UnidadeMedida>) {
      return (data as List)
          .map((e) => deserialize<_i21.UnidadeMedida>(e))
          .toList() as T;
    }
    if (t == List<_i22.Base>) {
      return (data as List).map((e) => deserialize<_i22.Base>(e)).toList() as T;
    }
    if (t == List<_i23.Veiculo>) {
      return (data as List).map((e) => deserialize<_i23.Veiculo>(e)).toList()
          as T;
    }
    if (t == List<_i24.Calibracao>) {
      return (data as List).map((e) => deserialize<_i24.Calibracao>(e)).toList()
          as T;
    }
    if (t == List<_i25.LocalUserInfo>) {
      return (data as List)
          .map((e) => deserialize<_i25.LocalUserInfo>(e))
          .toList() as T;
    }
    if (t == List<_i26.UserInfo>) {
      return (data as List).map((e) => deserialize<_i26.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i27.RequisicaoItem>) {
      return (data as List)
          .map((e) => deserialize<_i27.RequisicaoItem>(e))
          .toList() as T;
    }
    if (t == List<_i28.ConsumoMensal>) {
      return (data as List)
          .map((e) => deserialize<_i28.ConsumoMensal>(e))
          .toList() as T;
    }
    if (t == List<_i29.ConsumoPeriodoDetalhado>) {
      return (data as List)
          .map((e) => deserialize<_i29.ConsumoPeriodoDetalhado>(e))
          .toList() as T;
    }
    if (t == List<_i30.Movimentacao>) {
      return (data as List)
          .map((e) => deserialize<_i30.Movimentacao>(e))
          .toList() as T;
    }
    try {
      return _i26.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Alerta) {
      return 'Alerta';
    }
    if (data is _i3.Base) {
      return 'Base';
    }
    if (data is _i4.Calibracao) {
      return 'Calibracao';
    }
    if (data is _i5.ConsumoMensal) {
      return 'ConsumoMensal';
    }
    if (data is _i6.ConsumoPeriodoDetalhado) {
      return 'ConsumoPeriodoDetalhado';
    }
    if (data is _i7.Ferramenta) {
      return 'Ferramenta';
    }
    if (data is _i8.FerramentaEditDto) {
      return 'FerramentaEditDto';
    }
    if (data is _i9.Material) {
      return 'Material';
    }
    if (data is _i10.MaterialEditDto) {
      return 'MaterialEditDto';
    }
    if (data is _i11.Movimentacao) {
      return 'Movimentacao';
    }
    if (data is _i12.RequisicaoItem) {
      return 'RequisicaoItem';
    }
    if (data is _i13.TipoMaterial) {
      return 'TipoMaterial';
    }
    if (data is _i14.UnidadeMedida) {
      return 'UnidadeMedida';
    }
    if (data is _i15.LocalUserInfo) {
      return 'LocalUserInfo';
    }
    if (data is _i16.Veiculo) {
      return 'Veiculo';
    }
    className = _i26.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Alerta') {
      return deserialize<_i2.Alerta>(data['data']);
    }
    if (dataClassName == 'Base') {
      return deserialize<_i3.Base>(data['data']);
    }
    if (dataClassName == 'Calibracao') {
      return deserialize<_i4.Calibracao>(data['data']);
    }
    if (dataClassName == 'ConsumoMensal') {
      return deserialize<_i5.ConsumoMensal>(data['data']);
    }
    if (dataClassName == 'ConsumoPeriodoDetalhado') {
      return deserialize<_i6.ConsumoPeriodoDetalhado>(data['data']);
    }
    if (dataClassName == 'Ferramenta') {
      return deserialize<_i7.Ferramenta>(data['data']);
    }
    if (dataClassName == 'FerramentaEditDto') {
      return deserialize<_i8.FerramentaEditDto>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i9.Material>(data['data']);
    }
    if (dataClassName == 'MaterialEditDto') {
      return deserialize<_i10.MaterialEditDto>(data['data']);
    }
    if (dataClassName == 'Movimentacao') {
      return deserialize<_i11.Movimentacao>(data['data']);
    }
    if (dataClassName == 'RequisicaoItem') {
      return deserialize<_i12.RequisicaoItem>(data['data']);
    }
    if (dataClassName == 'TipoMaterial') {
      return deserialize<_i13.TipoMaterial>(data['data']);
    }
    if (dataClassName == 'UnidadeMedida') {
      return deserialize<_i14.UnidadeMedida>(data['data']);
    }
    if (dataClassName == 'LocalUserInfo') {
      return deserialize<_i15.LocalUserInfo>(data['data']);
    }
    if (dataClassName == 'Veiculo') {
      return deserialize<_i16.Veiculo>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i26.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
