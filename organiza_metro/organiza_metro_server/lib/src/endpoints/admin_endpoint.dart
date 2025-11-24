import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import '../utils/auth.utils.dart';

/// Endpoint para funções administrativas (acesso restrito por permissão).
class AdminEndpoint extends Endpoint {
    Future<Material> addMaterial(Session session, MaterialEditDto dto) async {
      if (!await localAuth.isAdmin(session)) {
        throw Exception('Acesso negado. Apenas administradores.');
      }
      // Validação básica
      if (dto.codigoSap == null || dto.descricao == null || dto.unidadeMedidaId == null || dto.tipoMaterialId == null) {
        throw Exception('Campos obrigatórios ausentes para Material.');
      }
      final material = Material(
        nome: dto.nome,
        codigoSap: dto.codigoSap!,
        descricao: dto.descricao!,
        quantidade: dto.quantidade,
        estoqueMinimo: dto.estoqueMinimo,
        unidadeMedidaId: dto.unidadeMedidaId!,
        tipoId: dto.tipoMaterialId!,
        baseId: dto.baseId,
        veiculoId: dto.veiculoId,
      );
      await Material.db.insertRow(session, material);
      return material;
    }

    Future<Ferramenta> addFerramenta(Session session, FerramentaEditDto dto) async {
      if (!await localAuth.isAdmin(session)) {
        throw Exception('Acesso negado. Apenas administradores.');
      }
      // Validação básica
      if (dto.codigoSap == null || dto.descricao == null || dto.unidadeMedidaId == null || dto.tipoMaterialId == null || dto.divisao == null || dto.status == null || dto.dataAquisicao == null) {
        throw Exception('Campos obrigatórios ausentes para Ferramenta.');
      }
      final ferramenta = Ferramenta(
        nome: dto.nome,
        codigoSap: dto.codigoSap!,
        descricao: dto.descricao!,
        patrimonio: dto.patrimonio,
        emUso: false,
        divisao: dto.divisao!,
        tipoId: dto.tipoMaterialId!,
        status: dto.status!,
        dataAquisicao: dto.dataAquisicao!,
        unidadeMedidaId: dto.unidadeMedidaId!,
        baseId: dto.baseId,
        veiculoId: dto.veiculoId,
      );
      await Ferramenta.db.insertRow(session, ferramenta);
      return ferramenta;
    }

    Future<LocalUserInfo> addEmployee(Session session, String nome, String email, String senha, String registro, String telefone, String area, bool isAdmin) async {
      if (!await localAuth.isAdmin(session)) {
        throw Exception('Acesso negado. Apenas administradores.');
      }
        // Verifica se já existe EmailAuth
        final existingAuth = await auth.EmailAuth.db.findFirstRow(session, where: (t) => t.email.equals(email));
        int authId;
        if (existingAuth == null) {
          final serverpodUser = await auth.Emails.createUser(session, nome, email, senha);
          if (serverpodUser == null || serverpodUser.id == null) throw Exception('Falha ao criar usuário base.');
          authId = serverpodUser.id!;
        } else {
          authId = existingAuth.id!;
        }
      // Cria dados adicionais
      final localInfo = LocalUserInfo(
          userInfoId: authId,
        registro: registro,
        telefone: telefone,
        area: area,
        isAdmin: isAdmin,
      );
      await LocalUserInfo.db.insertRow(session, localInfo);
      return localInfo;
    }
  @override
  bool get requireLogin => true;

  AuthUtils localAuth = AuthUtils();

  Future<List<Ferramenta>> getTodasFerramentas(Session session) async {
    final ferramentas = await Ferramenta.db.find(
      session,
      include: Ferramenta.include(
        unidadeMedida: UnidadeMedida.include(),
        tipo: TipoMaterial.include(),
        base: Base.include(),
        veiculo: Veiculo.include(),
      ),
    );
    return ferramentas;
  }

  Future<List<Ferramenta>> getFerramentasPaginadas(Session session, int offset, int limit) async{
  return Ferramenta.db.find(
    session,
    limit: limit,
    offset: offset,
    include: Ferramenta.include(
      unidadeMedida: UnidadeMedida.include(),
      tipo: TipoMaterial.include(),
      base: Base.include(),
      veiculo: Veiculo.include(),
    ),
  );
}

