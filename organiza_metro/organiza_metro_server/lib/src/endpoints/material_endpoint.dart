import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';

class MaterialEndpoint extends Endpoint{

  @override
  bool get requireLogin => true;

  Future<List<Material>> getEstoque(Session session) async {
    final materiais  = await Material.db.find(session);
    return materiais; 
  }
}