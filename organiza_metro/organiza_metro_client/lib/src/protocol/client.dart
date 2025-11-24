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
import 'dart:async' as _i2;
import 'package:organiza_metro_client/src/protocol/material.dart' as _i3;
import 'package:organiza_metro_client/src/protocol/material_edit_dto.dart'
    as _i4;
import 'package:organiza_metro_client/src/protocol/ferramenta.dart' as _i5;
import 'package:organiza_metro_client/src/protocol/ferramenta_edit_dto.dart'
    as _i6;
import 'package:organiza_metro_client/src/protocol/user_info.dart' as _i7;
import 'package:organiza_metro_client/src/protocol/alertas.dart' as _i8;
import 'package:organiza_metro_client/src/protocol/tipo_material.dart' as _i9;
import 'package:organiza_metro_client/src/protocol/unidade_medida.dart' as _i10;
import 'package:organiza_metro_client/src/protocol/base.dart' as _i11;
import 'package:organiza_metro_client/src/protocol/veiculo.dart' as _i12;
import 'package:organiza_metro_client/src/protocol/calibracao.dart' as _i13;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i14;
import 'package:organiza_metro_client/src/protocol/requisicao_items.dart'
    as _i15;
import 'package:organiza_metro_client/src/protocol/consumo_mensal.dart' as _i16;
import 'package:organiza_metro_client/src/protocol/consumo_periodo_detalhado.dart'
    as _i17;
import 'package:organiza_metro_client/src/protocol/movimentacao.dart' as _i18;
import 'protocol.dart' as _i19;

