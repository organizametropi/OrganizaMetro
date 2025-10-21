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
import 'package:organiza_metro_client/src/protocol/generated/models/ferramenta.dart'
    as _i3;
import 'package:organiza_metro_client/src/protocol/generated/models/material.dart'
    as _i4;
import 'package:organiza_metro_client/src/protocol/generated/models/requisicao_items.dart'
    as _i5;
import 'package:organiza_metro_client/src/protocol/greeting.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

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
class EndpointFerramenta extends _i1.EndpointRef {
  EndpointFerramenta(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ferramenta';

  _i2.Future<List<_i3.Ferramenta>> getEstoque() =>
      caller.callServerEndpoint<List<_i3.Ferramenta>>(
        'ferramenta',
        'getEstoque',
        {},
      );
}

/// {@category Endpoint}
class EndpointMaterial extends _i1.EndpointRef {
  EndpointMaterial(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'material';

  _i2.Future<List<_i4.Material>> getEstoque() =>
      caller.callServerEndpoint<List<_i4.Material>>(
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
    required List<_i5.RequisicaoItem> itens,
    required String modalidadeEntrega,
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
          'observacao': observacao,
          'destinoBaseId': destinoBaseId,
          'destinoVeiculoId': destinoVeiculoId,
        },
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
  _i2.Future<_i6.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i6.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
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
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    authUtils = EndpointAuthUtils(this);
    ferramenta = EndpointFerramenta(this);
    material = EndpointMaterial(this);
    movimentacao = EndpointMovimentacao(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAuthUtils authUtils;

  late final EndpointFerramenta ferramenta;

  late final EndpointMaterial material;

  late final EndpointMovimentacao movimentacao;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'authUtils': authUtils,
        'ferramenta': ferramenta,
        'material': material,
        'movimentacao': movimentacao,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
