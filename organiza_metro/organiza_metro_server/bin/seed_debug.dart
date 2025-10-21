import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:organiza_metro_server/src/generated/protocol.dart' as proto;
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'dart:math';

// Instância do gerador de números aleatórios
final Random _random = Random();

// Função auxiliar para gerar um registro de funcionário rXXXXXY
String _generateRegistro() {
  final digits = List.generate(5, (_) => _random.nextInt(10)).join();
  // Simplesmente usa um dígito verificador fixo para teste
  return 'r${digits}0';
}

// Lista de Bases e seus responsáveis temporários
const List<Map<String, String>> baseData = [
  {'codigo': 'WJA', 'nome': 'Jabaquara', 'responsavelRegistro': 'r000010'},
  {'codigo': 'PSO', 'nome': 'Paraiso', 'responsavelRegistro': 'r000020'},
  {'codigo': 'TRD', 'nome': 'Tiradentes', 'responsavelRegistro': 'r000030'},
  {'codigo': 'TUC', 'nome': 'Tucuruvi', 'responsavelRegistro': 'r000040'},
  {'codigo': 'LUM', 'nome': 'Luminárias', 'responsavelRegistro': 'r000050'},
];

Future<void> main(List<String> args) async {
  final pod = Serverpod(args, proto.Protocol(), Endpoints());
  final session = await pod.createSession();

  print('============================================');
  print('          INICIANDO SEED DE DADOS           ');
  print('============================================');

  // Mapeamento para guardar os IDs de FK
  // Usamos o ID da tabela serverpod_user_info para FKs
  final Map<String, int> usuarioIds = {};
  final Map<String, int> unidadeMedidaIds = {};
  final Map<String, int> tipoMaterialIds = {};
  final Map<String, int> baseIds = {};
  final List<int> veiculoIds = [];

  // -----------------------------------------------------------------------
  // 1. INSERÇÃO DE USUÁRIOS (Tabela auth.EmailAuth e proto.UserInfo)
  // -----------------------------------------------------------------------
  print('-> Inserindo Usuários (Autenticação e Custom)');

  // USUÁRIOS PADRÃO (Para serem responsáveis por Bases/Empenhamento)
  for (var i = 1; i <= 5; i++) {
    final reg = 'r0000${i}0';
    final email = 'user$i@metrosp.com';
    final existingAuth = await auth.EmailAuth.db
        .findFirstRow(session, where: (t) => t.email.equals(email));

    int authId;

    if (existingAuth == null) {
      final serverpodUser = await auth.Emails.createUser(
          session, 'Funcionario $i', email, '12345678');
      authId = serverpodUser!.id!;

      final localUser = proto.UserInfo(
        userInfoId: authId,
        registro: reg,
        telefone: '(11) 99999-00${i}0',
        area: 'Manutenção ${baseData[i - 1]['codigo']}',
        isAdmin: false,
      );
      await proto.UserInfo.db.insertRow(session, localUser);
      print(
          '✅ Usuário padrão criado: ${localUser.registro} (Auth ID: $authId)');
    } else {
      authId = existingAuth.id!;
    }
    // Mapeia o ID de autenticação do Serverpod
    usuarioIds[reg] = authId;
  }

  // -----------------------------------------------------------------------
  // 2. INSERÇÃO DE UNIDADES DE MEDIDA
  // -----------------------------------------------------------------------
  print('-> Inserindo Unidades de Medida');
  const Map<String, String> unidades = {
    'UN': 'Unidade',
    'CJ': 'Conjunto',
    'MT': 'Metro',
    'KG': 'Quilograma',
    'L': 'Litro',
    'PÇ': 'Peça',
    'RO': 'Rolo',
    'CX': 'Caixa',
    'SC': 'Saco',
    'PAR': 'Par',
    'JG': 'Jogo'
  };

  for (final entry in unidades.entries) {
    // Tenta buscar pelo código (chave de unicidade)
    var um = await proto.UnidadeMedida.db.findFirstRow(
      session,
      where: (t) => t.codigo.equals(entry.key),
    );

    // 🚨 NOVO OBJETO: Garante que 'um' é a instância correta para inserção/busca
    if (um == null) {
      // Se não existe, insere (cria um novo objeto)
      final newUm =
          proto.UnidadeMedida(codigo: entry.key, descricao: entry.value);
      await proto.UnidadeMedida.db.insertRow(session, newUm);
      um =
          newUm; // Atribui o objeto recém-inserido (com o ID preenchido, se o driver funcionar)
      print('  Inserido: ${entry.key}');

      // 🚨 NOVO TRATAMENTO: Se o ID ainda for nulo após a inserção (falha na recuperação)
      if (um.id == null) {
        // BUSCA O OBJETO INSERIDO PELO CÓDIGO para obter o ID
        um = await proto.UnidadeMedida.db.findFirstRow(
          session,
          where: (t) => t.codigo.equals(entry.key),
        );
      }
    } else {
      print('  Existe: ${entry.key}');
      // Se existe, 'um' já é o objeto recuperado do banco com o ID preenchido.
    }

    // 🚨 Verificação de nulidade (Safety Check)
    if (um?.id == null) {
      // Usa o operador condicional '?' para um
      throw Exception(
          "Falha CRÍTICA ao obter ID da UnidadeMedida: ${entry.key}");
    }
    unidadeMedidaIds[entry.key] = um!.id!;
  }
  print('✅ ${unidades.length} Unidades de Medida verificadas/inseridas.');

  // -----------------------------------------------------------------------
  // 3. INSERÇÃO DE TIPOS DE MATERIAL
  // -----------------------------------------------------------------------
  print('-> Inserindo Tipos de Material');
  const List<Map<String, dynamic>> tipos = [
    {
      'nome': 'Consumo',
      'inicial': 10000000,
      'final': 10999999,
      'descricao': 'Custeio, controle GSE'
    },
    {
      'nome': 'Giro',
      'inicial': 15000000,
      'final': 15999999,
      'descricao': 'Pode ser reparado, custeio ou investimento'
    },
    {
      'nome': 'Patrimoniado',
      'inicial': 16000000,
      'final': 16999999,
      'descricao':
          'Equipamentos e instrumentos operacionais, controle patrimonial'
    },
    {
      'nome': 'Ferramenta Manual',
      'inicial': 17000000,
      'final': 17999999,
      'descricao': 'Instrumentos manuais, custeio, uso operacional'
    },
  ];

  for (final t in tipos) {
    final nomeTipo = t['nome']!;

    // Tenta buscar pelo nome (chave de unicidade esperada)
    var tipo = await proto.TipoMaterial.db.findFirstRow(
      session,
      where: (t) => t.nome.equals(nomeTipo),
    );

    if (tipo == null) {
      // Se não existe, insere
      final newTipo = proto.TipoMaterial(
        nome: nomeTipo,
        faixaInicial: t['inicial'],
        faixaFinal: t['final'],
        descricao: t['descricao'],
      );
      await proto.TipoMaterial.db.insertRow(session, newTipo);
      tipo = newTipo; // Atribui o objeto recém-inserido
      print('  Inserido: $nomeTipo');

      // 🚨 NOVO TRATAMENTO: Se o ID ainda for nulo após a inserção (BUSCA DEFENSIVA)
      if (tipo.id == null) {
        tipo = await proto.TipoMaterial.db.findFirstRow(
          session,
          where: (t) => t.nome.equals(nomeTipo),
        );
      }
    } else {
      print('  Existe: $nomeTipo');
    }

    // 🚨 Verificação de nulidade (Safety Check)
    if (tipo?.id == null) {
      throw Exception("Falha CRÍTICA ao obter ID do TipoMaterial: $nomeTipo");
    }
    tipoMaterialIds[nomeTipo] = tipo!.id!;
  }
  print('✅ ${tipos.length} Tipos de Material verificados/inseridos.');

  // -----------------------------------------------------------------------
  // 4. INSERÇÃO DE BASES E VEÍCULOS
  // -----------------------------------------------------------------------
  print('-> Inserindo Bases e Veículos');

  final List<int> usuarioAuthIds = usuarioIds.values.toList();

  for (final b in baseData) {
    final responsavelAuthId = usuarioIds[b['responsavelRegistro']];

    // Tenta buscar a Base pelo código
    var base = await proto.Base.db.findFirstRow(
      session,
      where: (t) => t.codigo.equals(b['codigo']!),
    );

    if (base == null) {
      final newBase = proto.Base(
        codigo: b['codigo']!,
        nome: b['nome']!,
        endereco: 'Rua de ${b['nome']}',
        responsavelId: responsavelAuthId,
      );
      await proto.Base.db.insertRow(session, newBase);
      base = newBase;
      print('  Base inserida: ${b['codigo']!}');

      // 🚨 BUSCA DEFENSIVA
      if (base.id == null) {
        base = await proto.Base.db.findFirstRow(
          session,
          where: (t) => t.codigo.equals(b['codigo']!),
        );
      }
    } else {
      print('  Base existe: ${b['codigo']!}');
      base.responsavelId = responsavelAuthId;
      await proto.Base.db.updateRow(session, base);
    }

    if (base?.id == null) {
      throw Exception(
          "Falha CRÍTICA ao obter ID após inserir Base: ${b['nome']}");
    }
    baseIds[b['codigo']!] = base!.id!;

    // Adiciona 2 veículos por Base
    for (var v = 1; v <= 2; v++) {
      final veiculoCodigo = '${b['codigo']!}0$v';

      var veiculo = await proto.Veiculo.db.findFirstRow(
        session,
        where: (t) => t.codigo.equals(veiculoCodigo),
      );

      if (veiculo == null) {
        final newVeiculo = proto.Veiculo(
          codigo: veiculoCodigo,
          descricao: 'Veículo de Manutenção ${v} - ${b['nome']}',
          baseId: base!.id!,
        );
        await proto.Veiculo.db.insertRow(session, newVeiculo);
        veiculo = newVeiculo;
        print('  Veículo inserido: $veiculoCodigo');

        // 🚨 BUSCA DEFENSIVA
        if (veiculo.id == null) {
          veiculo = await proto.Veiculo.db.findFirstRow(
            session,
            where: (t) => t.codigo.equals(veiculoCodigo),
          );
        }
      } else {
        print('  Veículo existe: $veiculoCodigo');
      }

      if (veiculo?.id == null) {
        throw Exception(
            "Falha CRÍTICA ao obter ID após inserir Veículo: ${veiculo!.codigo}");
      }
      veiculoIds.add(veiculo!.id!);
    }
  }
  print(
      '✅ ${baseData.length} Bases e ${baseData.length * 2} Veículos verificados/inseridos.');

  // -----------------------------------------------------------------------
  // 5. INSERÇÃO DE MATERIAIS
  // -----------------------------------------------------------------------

  print('-> Inserindo Materiais');

  final List<int> baseValues = baseIds.values.toList();
  final List<int> veiculoValues = veiculoIds.toList();


  for (var i = 0; i < 15; i++) {
    final isConsumo = i % 3 == 0;
    final tipoNome = isConsumo ? 'Consumo' : 'Giro';

    final tipoId = tipoMaterialIds[tipoNome];
    final unidadeKey = unidades.keys.toList()[i % unidades.length];
    final unidadeMedidaId = unidadeMedidaIds[unidadeKey];

    if (tipoId == null) {
      print('Erro: Tipo de material "$tipoNome" não encontrado no mapa');
      continue;
    }
    if (unidadeMedidaId == null) {
      print('Erro: Unidade de medida "$unidadeKey" não encontrado no mapa');
      continue;
    }

    final bool estaEmVeiculo = _random.nextDouble() < 0.2;
    final int? baseId =
        estaEmVeiculo ? null : baseValues[_random.nextInt(baseValues.length)];
    final int? veiculoId = estaEmVeiculo
        ? veiculoValues[_random.nextInt(veiculoValues.length)]
        : null;

    final quantidadeArrumada = _random.nextInt(90);
   

    final material = proto.Material(
        codigoSap: isConsumo ? 10000000 + i : 15000000 + i,
        descricao: '$tipoNome Item- ${i + 1}',
        tipoId: tipoId,
        unidadeMedidaId: unidadeMedidaId,
        quantidade: quantidadeArrumada.toDouble(),  
        estoqueMinimo: 5.0,
        dataUltimaMovimentacao:
            DateTime.now().subtract(Duration(days: _random.nextInt(30))),
        baseId: baseId,
        veiculoId: veiculoId);

    final existingMaterial = await proto.Material.db.findFirstRow(session,
        where: (t) => t.codigoSap.equals(material.codigoSap));

    if (existingMaterial == null) {
      await proto.Material.db.insertRow(session, material);
    }

  }

  print('15 Materiais de estoque inseridos! (se não existirem)');

  // -----------------------------------------------------------------------
  // 6. INSERÇÃO DE FERRAMENTAS E CALIBRAÇÕES
  // -----------------------------------------------------------------------
  print('-> Inserindo Ferramentas (Patrimoniado e Manual)');
  final List<int> empenhadoParaAuthIds = usuarioIds.values.toList();

  for (var i = 0; i < 10; i++) {
    final isInstrumento = i % 2 == 0;
    final tipoNome = isInstrumento ? 'Patrimoniado' : 'Ferramenta Manual';

    final bool estaEmVeiculo = _random.nextDouble() < 0.1;
    final int? baseId =
        estaEmVeiculo ? null : baseValues[_random.nextInt(baseValues.length)];
    final int? veiculoId = estaEmVeiculo
        ? veiculoValues[_random.nextInt(veiculoValues.length)]
        : null;

    final unidadeIdFerramenta = unidadeMedidaIds['UN'];
    if (unidadeIdFerramenta == null) {
      print('ERRO: Unidade de medida "UN" não encontrada para ferramentas.');
      continue;
    }

    final patrimonioCode = 'PAT${100 + i}';
    final existingFerramenta = await proto.Ferramenta.db.findFirstRow(session,
        where: (t) => t.patrimonio.equals(patrimonioCode));

    if (existingFerramenta != null) {
      print('  Ferramenta existe (Patrimônio: $patrimonioCode), pulando.');
      continue;
    }

    var ferramenta = proto.Ferramenta(
      // 🚨 var para permitir reatribuição
      codigoSap: isInstrumento ? 16000000 + i : 17000000 + i,
      descricao: '$tipoNome - Item ${i + 1}',
      patrimonio: patrimonioCode,
      unidadeMedidaId: unidadeIdFerramenta,

      empenhadoParaId:
          empenhadoParaAuthIds[_random.nextInt(empenhadoParaAuthIds.length)],
      emUso: true,
      tipo: isInstrumento ? 'Instrumento' : 'Ferramenta',
      status: 'Empenhada',

      baseId: baseId,
      veiculoId: veiculoId,

      dataAquisicao:
          DateTime(2023, _random.nextInt(12) + 1, _random.nextInt(28) + 1),
      dataUltimaMovimentacao: DateTime.now(),
    );
    await proto.Ferramenta.db.insertRow(session, ferramenta);

    // 🚨 BUSCA DEFENSIVA: Se o ID não for preenchido
    if (ferramenta.id == null) {
      ferramenta = (await proto.Ferramenta.db.findFirstRow(
        session,
        where: (t) => t.patrimonio.equals(patrimonioCode),
      ))!;
    }

    // 🚨 VERIFICAÇÃO CRÍTICA FINAL
    if (ferramenta?.id == null) {
      throw Exception("Falha CRÍTICA ao obter ID da Ferramenta após inserção.");
    }

    // Se for INSTRUMENTO (Patrimoniado), adiciona calibração
    if (isInstrumento) {
      // A checagem if (ferramenta.id == null) não é mais necessária aqui

      final isValida = _random.nextDouble() > 0.3;
      final dataCalib =
          DateTime.now().subtract(Duration(days: _random.nextInt(100)));
      final validade = dataCalib.add(const Duration(days: 365));

      final calibracao = proto.Calibracao(
        ferramentaId: ferramenta!.id!, // 🚨 Agora sabemos que o ID existe!
        dataCalibracao: dataCalib,
        validadeCalibracao: validade,
        status: validade.isBefore(DateTime.now()) ? 'Vencido' : 'Válido',
      );
      await proto.Calibracao.db.insertRow(session, calibracao);
    }
  }
  print(
      '✅ 10 Ferramentas (Instrumentos/Manuais) inseridas (se não existirem).');

  print('============================================');
  print('          SEED COMPLETO!                    ');
  print('============================================');
  await pod.shutdown();
}
