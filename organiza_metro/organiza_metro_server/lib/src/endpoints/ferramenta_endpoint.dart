import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';

class FerramentaEndpoint extends Endpoint{

  @override
  bool get requireLogin => true;

  Future<List<Ferramenta>> getEstoque(Session session) async {
    final ferramentas  = await Ferramenta.db.find(session);
    return ferramentas; 
  }
}