  Future<bool> updateFerramenta(
      Session session, FerramentaEditDto update) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    final ferramenta = await Ferramenta.db.findById(session, update.id);
    if (ferramenta == null) throw Exception('Ferramenta não encontrada.');
    if (update.nome != null) ferramenta.nome = update.nome!;
    if (update.codigoSap != null) ferramenta.codigoSap = update.codigoSap!;
    if (update.descricao != null) ferramenta.descricao = update.descricao!;
    if (update.patrimonio != null) ferramenta.patrimonio = update.patrimonio!;
    if (update.divisao != null) ferramenta.divisao = update.divisao!;
    if (update.tipoMaterialId != null)
      ferramenta.tipoId = update.tipoMaterialId!;
    if (update.status != null) ferramenta.status = update.status!;
    if (update.dataAquisicao != null)
      ferramenta.dataAquisicao = update.dataAquisicao!;
    if (update.unidadeMedidaId != null)
      ferramenta.unidadeMedidaId = update.unidadeMedidaId!;
    ferramenta.baseId = update.baseId;
    ferramenta.veiculoId = update.veiculoId;
    await Ferramenta.db.update(session, [ferramenta]);
    return true;
  }

  Future<bool> deleteFerramenta(Session session, int id) async {
    if (await localAuth.isAdmin(session) == false) {
      throw Exception('Acesso negado.');
    }
    final ferramenta = await Ferramenta.db.findById(session, id);
    if (ferramenta == null) {
      throw ArgumentError('Ferramenta não encontrada: $id');
    }
    await Ferramenta.db.deleteRow(session, ferramenta);
    return true;
  }

  Future<List<Alerta>> getAdminAlerts(Session session) async {
    if (await localAuth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    return await Alerta.db.find(
      session,
      where: (t) => t.ativo.equals(true) & t.usuarioId.equals(null),
      orderBy: (t) => t.dataCriacao,
      orderDescending: true,
    );
  }

  Future<bool> updateMaterial(Session session, MaterialEditDto update) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    final material = await Material.db.findById(session, update.id);
    if (material == null) throw Exception('Material não encontrado.');

    // Campos simples
    if (update.nome != null) material.nome = update.nome!;
    if (update.codigoSap != null) material.codigoSap = update.codigoSap!;
    if (update.descricao != null) material.descricao = update.descricao!;
    if (update.quantidade != null) material.quantidade = update.quantidade;
    if (update.estoqueMinimo != null)
      material.estoqueMinimo = update.estoqueMinimo;

    // FKs
    if (update.unidadeMedidaId != null)
      material.unidadeMedidaId = update.unidadeMedidaId!;
    if (update.tipoMaterialId != null) material.tipoId = update.tipoMaterialId!;
    material.baseId = update.baseId;
    material.veiculoId = update.veiculoId;

    await Material.db.update(session, [material]);
    return true;
  }

  Future<bool> deleteMaterial(Session session, int id) async {
    if (await localAuth.isAdmin(session) == false) {
      throw Exception('Acesso negado.');
    }

    final material = await Material.db.findById(session, id);
    if (material == null) {
      throw ArgumentError('Material não encontrado: $id');
    }

    await Material.db.deleteRow(session, material);
    return true;
  }

  Future<List<Material>> getTodosMateriais(Session session) async {
    final materiais = await Material.db.find(
      session,
      include: Material.include(
        unidadeMedida: UnidadeMedida.include(),
        tipo: TipoMaterial.include(),
        base: Base.include(),
        veiculo: Veiculo.include(),
      ),
    );
    return materiais;
  }

  Future<List<TipoMaterial>> getTiposMateriais(Session session) async {
    final tipoMaterial = await TipoMaterial.db.find(session);
    return tipoMaterial;
  }

  Future<List<UnidadeMedida>> getUnidadesMedida(Session session) async {
    final unidadeMedida = await UnidadeMedida.db.find(session);
    return unidadeMedida;
  }

  Future<List<Base>> getBases(Session session) async {
    final bases = await Base.db.find(session);
    return bases;
  }

  Future<List<Veiculo>> getVeiculos(Session session) async {
    final veiculos = await Veiculo.db.find(session);
    return veiculos;
  }

  /// Retorna ferramentas que possuem patrimônio (candidatas a calibração)
  Future<List<Ferramenta>> getFerramentasComPatrimonio(Session session) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    final all = await Ferramenta.db.find(
      session,
      where: (t) => t.emUso.notEquals(true) & t.status.notEquals('Em calibração'),
      include: Ferramenta.include(
        unidadeMedida: UnidadeMedida.include(),
        tipo: TipoMaterial.include(),
        base: Base.include(),
        veiculo: Veiculo.include(),
      ),
    );
    // Filtra apenas as que têm patrimônio (não nulo e não vazio)
    return all.where((f) => f.patrimonio != null && f.patrimonio!.trim().isNotEmpty).toList();
  }

  /// Lista calibrações (ativas) com a ferramenta incluída
  Future<List<Calibracao>> getCalibracoesAtivas(Session session) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    final list = await Calibracao.db.find(
      session,
      include: Calibracao.include(
        ferramenta: Ferramenta.include(
          unidadeMedida: UnidadeMedida.include(),
          tipo: TipoMaterial.include(),
          base: Base.include(),
          veiculo: Veiculo.include(),
        ),
      ),
      orderBy: (t) => t.validadeCalibracao,
      orderDescending: false,
    );
    return list;
  }

  /// Cria uma nova calibração
  Future<Calibracao> addCalibracao(Session session, int ferramentaId, DateTime dataCalibracao, DateTime validadeCalibracao, String status) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    final ferramenta = await Ferramenta.db.findById(session, ferramentaId);
    if (ferramenta == null) throw Exception('Ferramenta não encontrada: $ferramentaId');
    final c = Calibracao(
      ferramentaId: ferramentaId,
      dataCalibracao: dataCalibracao,
      validadeCalibracao: validadeCalibracao,
      status: status,
    );

    ferramenta.status = 'Em calibração';
    await Ferramenta.db.updateRow(session, ferramenta);
    await Calibracao.db.insertRow(session, c);
    // Recarrega com include — adiciona checagens para evitar operadores de negação nulos
    if (c.id == null) {
      throw Exception('Falha ao criar calibração: id nulo após insert.');
    }
    final inserted = await Calibracao.db.findById(
      session,
      c.id!,
      include: Calibracao.include(
        ferramenta: Ferramenta.include(
          unidadeMedida: UnidadeMedida.include(),
          tipo: TipoMaterial.include(),
          base: Base.include(),
          veiculo: Veiculo.include(),
        ),
      ),
    );
    if (inserted == null) {
      throw Exception('Falha ao carregar calibração recém-criada (id=${c.id}).');
    }
    return inserted;
  }

  /// Remove uma calibração por id
  Future<bool> removeCalibracao(Session session, int id) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    final c = await Calibracao.db.findById(session, id);
    if (c == null) return false;
    final ferramenta = await Ferramenta.db.findById(session, c.ferramentaId);
    if (ferramenta != null) {
      ferramenta.status = 'Disponível';
      await Ferramenta.db.updateRow(session, ferramenta);
    }
    await Calibracao.db.deleteRow(session, c);
    return true;
  }

  /// Retorna todos os funcionários locais (LocalUserInfo)
  Future<List<LocalUserInfo>> getAllEmployees(Session session) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    return await LocalUserInfo.db.find(session);
  }

  /// Retorna informações de usuário do módulo auth para os ids informados
  Future<List<auth.UserInfo>> getAuthUsersByIds(Session session, List<int> ids) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    if (ids.isEmpty) return [];
    return await auth.UserInfo.db.find(
      session,
      where: (t) => t.id.inSet(ids.toSet()),
    );
  }

  /// Remove um funcionário local por id (apaga somente LocalUserInfo)
  Future<bool> removeEmployee(Session session, int localUserInfoId) async {
    if (!await localAuth.isAdmin(session)) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    final li = await LocalUserInfo.db.findById(session, localUserInfoId);
    if (li == null) return false;
    await LocalUserInfo.db.deleteRow(session, li);
    return true;
  }
}
