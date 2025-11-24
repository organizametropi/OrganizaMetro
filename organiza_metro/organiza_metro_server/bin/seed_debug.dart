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
  {'codigo': 'IMG', 'nome': 'Imigrantes', 'responsavelRegistro': 'r000060'},
  {'codigo': 'BFU', 'nome': 'Barra Funda', 'responsavelRegistro': 'r000070'},
  {'codigo': 'BAS', 'nome': 'Brás', 'responsavelRegistro': 'r000080'},
  {'codigo': 'CEC', 'nome': 'Cecília', 'responsavelRegistro': 'r000090'},
  {'codigo': 'MAT', 'nome': 'Matheus', 'responsavelRegistro': 'r000100'},
  {'codigo': 'VTD', 'nome': 'Vila Matilde', 'responsavelRegistro': 'r000110'},
  {'codigo': 'VPT', 'nome': 'Vila Prudente', 'responsavelRegistro': 'r000120'},
  {'codigo': 'PIT', 'nome': 'Pátio Itaquera', 'responsavelRegistro': 'r000130'},
  {'codigo': 'POT', 'nome': 'Pátio Oratório', 'responsavelRegistro': 'r000140'},
  {'codigo': 'PAT', 'nome': 'Pátio Jabaquara', 'responsavelRegistro': 'r000150'},
];

const List<String> _statusOptions = [
  'Empenhada',
  'Disponível',
  'Em calibração',
  'Em reposição',
];

const List<String> _lorem = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Praesent commodo cursus magna, vel scelerisque nisl consectetur et.',
  'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
  'Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.',
  'Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.',
  'Vestibulum id ligula porta felis euismod semper. Sed posuere consectetur est at lobortis.',
  'Curabitur blandit tempus porttitor. Maecenas faucibus mollis interdum.',
];

String _randomLorem(int sentences) {
  final buffer = StringBuffer();
  for (var i = 0; i < sentences; i++) {
    buffer.write(_lorem[_random.nextInt(_lorem.length)]);
    if (i < sentences - 1) buffer.write(' ');
  }
  return buffer.toString();
}