/// Endpoint para funções administrativas (acesso restrito por permissão).
/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<_i3.Material> addMaterial(_i4.MaterialEditDto dto) =>
      caller.callServerEndpoint<_i3.Material>(
        'admin',
        'addMaterial',
        {'dto': dto},
      );

  _i2.Future<_i5.Ferramenta> addFerramenta(_i6.FerramentaEditDto dto) =>
      caller.callServerEndpoint<_i5.Ferramenta>(
        'admin',
        'addFerramenta',
        {'dto': dto},
      );

  _i2.Future<_i7.LocalUserInfo> addEmployee(
    String nome,
    String email,
    String senha,
    String registro,
    String telefone,
    String area,
    bool isAdmin,
  ) =>
      caller.callServerEndpoint<_i7.LocalUserInfo>(
        'admin',
        'addEmployee',
        {
          'nome': nome,
          'email': email,
          'senha': senha,
          'registro': registro,
          'telefone': telefone,
          'area': area,
          'isAdmin': isAdmin,
        },
      );

  _i2.Future<List<_i5.Ferramenta>> getTodasFerramentas() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'admin',
        'getTodasFerramentas',
        {},
      );

  _i2.Future<List<_i5.Ferramenta>> getFerramentasPaginadas(
    int offset,
    int limit,
  ) =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'admin',
        'getFerramentasPaginadas',
        {
          'offset': offset,
          'limit': limit,
        },
      );

  _i2.Future<bool> updateFerramenta(_i6.FerramentaEditDto update) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'updateFerramenta',
        {'update': update},
      );

  _i2.Future<bool> deleteFerramenta(int id) => caller.callServerEndpoint<bool>(
        'admin',
        'deleteFerramenta',
        {'id': id},
      );

  _i2.Future<List<_i8.Alerta>> getAdminAlerts() =>
      caller.callServerEndpoint<List<_i8.Alerta>>(
        'admin',
        'getAdminAlerts',
        {},
      );

  _i2.Future<bool> updateMaterial(_i4.MaterialEditDto update) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'updateMaterial',
        {'update': update},
      );

  _i2.Future<bool> deleteMaterial(int id) => caller.callServerEndpoint<bool>(
        'admin',
        'deleteMaterial',
        {'id': id},
      );

  _i2.Future<List<_i3.Material>> getTodosMateriais() =>
      caller.callServerEndpoint<List<_i3.Material>>(
        'admin',
        'getTodosMateriais',
        {},
      );

  _i2.Future<List<_i9.TipoMaterial>> getTiposMateriais() =>
      caller.callServerEndpoint<List<_i9.TipoMaterial>>(
        'admin',
        'getTiposMateriais',
        {},
      );

  _i2.Future<List<_i10.UnidadeMedida>> getUnidadesMedida() =>
      caller.callServerEndpoint<List<_i10.UnidadeMedida>>(
        'admin',
        'getUnidadesMedida',
        {},
      );

  _i2.Future<List<_i11.Base>> getBases() =>
      caller.callServerEndpoint<List<_i11.Base>>(
        'admin',
        'getBases',
        {},
      );

  _i2.Future<List<_i12.Veiculo>> getVeiculos() =>
      caller.callServerEndpoint<List<_i12.Veiculo>>(
        'admin',
        'getVeiculos',
        {},
      );

  /// Retorna ferramentas que possuem patrimônio (candidatas a calibração)
  _i2.Future<List<_i5.Ferramenta>> getFerramentasComPatrimonio() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'admin',
        'getFerramentasComPatrimonio',
        {},
      );

  /// Lista calibrações (ativas) com a ferramenta incluída
  _i2.Future<List<_i13.Calibracao>> getCalibracoesAtivas() =>
      caller.callServerEndpoint<List<_i13.Calibracao>>(
        'admin',
        'getCalibracoesAtivas',
        {},
      );

  /// Cria uma nova calibração
  _i2.Future<_i13.Calibracao> addCalibracao(
    int ferramentaId,
    DateTime dataCalibracao,
    DateTime validadeCalibracao,
    String status,
  ) =>
      caller.callServerEndpoint<_i13.Calibracao>(
        'admin',
        'addCalibracao',
        {
          'ferramentaId': ferramentaId,
          'dataCalibracao': dataCalibracao,
          'validadeCalibracao': validadeCalibracao,
          'status': status,
        },
      );

  /// Remove uma calibração por id
  _i2.Future<bool> removeCalibracao(int id) => caller.callServerEndpoint<bool>(
        'admin',
        'removeCalibracao',
        {'id': id},
      );

  /// Retorna todos os funcionários locais (LocalUserInfo)
  _i2.Future<List<_i7.LocalUserInfo>> getAllEmployees() =>
      caller.callServerEndpoint<List<_i7.LocalUserInfo>>(
        'admin',
        'getAllEmployees',
        {},
      );

  /// Retorna informações de usuário do módulo auth para os ids informados
  _i2.Future<List<_i14.UserInfo>> getAuthUsersByIds(List<int> ids) =>
      caller.callServerEndpoint<List<_i14.UserInfo>>(
        'admin',
        'getAuthUsersByIds',
        {'ids': ids},
      );

  /// Remove um funcionário local por id (apaga somente LocalUserInfo)
  _i2.Future<bool> removeEmployee(int localUserInfoId) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'removeEmployee',
        {'localUserInfoId': localUserInfoId},
      );
}

/// Endpoint para utilidades de autenticação e permissão
/// {@category Endpoint}
class EndpointAuthUtils extends _i1.EndpointRef {
  EndpointAuthUtils(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'authUtils';

  _i2.Future<bool> isAdmin() => caller.callServerEndpoint<bool>(
        'authUtils',
        'isAdmin',
        {},
      );

  _i2.Future<String?> getUserName() => caller.callServerEndpoint<String?>(
        'authUtils',
        'getUserName',
        {},
      );
}

/// {@category Endpoint}
class EndpointCron extends _i1.EndpointRef {
  EndpointCron(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cron';

  _i2.Future<void> verificarAlertas() => caller.callServerEndpoint<void>(
        'cron',
        'verificarAlertas',
        {},
      );
}

/// {@category Endpoint}
class EndpointFerramenta extends _i1.EndpointRef {
  EndpointFerramenta(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ferramenta';

  _i2.Future<List<_i5.Ferramenta>> getEstoque() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'ferramenta',
        'getEstoque',
        {},
      );

