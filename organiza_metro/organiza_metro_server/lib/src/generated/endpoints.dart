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
import '../endpoints/relatorios_endpoint.dart' as _i8;
import '../endpoints/user_data_endpoint.dart' as _i9;
import 'package:organiza_metro_server/src/generated/material_edit_dto.dart'
    as _i10;
import 'package:organiza_metro_server/src/generated/ferramenta_edit_dto.dart'
    as _i11;
import 'package:organiza_metro_server/src/generated/requisicao_items.dart'
    as _i12;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i13;

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
      'relatorios': _i8.RelatoriosEndpoint()
        ..initialize(
          server,
          'relatorios',
          null,
        ),
      'userData': _i9.UserDataEndpoint()
        ..initialize(
          server,
          'userData',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'addMaterial': _i1.MethodConnector(
          name: 'addMaterial',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i10.MaterialEditDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).addMaterial(
            session,
            params['dto'],
          ),
        ),
        'addFerramenta': _i1.MethodConnector(
          name: 'addFerramenta',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i11.FerramentaEditDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).addFerramenta(
            session,
            params['dto'],
          ),
        ),
        'addEmployee': _i1.MethodConnector(
          name: 'addEmployee',
          params: {
            'nome': _i1.ParameterDescription(
              name: 'nome',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'senha': _i1.ParameterDescription(
              name: 'senha',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'registro': _i1.ParameterDescription(
              name: 'registro',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'telefone': _i1.ParameterDescription(
              name: 'telefone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'area': _i1.ParameterDescription(
              name: 'area',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isAdmin': _i1.ParameterDescription(
              name: 'isAdmin',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).addEmployee(
            session,
            params['nome'],
            params['email'],
            params['senha'],
            params['registro'],
            params['telefone'],
            params['area'],
            params['isAdmin'],
          ),
        ),
        'getTodasFerramentas': _i1.MethodConnector(
          name: 'getTodasFerramentas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getTodasFerramentas(session),
        ),
        'getFerramentasPaginadas': _i1.MethodConnector(
          name: 'getFerramentasPaginadas',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getFerramentasPaginadas(
            session,
            params['offset'],
            params['limit'],
          ),
        ),
        'updateFerramenta': _i1.MethodConnector(
          name: 'updateFerramenta',
          params: {
            'update': _i1.ParameterDescription(
              name: 'update',
              type: _i1.getType<_i11.FerramentaEditDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).updateFerramenta(
            session,
            params['update'],
          ),
        ),
        'deleteFerramenta': _i1.MethodConnector(
          name: 'deleteFerramenta',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).deleteFerramenta(
            session,
            params['id'],
          ),
        ),
        'getAdminAlerts': _i1.MethodConnector(
          name: 'getAdminAlerts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getAdminAlerts(session),
        ),
        'updateMaterial': _i1.MethodConnector(
          name: 'updateMaterial',
          params: {
            'update': _i1.ParameterDescription(
              name: 'update',
              type: _i1.getType<_i10.MaterialEditDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).updateMaterial(
            session,
            params['update'],
          ),
        ),
        'deleteMaterial': _i1.MethodConnector(
          name: 'deleteMaterial',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).deleteMaterial(
            session,
            params['id'],
          ),
        ),
        'getTodosMateriais': _i1.MethodConnector(
          name: 'getTodosMateriais',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getTodosMateriais(session),
        ),
        'getTiposMateriais': _i1.MethodConnector(
          name: 'getTiposMateriais',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getTiposMateriais(session),
        ),
        'getUnidadesMedida': _i1.MethodConnector(
          name: 'getUnidadesMedida',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getUnidadesMedida(session),
        ),
        'getBases': _i1.MethodConnector(
          name: 'getBases',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getBases(session),
        ),
        'getVeiculos': _i1.MethodConnector(
          name: 'getVeiculos',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getVeiculos(session),
        ),
        'getFerramentasComPatrimonio': _i1.MethodConnector(
          name: 'getFerramentasComPatrimonio',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getFerramentasComPatrimonio(session),
        ),
        'getCalibracoesAtivas': _i1.MethodConnector(
          name: 'getCalibracoesAtivas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getCalibracoesAtivas(session),
        ),
        'addCalibracao': _i1.MethodConnector(
          name: 'addCalibracao',
          params: {
            'ferramentaId': _i1.ParameterDescription(
              name: 'ferramentaId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'dataCalibracao': _i1.ParameterDescription(
              name: 'dataCalibracao',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'validadeCalibracao': _i1.ParameterDescription(
              name: 'validadeCalibracao',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).addCalibracao(
            session,
            params['ferramentaId'],
            params['dataCalibracao'],
            params['validadeCalibracao'],
            params['status'],
          ),
        ),
        'removeCalibracao': _i1.MethodConnector(
          name: 'removeCalibracao',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).removeCalibracao(
            session,
            params['id'],
          ),
        ),
        'getAllEmployees': _i1.MethodConnector(
          name: 'getAllEmployees',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint)
                  .getAllEmployees(session),
        ),
        'getAuthUsersByIds': _i1.MethodConnector(
          name: 'getAuthUsersByIds',
          params: {
            'ids': _i1.ParameterDescription(
              name: 'ids',
              type: _i1.getType<List<int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getAuthUsersByIds(
            session,
            params['ids'],
          ),
        ),
        'removeEmployee': _i1.MethodConnector(
          name: 'removeEmployee',
          params: {
            'localUserInfoId': _i1.ParameterDescription(
              name: 'localUserInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).removeEmployee(
            session,
            params['localUserInfoId'],
          ),
        ),
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
        'getDisponiveis': _i1.MethodConnector(
          name: 'getDisponiveis',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ferramenta'] as _i5.FerramentaEndpoint)
                  .getDisponiveis(session),
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
        ),
        'getMateriaisByLocation': _i1.MethodConnector(
          name: 'getMateriaisByLocation',
          params: {
            'baseId': _i1.ParameterDescription(
              name: 'baseId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'veiculoId': _i1.ParameterDescription(
              name: 'veiculoId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['material'] as _i6.MaterialEndpoint)
                  .getMateriaisByLocation(
            session,
            baseId: params['baseId'],
            veiculoId: params['veiculoId'],
          ),
        ),
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
              type: _i1.getType<List<_i12.RequisicaoItem>>(),
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
    connectors['relatorios'] = _i1.EndpointConnector(
      name: 'relatorios',
      endpoint: endpoints['relatorios']!,
      methodConnectors: {
        'getTopConsumidosMaterial': _i1.MethodConnector(
          name: 'getTopConsumidosMaterial',
          params: {
            'LIMIT': _i1.ParameterDescription(
              name: 'LIMIT',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getTopConsumidosMaterial(
            session,
            params['LIMIT'],
          ),
        ),
        'getTopConsumidosFerramenta': _i1.MethodConnector(
          name: 'getTopConsumidosFerramenta',
          params: {
            'LIMIT': _i1.ParameterDescription(
              name: 'LIMIT',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getTopConsumidosFerramenta(
            session,
            params['LIMIT'],
          ),
        ),
        'getConsmuoMaterialClBase': _i1.MethodConnector(
          name: 'getConsmuoMaterialClBase',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getConsmuoMaterialClBase(session),
        ),
        'getConsmuoMaterialClVeiculo': _i1.MethodConnector(
          name: 'getConsmuoMaterialClVeiculo',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getConsmuoMaterialClVeiculo(session),
        ),
        'getConsmuoFerramentaClBase': _i1.MethodConnector(
          name: 'getConsmuoFerramentaClBase',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getConsmuoFerramentaClBase(session),
        ),
        'getConsmuoFerramentaClVeiculo': _i1.MethodConnector(
          name: 'getConsmuoFerramentaClVeiculo',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getConsmuoFerramentaClVeiculo(session),
        ),
        'getInstrumentosCalibracao': _i1.MethodConnector(
          name: 'getInstrumentosCalibracao',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getInstrumentosCalibracao(session),
        ),
        'getInstrumentosEmUso': _i1.MethodConnector(
          name: 'getInstrumentosEmUso',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getInstrumentosEmUso(session),
        ),
        'getLocalUserInfosByUserIds': _i1.MethodConnector(
          name: 'getLocalUserInfosByUserIds',
          params: {
            'userIds': _i1.ParameterDescription(
              name: 'userIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getLocalUserInfosByUserIds(
            session,
            params['userIds'],
          ),
        ),
        'getConsumoDetalhadoPorPeriodo': _i1.MethodConnector(
          name: 'getConsumoDetalhadoPorPeriodo',
          params: {
            'dataInicio': _i1.ParameterDescription(
              name: 'dataInicio',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'dataFim': _i1.ParameterDescription(
              name: 'dataFim',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getConsumoDetalhadoPorPeriodo(
            session,
            dataInicio: params['dataInicio'],
            dataFim: params['dataFim'],
          ),
        ),
        'getMovimentacoes': _i1.MethodConnector(
          name: 'getMovimentacoes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getMovimentacoes(session),
        ),
        'getCalibracoesVencidas': _i1.MethodConnector(
          name: 'getCalibracoesVencidas',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['relatorios'] as _i8.RelatoriosEndpoint)
                  .getCalibracoesVencidas(session),
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
              (endpoints['userData'] as _i9.UserDataEndpoint)
                  .getMyAlerts(session),
        ),
        'getMyHistory': _i1.MethodConnector(
          name: 'getMyHistory',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userData'] as _i9.UserDataEndpoint)
                  .getMyHistory(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i13.Endpoints()..initializeEndpoints(server);
  }
}