Future<void> main(List<String> args) async {
  final pod = Serverpod(args, proto.Protocol(), Endpoints());
  final session = await pod.createSession();

  print('============================================');
  print('          INICIANDO SEED DE DADOS           ');
  print('============================================');

  // Mapeamento para guardar os IDs de FK
  final Map<String, int> usuarioIds = {};
  final Map<String, int> unidadeMedidaIds = {};
  final Map<String, int> tipoMaterialIds = {};
  final Map<String, int> baseIds = {};
  final List<int> veiculoIds = [];

  // ---------------------------------------------------------------------------
    //  TRUNCATE TABELAS
    // ---------------------------------------------------------------------------
    await session.db.unsafeQuery('''
TRUNCATE TABLE 
  public.movimentacao,
  public.calibracao,
  public.ferramenta,
  public.material,
  public.alertas
RESTART IDENTITY CASCADE;
    ''');
    print('✔ Tabelas limpas com sucesso!');

  // -----------------------------------------------------------------------
  // 1. INSERÇÃO DE USUÁRIOS (Tabela auth.EmailAuth e proto.LocalUserInfo)
  // -----------------------------------------------------------------------
  print('-> Inserindo Usuários (Autenticação e Custom)');

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

      final localUser = proto.LocalUserInfo(
        userInfoId: authId,
        registro: reg,
        telefone: '(11) 99999-00${i}0',
        area: 'Manutenção ${baseData[i - 1]['codigo']}',
        isAdmin: false,
      );
      await proto.LocalUserInfo.db.insertRow(session, localUser);
      print('✅ Usuário padrão criado: ${localUser.registro} (Auth ID: $authId)');
    } else {
      authId = existingAuth.id!;
    }
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
    var um = await proto.UnidadeMedida.db.findFirstRow(
      session,
      where: (t) => t.codigo.equals(entry.key),
    );

    if (um == null) {
      final newUm =
          proto.UnidadeMedida(codigo: entry.key, descricao: entry.value);
      await proto.UnidadeMedida.db.insertRow(session, newUm);
      um = newUm;
      if (um.id == null) {
        um = await proto.UnidadeMedida.db.findFirstRow(
          session,
          where: (t) => t.codigo.equals(entry.key),
        );
      }
      print('  Inserido: ${entry.key}');
    } else {
      print('  Existe: ${entry.key}');
    }

    if (um?.id == null) {
      throw Exception("Falha CRÍTICA ao obter ID da UnidadeMedida: ${entry.key}");
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
      'descricao': 'Equipamentos e instrumentos operacionais, controle patrimonial'
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
    var tipo = await proto.TipoMaterial.db.findFirstRow(
      session,
      where: (t) => t.nome.equals(nomeTipo),
    );

    if (tipo == null) {
      final newTipo = proto.TipoMaterial(
        nome: nomeTipo,
        faixaInicial: t['inicial'],
        faixaFinal: t['final'],
        descricao: t['descricao'],
      );
      await proto.TipoMaterial.db.insertRow(session, newTipo);
      tipo = newTipo;
      if (tipo.id == null) {
        tipo = await proto.TipoMaterial.db.findFirstRow(
          session,
          where: (t) => t.nome.equals(nomeTipo),
        );
      }
      print('  Inserido: $nomeTipo');
    } else {
      print('  Existe: $nomeTipo');
    }

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
      if (base.id == null) {
        base = await proto.Base.db.findFirstRow(
          session,
          where: (t) => t.codigo.equals(b['codigo']!),
        );
      }
      print('  Base inserida: ${b['codigo']!}');
    } else {
      base.responsavelId = responsavelAuthId;
      await proto.Base.db.updateRow(session, base);
      print('  Base existe: ${b['codigo']!}');
    }

    if (base?.id == null) {
      throw Exception("Falha CRÍTICA ao obter ID após inserir Base: ${b['nome']}");
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
        if (veiculo.id == null) {
          veiculo = await proto.Veiculo.db.findFirstRow(
            session,
            where: (t) => t.codigo.equals(veiculoCodigo),
          );
        }
        print('  Veículo inserido: $veiculoCodigo');
      } else {
        print('  Veículo existe: $veiculoCodigo');
      }

      if (veiculo?.id == null) {
        throw Exception("Falha CRÍTICA ao obter ID após inserir Veículo: ${veiculo!.codigo}");
      }
      veiculoIds.add(veiculo!.id!);
    }
  }
  print('✅ ${baseData.length} Bases e ${baseData.length * 2} Veículos verificadas/inseridas.');

  // -----------------------------------------------------------------------
  // 5. INSERÇÃO DE MATERIAIS
  // -----------------------------------------------------------------------
  print('-> Inserindo Materiais');

  final List<int> baseValues = baseIds.values.toList();
  final List<int> veiculoValues = veiculoIds.toList();

  for (var i = 0; i < 65; i++) {
    final isConsumo = i % 3 == 0;
    final tipoNome = isConsumo ? 'Consumo' : 'Giro';

    final tipoId = tipoMaterialIds[tipoNome];
    final unidadeKey = unidades.keys.toList()[i % unidades.length];
    final unidadeMedidaId = unidadeMedidaIds[unidadeKey];

    if (tipoId == null || unidadeMedidaId == null) {
      print('Erro: dados de FK faltando para material $i');
      continue;
    }

    final bool estaEmVeiculo = _random.nextDouble() < 0.2;
    final int? baseId =
        estaEmVeiculo ? null : baseValues[_random.nextInt(baseValues.length)];
    final int? veiculoId = estaEmVeiculo
        ? veiculoValues[_random.nextInt(veiculoValues.length)]
        : null;

    final quantidadeArrumada = (_random.nextInt(90) + 1).toDouble();
    final estoqueMinimo = 5.0 + _random.nextInt(6);

    var _tipoid = await proto.TipoMaterial.db
        .findFirstRow(session, where: (t) => t.id.equals(tipoId));
    var _unidadeMedidaId = await proto.UnidadeMedida.db
        .findFirstRow(session, where: (t) => t.id.equals(unidadeMedidaId));
    var _baseObj, _veiculoObj;
    if (baseId != null) {
      _baseObj = await proto.Base.db.findFirstRow(session, where: (t) => t.id.equals(baseId));
    }
    if (veiculoId != null) {
      _veiculoObj = await proto.Veiculo.db.findFirstRow(session, where: (t) => t.id.equals(veiculoId));
    }

    final material = proto.Material(
      codigoSap: isConsumo ? 10000000 + i : 15000000 + i,
      nome: 'Material ${i + 1}',
      descricao: _random.nextBool() ? _randomLorem(1) : _randomLorem(2),
      tipoId: _tipoid!.id!,
      tipo: _tipoid,
      unidadeMedidaId: _unidadeMedidaId!.id!,
      unidadeMedida: _unidadeMedidaId,
      quantidade: quantidadeArrumada,
      estoqueMinimo: estoqueMinimo,
      dataUltimaMovimentacao: DateTime.now().subtract(Duration(days: _random.nextInt(30))),
      baseId: _baseObj?.id,
      base: _baseObj,
      veiculoId: _veiculoObj?.id,
      veiculo: _veiculoObj,
    );

    final existingMaterial = await proto.Material.db.findFirstRow(session,
        where: (t) => t.codigoSap.equals(material.codigoSap));

    if (existingMaterial == null) {
      await proto.Material.db.insertRow(session, material);
    } else {
      // Atualiza pequenas diferenças se desejar
      existingMaterial.quantidade = material.quantidade;
      existingMaterial.estoqueMinimo = material.estoqueMinimo;
      existingMaterial.descricao = material.descricao;
      await proto.Material.db.updateRow(session, existingMaterial);
    }
  }
  print('Materiais inseridos/atualizados.');

  // -----------------------------------------------------------------------
  // 6. INSERÇÃO DE FERRAMENTAS E CALIBRAÇÕES
  // -----------------------------------------------------------------------
  print('-> Inserindo Ferramentas (Patrimoniado e Manual)');

  for (var i = 0; i < 60; i++) {
    final isInstrumento = i % 2 == 0;
    final tipoNome = isInstrumento ? 'Patrimoniado' : 'Ferramenta Manual';

    final tipoId = tipoMaterialIds[tipoNome];
    final bool estaEmVeiculo = _random.nextDouble() < 0.1;
    final int? baseId =
        estaEmVeiculo ? null : baseValues[_random.nextInt(baseValues.length)];
    final int? veiculoId = estaEmVeiculo
        ? veiculoValues[_random.nextInt(veiculoValues.length)]
        : null;

    var _baseObj, _veiculoObj;

    if (baseId != null) {
      _baseObj = await proto.Base.db.findFirstRow(session, where: (t) => t.id.equals(baseId));
    }
    if (veiculoId != null) {
      _veiculoObj = await proto.Veiculo.db.findFirstRow(session, where: (t) => t.id.equals(veiculoId));
    }

    final unidadeIdFerramenta = unidadeMedidaIds['UN'];
    if (unidadeIdFerramenta == null) {
      print('ERRO: Unidade de medida "UN" não encontrada para ferramentas.');
      continue;
    }

    var _tipoid = await proto.TipoMaterial.db.findFirstRow(session, where: (t) => t.id.equals(tipoId));
    var _unidadeIdFerramenta = await proto.UnidadeMedida.db.findFirstRow(session, where: (t) => t.id.equals(unidadeIdFerramenta));
    var _empenhadoParaId = await auth.UserInfo.db.findFirstRow(session,
        where: (t) => t.id.equals(usuarioAuthIds[_random.nextInt(usuarioAuthIds.length)]));

    final patrimonioCode = tipoNome == 'Patrimoniado' ? 'PAT${100 + i}' : null;

    final existingFerramenta = patrimonioCode != null
        ? await proto.Ferramenta.db.findFirstRow(session,
            where: (t) => t.patrimonio.equals(patrimonioCode))
        : null;

    if (existingFerramenta != null) {
      print('  Ferramenta existe (Patrimônio: $patrimonioCode), pulando.');
      continue;
    }

    // EmUso aleatório (nem todas true)
    final emUsoRandom = _random.nextDouble() < 0.6;

    // status logic
    String status;
    if (!emUsoRandom) {
      status = 'Disponível';
    } else {
      // se está empenhada aleatoriamente (20% chance), senão disponível ou em calibração
      if (_random.nextDouble() < 0.3) {
        status = 'Empenhada';
      } else if (_random.nextDouble() < 0.2) {
        status = 'Em calibração';
      } else {
        status = 'Disponível';
      }
    }

    final dataAquisicao = DateTime(2020 + _random.nextInt(5), _random.nextInt(12) + 1, _random.nextInt(26) + 1);

    var ferramenta = proto.Ferramenta(
      codigoSap: isInstrumento ? 16000000 + i : 17000000 + i,
      nome: 'Ferramenta ${i + 1}',
      descricao: _random.nextBool() ? _randomLorem(1) : _randomLorem(3),
      patrimonio: patrimonioCode,
      unidadeMedida: _unidadeIdFerramenta,
      unidadeMedidaId: _unidadeIdFerramenta!.id!,
      empenhadoParaId: status == 'Empenhada'? null : _empenhadoParaId?.id,
      empenhadoPara: status == 'Empenhada'? null :_empenhadoParaId,
      tipoId: _tipoid!.id!,
      tipo: _tipoid,
      emUso: status == 'Empenhada' ? true : false,
      divisao: isInstrumento ? 'Instrumento' : 'Ferramenta',
      status: status,
      baseId: _baseObj?.id,
      base: _baseObj,
      veiculoId: _veiculoObj?.id,
      veiculo: _veiculoObj,
      dataAquisicao: dataAquisicao,
      dataUltimaMovimentacao: DateTime.now(),
    );
    await proto.Ferramenta.db.insertRow(session, ferramenta);

    if (ferramenta.id == null) {
      ferramenta = (await proto.Ferramenta.db.findFirstRow(
        session,
        where: (t) => t.patrimonio.equals(patrimonioCode),
      ))!;
    }

    if (ferramenta.id == null) {
      throw Exception("Falha CRÍTICA ao obter ID da Ferramenta após inserção.");
    }

    // Se for INSTRUMENTO (Patrimoniado), adiciona calibração aleatória
    if (isInstrumento) {
      final isValida = _random.nextDouble() > 0.3;
      final dataCalib = DateTime.now().subtract(Duration(days: _random.nextInt(100)));
      final validade = dataCalib.add(const Duration(days: 365));
      final statusCal = validade.isBefore(DateTime.now()) ? 'Vencido' : 'Válido';

      final calibracao = proto.Calibracao(
        ferramenta: ferramenta,
        ferramentaId: ferramenta.id!,
        dataCalibracao: dataCalib,
        validadeCalibracao: validade,
        status: statusCal,
      );
      await proto.Calibracao.db.insertRow(session, calibracao);
    }
  }
  print('Ferramentas inseridas/atualizadas.');

  // -----------------------------------------------------------------------
  // 7. INSERÇÃO DE ALERTAS (para admins e usuários)
  // -----------------------------------------------------------------------
  print('-> Inserindo Alertas');

  // 7.1 Alertas de estoque baixo (admins)
  final materiais = await proto.Material.db.find(session);
  for (final m in materiais) {
    if (m.quantidade != null && m.estoqueMinimo != null && m.quantidade! <= m.estoqueMinimo!) {
      final alerta = proto.Alerta(
        usuarioId: null,
        tipo: 'ESTOQUE_BAIXO',
        titulo: 'Estoque baixo: ${m.nome ?? m.codigoSap}',
        mensagem: 'O material ${m.nome ?? m.codigoSap} está com estoque ${m.quantidade} <= mínimo ${m.estoqueMinimo}.',
        dataCriacao: DateTime.now(),
        lido: false,
        material: m,
        nivelPrioridade: 2,
        ativo: true,
      );
      await proto.Alerta.db.insertRow(session, alerta);
    }
  }

  // 7.2 Alertas de calibração próximas ou vencidas (admins)
  final calibracoes = await proto.Calibracao.db.find(session);
  for (final c in calibracoes) {
    if (c.validadeCalibracao != null) {
      final daysLeft = c.validadeCalibracao!.difference(DateTime.now()).inDays;
      if (daysLeft <= 30) {
        final alerta = proto.Alerta(
          usuarioId: null,
          tipo: daysLeft < 0 ? 'CALIBRACAO_VENCIDA' : 'CALIBRACAO_VENCENDO',
          titulo: daysLeft < 0 ? 'Calibração Vencida' : 'Calibração Próxima',
          mensagem: 'Calibração da ferramenta ${c.ferramenta?.nome ?? c.ferramentaId} vence em ${daysLeft} dias.',
          dataCriacao: DateTime.now(),
          lido: false,
          calibracao: c,
          ferramenta: c.ferramenta,
          nivelPrioridade: daysLeft < 0 ? 3 : 2,
          ativo: true,
        );
        await proto.Alerta.db.insertRow(session, alerta);
      }
    }
  }

  // 7.3 Alertas para usuários sobre devoluções próximas ou vencidas de ferramentas empenhadas
  final ferramentasEmpenhadas = await proto.Ferramenta.db.find(session,
      where: (t) => t.empenhadoParaId.notEquals(null));
  for (final f in ferramentasEmpenhadas) {
    // simula uma data de devolução esperada a partir da última movimentação (se existir)
    final baseDate = f.dataUltimaMovimentacao ?? DateTime.now();
    final devolucaoEsperada = baseDate.add(Duration(days: 7 + _random.nextInt(14)));
    final daysLeft = devolucaoEsperada.difference(DateTime.now()).inDays;
    if (f.empenhadoParaId != null) {
      final alerta = proto.Alerta(
        usuarioId: f.empenhadoParaId!,
        tipo: daysLeft < 0 ? 'DEVOLUCAO_ATRASADA' : 'DEVOLUCAO_PROXIMA',
        titulo: daysLeft < 0 ? 'Devolução atrasada' : 'Devolução próxima',
        mensagem: daysLeft < 0
            ? 'A devolução da ferramenta ${f.nome ?? f.patrimonio ?? f.codigoSap} está atrasada.'
            : 'A devolução da ferramenta ${f.nome ?? f.patrimonio ?? f.codigoSap} ocorrerá em $daysLeft dias.',
        dataCriacao: DateTime.now(),
        lido: false,
        ferramenta: f,
        movimentacao: null,
        nivelPrioridade: daysLeft < 0 ? 3 : 2,
        ativo: true,
      );
      await proto.Alerta.db.insertRow(session, alerta);
    }
  }

  print('Alertas inseridos (admins e usuários).');

  print('============================================');
  print('          SEED COMPLETO!                    ');
  print('============================================');
  await pod.shutdown();
}