  _i2.Future<List<_i5.Ferramenta>> getMinhasFerramentas() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'ferramenta',
        'getMinhasFerramentas',
        {},
      );

  _i2.Future<List<_i5.Ferramenta>> getDisponiveis() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'ferramenta',
        'getDisponiveis',
        {},
      );
}

/// {@category Endpoint}
class EndpointMaterial extends _i1.EndpointRef {
  EndpointMaterial(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'material';

  _i2.Future<List<_i3.Material>> getEstoque() =>
      caller.callServerEndpoint<List<_i3.Material>>(
        'material',
        'getEstoque',
        {},
      );

  _i2.Future<List<_i3.Material>> getMateriaisByLocation({
    int? baseId,
    int? veiculoId,
  }) =>
      caller.callServerEndpoint<List<_i3.Material>>(
        'material',
        'getMateriaisByLocation',
        {
          'baseId': baseId,
          'veiculoId': veiculoId,
        },
      );
}

/// Endpoint responsável por criar e gerenciar Movimentações.
/// {@category Endpoint}
class EndpointMovimentacao extends _i1.EndpointRef {
  EndpointMovimentacao(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'movimentacao';

  /// Cria uma requisição de saída de itens (Materiais e/ou Ferramentas).
  ///
  /// A operação é executada dentro de uma transação atômica.
  _i2.Future<bool> criarRequisicaoSaida({
    required List<_i15.RequisicaoItem> itens,
    required String modalidadeEntrega,
    required DateTime dataDaMovimentacao,
    DateTime? dataDevolucao,
    String? observacao,
    int? destinoBaseId,
    int? destinoVeiculoId,
  }) =>
      caller.callServerEndpoint<bool>(
        'movimentacao',
        'criarRequisicaoSaida',
        {
          'itens': itens,
          'modalidadeEntrega': modalidadeEntrega,
          'dataDaMovimentacao': dataDaMovimentacao,
          'dataDevolucao': dataDevolucao,
          'observacao': observacao,
          'destinoBaseId': destinoBaseId,
          'destinoVeiculoId': destinoVeiculoId,
        },
      );

  _i2.Future<bool> processarDevolucaoFerramenta({
    required int ferramentaId,
    required DateTime dataDaMovimentacao,
    int? destinoBaseId,
    int? destinoVeiculoId,
    String? observacao,
  }) =>
      caller.callServerEndpoint<bool>(
        'movimentacao',
        'processarDevolucaoFerramenta',
        {
          'ferramentaId': ferramentaId,
          'dataDaMovimentacao': dataDaMovimentacao,
          'destinoBaseId': destinoBaseId,
          'destinoVeiculoId': destinoVeiculoId,
          'observacao': observacao,
        },
      );
}

/// {@category Endpoint}
class EndpointRelatorios extends _i1.EndpointRef {
  EndpointRelatorios(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'relatorios';

  _i2.Future<List<_i16.ConsumoMensal>> getTopConsumidosMaterial(int LIMIT) =>
      caller.callServerEndpoint<List<_i16.ConsumoMensal>>(
        'relatorios',
        'getTopConsumidosMaterial',
        {'LIMIT': LIMIT},
      );

  _i2.Future<List<_i16.ConsumoMensal>> getTopConsumidosFerramenta(int LIMIT) =>
      caller.callServerEndpoint<List<_i16.ConsumoMensal>>(
        'relatorios',
        'getTopConsumidosFerramenta',
        {'LIMIT': LIMIT},
      );

  _i2.Future<List<_i16.ConsumoMensal>> getConsmuoMaterialClBase() =>
      caller.callServerEndpoint<List<_i16.ConsumoMensal>>(
        'relatorios',
        'getConsmuoMaterialClBase',
        {},
      );

  _i2.Future<List<_i16.ConsumoMensal>> getConsmuoMaterialClVeiculo() =>
      caller.callServerEndpoint<List<_i16.ConsumoMensal>>(
        'relatorios',
        'getConsmuoMaterialClVeiculo',
        {},
      );

  _i2.Future<List<_i16.ConsumoMensal>> getConsmuoFerramentaClBase() =>
      caller.callServerEndpoint<List<_i16.ConsumoMensal>>(
        'relatorios',
        'getConsmuoFerramentaClBase',
        {},
      );

  _i2.Future<List<_i16.ConsumoMensal>> getConsmuoFerramentaClVeiculo() =>
      caller.callServerEndpoint<List<_i16.ConsumoMensal>>(
        'relatorios',
        'getConsmuoFerramentaClVeiculo',
        {},
      );

  _i2.Future<List<_i5.Ferramenta>> getInstrumentosCalibracao() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'relatorios',
        'getInstrumentosCalibracao',
        {},
      );

