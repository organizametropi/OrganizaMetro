import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';

class MaterialEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Material>> getEstoque(Session session) async {
    final materiais = await Material.db.find(
      session,
      include: Material.include(
        unidadeMedida: UnidadeMedida.include(),
        base: Base.include(),
        veiculo: Veiculo.include(),
      ),
    );
    return materiais;
  }


  Future<List<Material>> getMateriaisByLocation(Session session, {int? baseId, int? veiculoId}) async {
    final whereExp = (Material.t);
    // Se não houver filtro, retornamos todo estoque (com unidade)
    if (baseId == null && veiculoId == null) {
      return await getEstoque(session);
    }

  
    return await Material.db.find(
      session,
      where: (t) {
        if (baseId != null && veiculoId != null) {
          return t.baseId.equals(baseId) | t.veiculoId.equals(veiculoId);
        }
        if (baseId != null) return t.baseId.equals(baseId);
        return t.veiculoId.equals(veiculoId!);
      },
      include: Material.include(
        unidadeMedida: UnidadeMedida.include(),
        base: Base.include(),
        veiculo: Veiculo.include(),
      ),
    );
  }
}
