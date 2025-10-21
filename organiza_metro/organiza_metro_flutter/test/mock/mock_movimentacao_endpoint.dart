import 'package:mockito/mockito.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:serverpod_client/serverpod_client.dart';


class MockMovimentacaoEndpoint extends Mock implements MovimentacaoEndpoint {

  @override
  ClientCaller get caller => throw UnimplementedError();

  @override
  Map<String, dynamic> get parameters => throw UnimplementedError();


  @override
  Future<bool> criarRequisicaoSaida({
    required List<RequisicaoItem> itens,
    required String modalidadeEntrega,
    String? observacao,
    int? origemBaseId,
    int? origemVeiculoId,
    int? destinoBaseId,
    int? destinoVeiculoId,
  }) async {
 
    return Future.value(true);
  }
}