  _i2.Future<List<_i5.Ferramenta>> getInstrumentosEmUso() =>
      caller.callServerEndpoint<List<_i5.Ferramenta>>(
        'relatorios',
        'getInstrumentosEmUso',
        {},
      );

  _i2.Future<List<_i7.LocalUserInfo>> getLocalUserInfosByUserIds(
          List<int> userIds) =>
      caller.callServerEndpoint<List<_i7.LocalUserInfo>>(
        'relatorios',
        'getLocalUserInfosByUserIds',
        {'userIds': userIds},
      );

  /// PBI 3.2.2: Retorna o consumo total de Materiais e Ferramentas agrupado por dia.
  _i2.Future<List<_i17.ConsumoPeriodoDetalhado>> getConsumoDetalhadoPorPeriodo({
    required DateTime dataInicio,
    required DateTime dataFim,
  }) =>
      caller.callServerEndpoint<List<_i17.ConsumoPeriodoDetalhado>>(
        'relatorios',
        'getConsumoDetalhadoPorPeriodo',
        {
          'dataInicio': dataInicio,
          'dataFim': dataFim,
        },
      );

  /// Retorna todas as movimentações (com includes de relações importantes)
  _i2.Future<List<_i18.Movimentacao>> getMovimentacoes() =>
      caller.callServerEndpoint<List<_i18.Movimentacao>>(
        'relatorios',
        'getMovimentacoes',
        {},
      );

  /// Retorna calibrações vencidas (ou já expiradas) com include da ferramenta
  _i2.Future<List<_i13.Calibracao>> getCalibracoesVencidas() =>
      caller.callServerEndpoint<List<_i13.Calibracao>>(
        'relatorios',
        'getCalibracoesVencidas',
        {},
      );
}

/// {@category Endpoint}
class EndpointUserData extends _i1.EndpointRef {
  EndpointUserData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userData';

  /// Retorna as notificações ATIVAS destinadas a este usuário ou gerais.
  _i2.Future<List<_i8.Alerta>> getMyAlerts() =>
      caller.callServerEndpoint<List<_i8.Alerta>>(
        'userData',
        'getMyAlerts',
        {},
      );

  /// Retorna o histórico de movimentações do usuário logado.
  _i2.Future<List<_i18.Movimentacao>> getMyHistory() =>
      caller.callServerEndpoint<List<_i18.Movimentacao>>(
        'userData',
        'getMyHistory',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i14.Caller(client);
  }

  late final _i14.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i19.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    admin = EndpointAdmin(this);
    authUtils = EndpointAuthUtils(this);
    cron = EndpointCron(this);
    ferramenta = EndpointFerramenta(this);
    material = EndpointMaterial(this);
    movimentacao = EndpointMovimentacao(this);
    relatorios = EndpointRelatorios(this);
    userData = EndpointUserData(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointAuthUtils authUtils;

  late final EndpointCron cron;

  late final EndpointFerramenta ferramenta;

  late final EndpointMaterial material;

  late final EndpointMovimentacao movimentacao;

  late final EndpointRelatorios relatorios;

  late final EndpointUserData userData;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'authUtils': authUtils,
        'cron': cron,
        'ferramenta': ferramenta,
        'material': material,
        'movimentacao': movimentacao,
        'relatorios': relatorios,
        'userData': userData,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
