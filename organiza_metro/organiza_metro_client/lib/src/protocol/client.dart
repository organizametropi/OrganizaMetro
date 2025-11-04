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
import 'package:organiza_metro_client/src/protocol/alertas.dart' as _i3;
import 'package:organiza_metro_client/src/protocol/ferramenta.dart' as _i4;
import 'package:organiza_metro_client/src/protocol/material.dart' as _i5;
import 'package:organiza_metro_client/src/protocol/requisicao_items.dart'
    as _i6;
import 'package:organiza_metro_client/src/protocol/movimentacao.dart' as _i7;
import 'package:organiza_metro_client/src/protocol/greeting.dart' as _i8;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i9;
import 'protocol.dart' as _i10;

/// Endpoint para funções administrativas (acesso restrito por permissão).
/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<List<_i3.Alerta>> getAdminAlerts() =>
      caller.callServerEndpoint<List<_i3.Alerta>>(
        'admin',
        'getAdminAlerts',
        {},
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

  _i2.Future<List<_i4.Ferramenta>> getEstoque() =>
      caller.callServerEndpoint<List<_i4.Ferramenta>>(
        'ferramenta',
        'getEstoque',
        {},
      );

  _i2.Future<List<_i4.Ferramenta>> getMinhasFerramentas() =>
      caller.callServerEndpoint<List<_i4.Ferramenta>>(
        'ferramenta',
        'getMinhasFerramentas',
        {},
      );
}

/// {@category Endpoint}
class EndpointMaterial extends _i1.EndpointRef {
  EndpointMaterial(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'material';

  _i2.Future<List<_i5.Material>> getEstoque() =>
      caller.callServerEndpoint<List<_i5.Material>>(
        'material',
        'getEstoque',
        {},
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
    required List<_i6.RequisicaoItem> itens,
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
class EndpointUserData extends _i1.EndpointRef {
  EndpointUserData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userData';

  /// Retorna as notificações ATIVAS destinadas a este usuário ou gerais.
  _i2.Future<List<_i3.Alerta>> getMyAlerts() =>
      caller.callServerEndpoint<List<_i3.Alerta>>(
        'userData',
        'getMyAlerts',
        {},
      );

  /// Retorna o histórico de movimentações do usuário logado.
  _i2.Future<List<_i7.Movimentacao>> getMyHistory() =>
      caller.callServerEndpoint<List<_i7.Movimentacao>>(
        'userData',
        'getMyHistory',
        {},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i8.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i8.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i9.Caller(client);
  }

  late final _i9.Caller auth;
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
          _i10.Protocol(),
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
    userData = EndpointUserData(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointAuthUtils authUtils;

  late final EndpointCron cron;

  late final EndpointFerramenta ferramenta;

  late final EndpointMaterial material;

  late final EndpointMovimentacao movimentacao;

  late final EndpointUserData userData;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'authUtils': authUtils,
        'cron': cron,
        'ferramenta': ferramenta,
        'material': material,
        'movimentacao': movimentacao,
        'userData': userData,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
