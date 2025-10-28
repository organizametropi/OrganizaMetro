import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/module.dart';

class FerramentaEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Ferramenta>> getEstoque(Session session) async {
    final ferramentas = await Ferramenta.db.find(session,
        include: Ferramenta.include(tipo: TipoMaterial.include()));
    return ferramentas;
  }

  Future<List<Ferramenta>> getMinhasFerramentas(Session session) async {
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;
    if (userId == null) return [];

    return await Ferramenta.db.find(session,
        where: (t) => t.empenhadoParaId.equals(userId) & t.emUso.equals(true),
        include: Ferramenta.include(empenhadoPara: UserInfo.include()));
  }
}
