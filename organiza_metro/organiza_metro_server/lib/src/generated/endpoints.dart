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
import '../endpoints/auth_utils_endpoint.dart' as _i2;
import '../endpoints/ferramenta_endpoint.dart' as _i3;
import '../endpoints/material_endpoint.dart' as _i4;
import '../greeting_endpoint.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'authUtils': _i2.AuthUtilsEndpoint()
        ..initialize(
          server,
          'authUtils',
          null,
        ),
      'ferramenta': _i3.FerramentaEndpoint()
        ..initialize(
          server,
          'ferramenta',
          null,
        ),
      'material': _i4.MaterialEndpoint()
        ..initialize(
          server,
          'material',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
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
              (endpoints['authUtils'] as _i2.AuthUtilsEndpoint)
                  .isAdmin(session),
        ),
        'getUserName': _i1.MethodConnector(
          name: 'getUserName',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['authUtils'] as _i2.AuthUtilsEndpoint)
                  .getUserName(session),
        ),
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
              (endpoints['ferramenta'] as _i3.FerramentaEndpoint)
                  .getEstoque(session),
        )
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
              (endpoints['material'] as _i4.MaterialEndpoint)
                  .getEstoque(session),
        )
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
              (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
