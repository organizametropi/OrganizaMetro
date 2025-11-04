/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/admin_endpoint.dart' as _i2;
import '../endpoints/auth_utils_endpoint.dart' as _i3;
import '../endpoints/cron_endpoint.dart' as _i4;
import '../endpoints/ferramenta_endpoint.dart' as _i5;
import '../endpoints/material_endpoint.dart' as _i6;
import '../endpoints/movimentacao_endpoint.dart' as _i7;
import '../endpoints/user_data_endpoint.dart' as _i8;
import '../greeting_endpoint.dart' as _i9;
import 'package:organiza_metro_server/src/generated/requisicao_items.dart'
    as _i10;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'admin': _i2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'authUtils': _i3.AuthUtilsEndpoint()
        ..initialize(
          server,
          'authUtils',
          null,
        ),
      'cron': _i4.CronEndpoint()
        ..initialize(
          server,
          'cron',
          null,
        ),
      'ferramenta': _i5.FerramentaEndpoint()
        ..initialize(
          server,
          'ferramenta',
          null,
        ),
      'material': _i6.MaterialEndpoint()
        ..initialize(
          server,
          'material',
          null,
        ),
      'movimentacao': _i7.MovimentacaoEndpoint()
        ..initialize(
          server,
          'movimentacao',
          null,
        ),
      'userData': _i8.UserDataEndpoint()
        ..initialize(
          server,
          'userData',
          null,
        ),
      'greeting': _i9.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'getAdminAlerts': _i1.MethodConnector(
          name: 'getAdminAlerts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getAdminAlerts(session),
        )
      },
    );
    connectors['authUtils'] = _i1.EndpointConnector(
      name: 'authUtils',
      endpoint: endpoints['authUtils']!,
      methodConnectors: {
        'isAdmin': _i1.MethodConnector(
          name: 'isAdmin',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['authUtils'] as _i3.AuthUtilsEndpoint)
                  .isAdmin(session),
        ),
        'getUserName': _i1.MethodConnector(
          name: 'getUserName',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['authUtils'] as _i3.AuthUtilsEndpoint)
                  .getUserName(session),
        ),
      },
    );
    connectors['cron'] = _i1.EndpointConnector(
      name: 'cron',
      endpoint: endpoints['cron']!,
      methodConnectors: {
        'verificarAlertas': _i1.MethodConnector(
          name: 'verificarAlertas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cron'] as _i4.CronEndpoint).verificarAlertas(session),
        )
      },
    );
    connectors['ferramenta'] = _i1.EndpointConnector(
      name: 'ferramenta',
      endpoint: endpoints['ferramenta']!,
      methodConnectors: {
        'getEstoque': _i1.MethodConnector(
          name: 'getEstoque',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ferramenta'] as _i5.FerramentaEndpoint)
                  .getEstoque(session),
        ),
        'getMinhasFerramentas': _i1.MethodConnector(
          name: 'getMinhasFerramentas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ferramenta'] as _i5.FerramentaEndpoint)
                  .getMinhasFerramentas(session),
        ),
      },
    );
    connectors['material'] = _i1.EndpointConnector(
      name: 'material',
      endpoint: endpoints['material']!,
      methodConnectors: {
        'getEstoque': _i1.MethodConnector(
          name: 'getEstoque',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint)
                  .getEstoque(session),
        )
      },
    );
    connectors['movimentacao'] = _i1.EndpointConnector(
      name: 'movimentacao',
      endpoint: endpoints['movimentacao']!,
      methodConnectors: {
        'criarRequisicaoSaida': _i1.MethodConnector(
          name: 'criarRequisicaoSaida',
          params: {
            'itens': _i1.ParameterDescription(
              name: 'itens',
              type: _i1.getType<List<_i10.RequisicaoItem>>(),
              nullable: false,
            ),
            'modalidadeEntrega': _i1.ParameterDescription(
              name: 'modalidadeEntrega',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'dataDaMovimentacao': _i1.ParameterDescription(
              name: 'dataDaMovimentacao',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'dataDevolucao': _i1.ParameterDescription(
              name: 'dataDevolucao',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'observacao': _i1.ParameterDescription(
              name: 'observacao',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'destinoBaseId': _i1.ParameterDescription(
              name: 'destinoBaseId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'destinoVeiculoId': _i1.ParameterDescription(
              name: 'destinoVeiculoId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movimentacao'] as _i7.MovimentacaoEndpoint)
                  .criarRequisicaoSaida(
            session,
            itens: params['itens'],
            modalidadeEntrega: params['modalidadeEntrega'],
            dataDaMovimentacao: params['dataDaMovimentacao'],
            dataDevolucao: params['dataDevolucao'],
            observacao: params['observacao'],
            destinoBaseId: params['destinoBaseId'],
            destinoVeiculoId: params['destinoVeiculoId'],
          ),
        ),
        'processarDevolucaoFerramenta': _i1.MethodConnector(
          name: 'processarDevolucaoFerramenta',
          params: {
            'ferramentaId': _i1.ParameterDescription(
              name: 'ferramentaId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'dataDaMovimentacao': _i1.ParameterDescription(
              name: 'dataDaMovimentacao',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'destinoBaseId': _i1.ParameterDescription(
              name: 'destinoBaseId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'destinoVeiculoId': _i1.ParameterDescription(
              name: 'destinoVeiculoId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'observacao': _i1.ParameterDescription(
              name: 'observacao',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movimentacao'] as _i7.MovimentacaoEndpoint)
                  .processarDevolucaoFerramenta(
            session,
            ferramentaId: params['ferramentaId'],
            dataDaMovimentacao: params['dataDaMovimentacao'],
            destinoBaseId: params['destinoBaseId'],
            destinoVeiculoId: params['destinoVeiculoId'],
            observacao: params['observacao'],
          ),
        ),
      },
    );
    connectors['userData'] = _i1.EndpointConnector(
      name: 'userData',
      endpoint: endpoints['userData']!,
      methodConnectors: {
        'getMyAlerts': _i1.MethodConnector(
          name: 'getMyAlerts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userData'] as _i8.UserDataEndpoint)
                  .getMyAlerts(session),
        ),
        'getMyHistory': _i1.MethodConnector(
          name: 'getMyHistory',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userData'] as _i8.UserDataEndpoint)
                  .getMyHistory(session),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i9.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i11.Endpoints()..initializeEndpoints(server);
  }
}
