import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart' as cli;
import 'package:organiza_metro_flutter/src/controllers/admin_controller.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';

class ManageCalibrationsModal extends StatefulWidget {
  const ManageCalibrationsModal({super.key});

  @override
  State<ManageCalibrationsModal> createState() =>
      _ManageCalibrationsModalState();
}

class _ManageCalibrationsModalState extends State<ManageCalibrationsModal> {
  int _tabIndex = 0;
  Map<String, dynamic>? _selectedFerramentaRow;
  DateTime? _dataCalibracao;
  DateTime? _validadeCalibracao;
  String _status = 'Agendada';
  bool _loading = false;

  String _fmt(DateTime? d) => d == null ? '-' : '${d.day}/${d.month}/${d.year}';

  @override
  void initState() {
    super.initState();
    final controller = Provider.of<AdminController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchCalibracoesData();
    });
  }

  Future<void> _schedule() async {
    if (_selectedFerramentaRow == null) return;
    if (_dataCalibracao == null || _validadeCalibracao == null) return;
    setState(() => _loading = true);
    final controller = Provider.of<AdminController>(context, listen: false);
    final ok = await controller.addCalibracao(
      ferramentaId: _selectedFerramentaRow!['id'],
      dataCalibracao: _dataCalibracao!,
      validadeCalibracao: _validadeCalibracao!,
      status: _status,
    );
    setState(() => _loading = false);
    if (ok) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context);
    final ferramentas = controller.ferramentasCalibraveis;
    final calibracoes = controller.calibracoesAtivas;

    return Dialog(
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.grey.shade400, width: 1.0)),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.grey.shade400, width: 1.0)),
          0),
      child: SizedBox(
        width: 1020,
        height: 740,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Gerenciar Calibrações',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => setState(() => _tabIndex = 0),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey.shade600,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text('Agendar calibração',
                          style: TextStyle(
                              color: _tabIndex == 0
                                  ? Colors.green.shade700
                                  : Colors.green.shade200)),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => setState(() => _tabIndex = 1),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey.shade600,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text('Calibrações ativas',
                          style: TextStyle(
                              color: _tabIndex == 1
                                  ? Colors.orange.shade700
                                  : Colors.orange.shade200)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _tabIndex == 0
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Selecione uma ferramenta:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemCount: ferramentas.length,
                              itemBuilder: (_, idx) {
                                final f = ferramentas[idx];
                                final selected =
                                    _selectedFerramentaRow != null &&
                                        _selectedFerramentaRow!['id'] == f.id;
                                return ListTile(
                                  selected: selected,
                                  title: Text(
                                      f.patrimonio ?? 'Ferramenta ${f.id}'),
                                  subtitle: Text(
                                      'Descrição: ${f.descricao ?? '-'}\nPatrimonio: ${f.patrimonio ?? '-'}'),
                                  onTap: () => setState(() =>
                                      _selectedFerramentaRow = {
                                        'id': f.id,
                                        'descricao': f.descricao
                                      }),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (_selectedFerramentaRow != null) ...[
                            Row(children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    final now = DateTime.now();
                                    final picked = await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2100));
                                    if (picked != null)
                                      setState(() => _dataCalibracao = picked);
                                  },
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                        labelText: 'Data de calibração',
                                        border: OutlineInputBorder()),
                                    child: Text(_dataCalibracao == null
                                        ? '-'
                                        : '${_dataCalibracao!.day}/${_dataCalibracao!.month}/${_dataCalibracao!.year}'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    final now = DateTime.now();
                                    final picked = await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2100));
                                    if (picked != null) {
                                      setState(
                                          () => _validadeCalibracao = picked);
                                    }
                                  },
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                        labelText: 'Validade',
                                        border: OutlineInputBorder()),
                                    child: Text(_fmt(_validadeCalibracao)),
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 8),
                            Row(children: [
                              Expanded(
                                flex: 2,
                                child: DropdownButtonFormField<String>(
                                  value: _status,
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Agendada',
                                        child: Text('Agendada')),
                                    DropdownMenuItem(
                                        value: 'Concluída',
                                        child: Text('Concluída')),
                                    DropdownMenuItem(
                                        value: 'Vencida',
                                        child: Text('Vencida')),
                                  ],
                                  onChanged: (v) =>
                                      setState(() => _status = v ?? 'Agendada'),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Status'),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  onPressed: _loading ? null : _schedule,
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      textStyle: TextStyle(fontSize: 12)),
                                  child: _loading
                                      ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                              color: Colors.white))
                                      : const Text('Agendar',
                                          style:
                                              TextStyle(color: Colors.white)),
                                ),
                              ),
                            ]),
                          ]
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const Text('Calibrações ativas',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemCount: calibracoes.length,
                              itemBuilder: (_, idx) {
                                final c = calibracoes[idx];
                                return Card(
                                  child: ListTile(
                                    title: Text(c.ferramenta?.nome ??
                                        'Ferramenta ${c.ferramenta?.id}'),
                                    subtitle: Text(
                                        'Validade: ${_fmt(c.validadeCalibracao)}'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete_forever,
                                          color: Colors.red),
                                      onPressed: () async {
                                        final confirm = await showDialog<bool>(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                    title:
                                                        const Text('Confirmar'),
                                                    content: const Text(
                                                        'Remover calibração?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(ctx)
                                                                  .pop(false),
                                                          child: Text('Não')),
                                                      TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(ctx)
                                                                  .pop(true),
                                                          child: Text('Sim'))
                                                    ]));
                                        if (confirm == true) {
                                          await Provider.of<AdminController>(
                                                  context,
                                                  listen: false)
                                              .removeCalibracao(c.id!);
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageEmployeesModal extends StatefulWidget {
  const ManageEmployeesModal({super.key});

  @override
  State<ManageEmployeesModal> createState() => _ManageEmployeesModalState();
}

class _ManageEmployeesModalState extends State<ManageEmployeesModal> {
  bool _loading = true;
  List<cli.LocalUserInfo> _locals = [];
  List<dynamic> _authUsers = [];
  Set<int> _selectedLocalIds = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final controller = Provider.of<AdminController>(context, listen: false);
    final locals = await controller.getAllEmployees();
    final userIds = locals.map((l) => l.userInfoId).toSet().toList();
    final auths = await controller.getAuthUsersByIds(userIds);
    setState(() {
      _locals = locals;
      _authUsers = auths;
      _loading = false;
      _selectedLocalIds.clear();
    });
  }

  Future<void> _deleteSelected() async {
    if (_selectedLocalIds.isEmpty) return;
    final confirm = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
                title: const Text('Confirmar exclusão'),
                content:
                    Text('Excluir ${_selectedLocalIds.length} funcionário(s)?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: const Text('Cancelar')),
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: const Text('Excluir'))
                ]));
    if (confirm != true) return;
    setState(() => _loading = true);
    final controller = Provider.of<AdminController>(context, listen: false);
    for (final id in _selectedLocalIds.toList()) {
      await controller.removeEmployeeLocal(id);
    }
    await _load();
  }

  String _authLabelFor(cli.LocalUserInfo local) {
    dynamic auth;
    for (final a in _authUsers) {
      try {
        final id = (a is Map) ? a['id'] : (a.id ?? a['userInfoId']);
        if (id == local.userInfoId) {
          auth = a;
          break;
        }
      } catch (_) {}
    }

    String name = '-';
    if (auth != null) {
      try {
        name = (auth is Map)
            ? (auth['userName'] ?? auth['email'] ?? '-')
            : (auth.userName ?? auth.email ?? '-');
      } catch (_) {
        name = '-';
      }
    }

    return '$name (${local.registro})';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 800,
        height: 600,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Gerenciar Funcionários',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
            Expanded(
              child: _loading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.blueGrey))
                  : _locals.isEmpty
                      ? Center(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                          const Text('Nenhum funcionário encontrado.'),
                          const SizedBox(height: 12),
                          ElevatedButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => AddEmployeeModal()),
                              child: const Text('Adicionar Funcionário'))
                        ]))
                      : ListView.builder(
                          itemCount: _locals.length,
                          itemBuilder: (ctx, idx) {
                            final local = _locals[idx];
                            final selected =
                                _selectedLocalIds.contains(local.id);
                            return CheckboxListTile(
                              value: selected,
                              onChanged: (v) => setState(() => v == true
                                  ? _selectedLocalIds.add(local.id!)
                                  : _selectedLocalIds.remove(local.id!)),
                              title: Text(_authLabelFor(local)),
                              subtitle: Text(
                                  'Telefone: ${local.telefone} • Área: ${local.area}'),
                            );
                          },
                        ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () => showDialog(
                              context: context,
                              builder: (_) => AddEmployeeModal())
                          .then((_) => _load()),
                      child: const Text('Adicionar Funcionário')),
                  const SizedBox(width: 12),
                  ElevatedButton(
                      onPressed: _selectedLocalIds.isEmpty || _loading
                          ? null
                          : _deleteSelected,
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Excluir Selecionados')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddEmployeeModal extends StatefulWidget {
  AddEmployeeModal({super.key});

  @override
  _AddEmployeeModalState createState() => _AddEmployeeModalState();
}

class _AddEmployeeModalState extends State<AddEmployeeModal> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _registryController = TextEditingController();
  final _areaController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isAdmin = false;
  String? _errorMessage;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final controller = Provider.of<AdminController>(context, listen: false);
    final result = await controller.addEmployee(
      nome: _firstNameController.text.trim(),
      email: _emailController.text.trim(),
      senha: _passwordController.text.trim(),
      registro: _registryController.text.trim(),
      telefone: _phoneController.text.trim(),
      area: _areaController.text.trim(),
      isAdmin: _isAdmin,
    );
    setState(() {
      _isLoading = false;
    });
    if (result == null) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Funcionário adicionado com sucesso!')),
      );
    } else {
      setState(() {
        _errorMessage = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Novo Funcionário'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(_errorMessage!,
                      style: const TextStyle(color: Colors.red)),
                ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Identificação:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                    labelText: 'Nome', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                    labelText: 'Telefone',
                    border: OutlineInputBorder(),
                    hintText: '(XX) XXXXX-XXXX'),
                keyboardType: TextInputType.phone,
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _registryController,
                decoration: const InputDecoration(
                    labelText: 'Registro',
                    helperText: 'Padrão: rXXXXXY (ex: r123450)',
                    border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _areaController,
                decoration: const InputDecoration(
                    labelText: 'Área / Departamento',
                    border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _isAdmin,
                    onChanged: (v) => setState(() => _isAdmin = v ?? false),
                  ),
                  const Text('Administrador'),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    hintText: 'Mínimo 8 caracteres'),
                obscureText: true,
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : const Text('Adicionar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

enum ItemType { material, ferramenta }

class AddMaterialToolModal extends StatefulWidget {
  const AddMaterialToolModal({super.key});
  @override
  State<AddMaterialToolModal> createState() => _AddMaterialToolModalState();
}

class _AddMaterialToolModalState extends State<AddMaterialToolModal> {
  final _formKey = GlobalKey<FormState>();
  ItemType _selectedType = ItemType.material;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isPatrimoniado = false;

  final _sapController = TextEditingController();
  final _descController = TextEditingController();
  final _patrimonioController = TextEditingController();
  final _initialQtyController = TextEditingController();
  final _minStockController = TextEditingController();
  final _divisaoController = TextEditingController();
  int? _selectedStatusIndex;
  DateTime? _selectedDate;

  int? _selectedUnidadeId;
  int? _selectedTipoMaterialId;
  int? _selectedToolTypeId;
  int? _selectedBaseId;
  int? _selectedVeiculoId;

  final List<String> _statusOptions = [
    'Empenhada',
    'Disponível',
    'Em calibração',
    'Em reposição',
  ];

  Future<void> _submit() async {
    if (_selectedType == ItemType.material) {
      if (_initialQtyController.text.isNotEmpty &&
          double.tryParse(_initialQtyController.text.trim()) == null) {
        setState(() {
          _errorMessage = 'Quantidade deve ser um número válido.';
        });
        return;
      }
      if (_minStockController.text.isNotEmpty &&
          double.tryParse(_minStockController.text.trim()) == null) {
        setState(() {
          _errorMessage = 'Estoque mínimo deve ser um número válido.';
        });
        return;
      }
    } else {
      if (_initialQtyController.text.isNotEmpty &&
          int.tryParse(_initialQtyController.text.trim()) == null) {
        setState(() {
          _errorMessage = 'Quantidade deve ser um número inteiro.';
        });
        return;
      }
    }

    if (_selectedType == ItemType.ferramenta &&
        _selectedBaseId != null &&
        _selectedVeiculoId != null) {
      setState(() {
        _errorMessage =
            'Ferramenta só pode estar em uma base OU veículo, nunca ambos.';
      });
      return;
    }
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final controller = Provider.of<AdminController>(context, listen: false);
    String? result;
    if (_selectedType == ItemType.material) {
      result = await controller.addMaterial({
        'nome': null,
        'codigoSap': int.tryParse(_sapController.text.trim()),
        'descricao': _descController.text.trim(),
        'quantidade': double.tryParse(_initialQtyController.text.trim()),
        'estoqueMinimo': double.tryParse(_minStockController.text.trim()),
        'unidadeMedidaId': _selectedUnidadeId,
        'tipoMaterialId': _selectedTipoMaterialId,
        'baseId': _selectedBaseId,
        'veiculoId': _selectedVeiculoId,
      });
    } else {
      result = await controller.addFerramenta({
        'nome': null,
        'codigoSap': int.tryParse(_sapController.text.trim()),
        'descricao': _descController.text.trim(),
        'patrimonio': _patrimonioController.text.trim(),
        'divisao': _divisaoController.text.trim(),
        'tipoMaterialId': _selectedToolTypeId,
        'status': _selectedStatusIndex != null
            ? _statusOptions[_selectedStatusIndex!]
            : null,
        'dataAquisicao':
            _selectedDate != null ? _selectedDate!.toIso8601String() : null,
        'unidadeMedidaId': _selectedUnidadeId,
        'baseId': _selectedBaseId,
        'veiculoId': _selectedVeiculoId,
      });
    }
    setState(() {
      _isLoading = false;
    });
    if (result == null) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(_selectedType == ItemType.material
                ? 'Material adicionado com sucesso!'
                : 'Ferramenta adicionada com sucesso!')),
      );
    } else {
      setState(() {
        _errorMessage = result;
      });
    }
  }

  @override
  void dispose() {
    _sapController.dispose();
    _descController.dispose();
    _patrimonioController.dispose();
    _initialQtyController.dispose();
    _minStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context);
    final unidades = controller.unidades;
    final tipos = controller.tipos;
    final bases = controller.bases;
    final veiculos = controller.veiculos;

    return AlertDialog(
      title: const Text('Adicionar Material ou Ferramenta'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(_errorMessage!,
                      style: const TextStyle(color: Colors.red)),
                ),
              SegmentedButton<ItemType>(
                segments: const [
                  ButtonSegment(
                      value: ItemType.material, label: Text('Material')),
                  ButtonSegment(
                      value: ItemType.ferramenta, label: Text('Ferramenta')),
                ],
                selected: {_selectedType},
                onSelectionChanged: (newSelection) {
                  setState(() => _selectedType = newSelection.first);
                },
                style: SegmentedButton.styleFrom(
                    selectedBackgroundColor: Colors.black12),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _sapController,
                decoration: const InputDecoration(
                    labelText: 'Código SAP', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                    labelText: 'Descrição', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                    labelText: 'Unidade de Medida',
                    border: OutlineInputBorder()),
                value: _selectedUnidadeId,
                items: unidades
                    .map((u) =>
                        DropdownMenuItem(value: u.id, child: Text(u.codigo)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedUnidadeId = v),
                validator: (v) => v == null ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                    labelText: 'Base', border: OutlineInputBorder()),
                value: _selectedBaseId,
                items: bases
                    .map((b) =>
                        DropdownMenuItem(value: b.id, child: Text(b.nome)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedBaseId = v),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                    labelText: 'Veículo', border: OutlineInputBorder()),
                value: _selectedVeiculoId,
                items: veiculos
                    .map((v) =>
                        DropdownMenuItem(value: v.id, child: Text(v.codigo)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedVeiculoId = v),
              ),
              const SizedBox(height: 10),
              if (_selectedType == ItemType.material) ...[
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                      labelText: 'Tipo de Material',
                      border: OutlineInputBorder()),
                  value: _selectedTipoMaterialId,
                  items: tipos
                      .map((t) =>
                          DropdownMenuItem(value: t.id, child: Text(t.nome)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedTipoMaterialId = v),
                  validator: (v) => v == null ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _initialQtyController,
                  decoration: const InputDecoration(
                      labelText: 'Quantidade Inicial',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Obrigatório';
                    if (double.tryParse(v) == null)
                      return 'Digite apenas números.';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _minStockController,
                  decoration: const InputDecoration(
                      labelText: 'Estoque Mínimo',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v != null && v.isNotEmpty && double.tryParse(v) == null)
                      return 'Digite apenas números.';
                    return null;
                  },
                ),
              ],
              if (_selectedType == ItemType.ferramenta) ...[
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                      labelText: 'Tipo do Ativo', border: OutlineInputBorder()),
                  value: _selectedToolTypeId,
                  items: tipos
                      .map((t) =>
                          DropdownMenuItem(value: t.id, child: Text(t.nome)))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      _selectedToolTypeId = v;
                      _isPatrimoniado = (v == 3);
                    });
                  },
                  validator: (v) => v == null ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _patrimonioController,
                  enabled: _isPatrimoniado,
                  decoration: InputDecoration(
                    labelText: 'Patrimônio',
                    border: const OutlineInputBorder(),
                    fillColor: !_isPatrimoniado ? Colors.grey.shade200 : null,
                    filled: !_isPatrimoniado,
                  ),
                  validator: (v) {
                    if (_isPatrimoniado && (v == null || v.isEmpty)) {
                      return 'Obrigatório para ativos patrimoniados';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _initialQtyController,
                  decoration: const InputDecoration(
                      labelText: 'Quantidade', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Obrigatório';
                    if (int.tryParse(v) == null)
                      return 'Digite apenas números inteiros.';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _divisaoController,
                  decoration: const InputDecoration(
                      labelText: 'Divisão', border: OutlineInputBorder()),
                  validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                      labelText: 'Status', border: OutlineInputBorder()),
                  value: _selectedStatusIndex,
                  items: List.generate(
                      _statusOptions.length,
                      (i) => DropdownMenuItem(
                          value: i, child: Text(_statusOptions[i]))),
                  onChanged: (v) => setState(() => _selectedStatusIndex = v),
                  validator: (v) => v == null ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Data de Aquisição',
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                  ),
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}'
                        : '',
                  ),
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? now,
                      firstDate: DateTime(2023),
                      lastDate: now,
                    );
                    if (picked != null) {
                      setState(() => _selectedDate = picked);
                    }
                  },
                  validator: (v) =>
                      _selectedDate == null ? 'Obrigatório' : null,
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : const Text('Adicionar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class EditMaterialsModal extends StatefulWidget {
  const EditMaterialsModal({super.key});

  @override
  State<EditMaterialsModal> createState() => _EditMaterialsModalState();
}

class _EditMaterialsModalState extends State<EditMaterialsModal> {
  List<Map<String, dynamic>> _source = [];

  late List<DatatableHeader> _headers;

  bool _isLoadingLocal = false;
  List<Map<String, dynamic>> _selecteds = [];
  List<bool>? _expanded;
  String? _sortColumn;
  bool _sortAscending = true;
  List<Map<String, dynamic>> _sourceFiltered = [];
  int? _currentPerPage = 20;
  int _currentPage = 1;
  String? _searchKey = "id";
  List<Map<String, dynamic>> _sourceOriginal = [];
  int _total = 0;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = Provider.of<AdminController>(context, listen: false);

    if (_headers.isEmpty) {
      _headers = _buildHeaders(controller);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.materiais.clear();
      _initData(controller);
    });
  }

  Future<void> _initData(AdminController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (controller.materiais.isEmpty) {
        await controller.fetchAllData();
      }
      _source = _convertMateriasToMap(controller.materiais);

      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertMateriasToMap(controller.materiais));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar dados do modal: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

  List<Map<String, dynamic>> _convertMateriasToMap(List materiais) {
    return materiais.map<Map<String, dynamic>>((m) {
      return {
        'id': m.id,
        'codigoSap': m.codigoSap,
        'nome': m.nome,
        'descricao': m.descricao ?? '',
        'quantidade': m.quantidade,
        'estoqueMinimo': m.estoqueMinimo,
        'unidadeMedidaId': m.unidadeMedida?.id,
        'unidadeMedidaCodigo': m.unidadeMedida?.codigo,
        'tipoMaterialId': m.tipo?.id,
        'tipoMaterialNome': m.tipo?.nome,
        'baseId': m.base?.id,
        'baseNome': m.base?.nome,
        'veiculoId': m.veiculo?.id,
        'veiculoCodigo': m.veiculo?.codigo,
        'modified': false,
        'modifiedFields': <String>{},
      };
    }).toList();
  }

  List<DatatableHeader> _buildHeaders(AdminController controller) {
    return [
      DatatableHeader(text: "ID", value: "id", show: false),
      DatatableHeader(
          text: "CÓDIGO SAP",
          value: "codigoSap",
          show: true,
          sortable: true,
          editable: true,
          flex: 1),
      DatatableHeader(
          text: "NOME",
          value: "nome",
          show: true,
          sortable: true,
          editable: true,
          flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 2,
          sortable: true,
          editable: true),
      DatatableHeader(
          text: "QTD",
          value: "quantidade",
          show: true,
          sortable: true,
          editable: true),
      DatatableHeader(
          text: "ESTOQUE MIN",
          value: "estoqueMinimo",
          show: true,
          editable: true),

      // Unidade de Medida (dropdown por id)
      DatatableHeader(
        text: "Unidade de Medida",
        value: "unidadeMedidaId",
        show: true,
        sortable: false,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final unidades = controller.unidades;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: unidades.any((u) => u.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: unidades
                  .map((u) => DropdownMenuItem(
                        value: u.id,
                        child: Text(u.codigo),
                      ))
                  .toList(),
              onChanged: (novaUnidadeId) {
                if (novaUnidadeId == null) return;
                setState(() {
                  row['unidadeMedidaId'] = novaUnidadeId;
                  row['unidadeMedidaCodigo'] =
                      unidades.firstWhere((u) => u.id == novaUnidadeId).codigo;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('unidadeMedidaId');
                });
              },
            ),
          );
        },
      ),

      // Tipo Material (dropdown por id)
      DatatableHeader(
        text: "Tipo",
        value: "tipoMaterialId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final tipos = controller.tipos;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: tipos.any((t) => t.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: tipos
                  .map((t) => DropdownMenuItem(
                        value: t.id,
                        child: Text(t.nome),
                      ))
                  .toList(),
              onChanged: (novoTipoId) {
                if (novoTipoId == null) return;
                setState(() {
                  row['tipoMaterialId'] = novoTipoId;
                  row['tipoMaterialNome'] =
                      tipos.firstWhere((t) => t.id == novoTipoId).nome;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('tipoMaterialId');
                });
              },
            ),
          );
        },
      ),

      // Base (dropdown)
      DatatableHeader(
        text: "Base",
        value: "baseId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final bases = controller.bases;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: bases.any((b) => b.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: bases
                  .map((b) => DropdownMenuItem(
                        value: b.id,
                        child: Text(b.nome),
                      ))
                  .toList(),
              onChanged: (novaBaseId) {
                if (novaBaseId == null) return;
                setState(() {
                  row['baseId'] = novaBaseId;
                  row['baseNome'] =
                      bases.firstWhere((b) => b.id == novaBaseId).nome;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('baseId');
                });
              },
            ),
          );
        },
      ),

      // Veículo (dropdown)
      DatatableHeader(
        text: "VEÍCULO",
        value: "veiculoId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final veiculos = controller.veiculos;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: veiculos.any((v) => v.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: veiculos
                  .map((v) => DropdownMenuItem(
                        value: v.id,
                        child: Text(v.codigo),
                      ))
                  .toList(),
              onChanged: (novo) {
                if (novo == null) return;
                setState(() {
                  row['veiculoId'] = novo;
                  row['veiculoCodigo'] =
                      veiculos.firstWhere((v) => v.id == novo).codigo;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('veiculoId');
                });
              },
            ),
          );
        },
      ),
    ];
  }

  Future<void> _saveChanges(AdminController controller) async {
    final edited = _source.where((r) => (r['modified'] == true)).toList();
    if (edited.isEmpty) {
      print('Nenhuma alteração pendente.');
      return;
    }

    setState(() => _isLoadingLocal = true);
    int ok = 0;

    for (final row in edited) {
      try {
        final modifiedFields = (row['modifiedFields'] as Set?) ?? <String>{};
        if (modifiedFields.isEmpty) continue;

        final updateMap = <String, dynamic>{'id': row['id']};

        for (final field in modifiedFields) {
          final raw = row[field];

          if (raw == null) {
            updateMap[field] = null;
          } else if (raw is int || raw is double || raw is bool) {
            updateMap[field] = raw;
          } else if (raw is String) {
            final asInt = int.tryParse(raw);
            if (asInt != null) {
              updateMap[field] = asInt;
              continue;
            }

            final asDouble = double.tryParse(raw);
            if (asDouble != null) {
              updateMap[field] = asDouble;
              continue;
            }

            updateMap[field] = raw;
          } else {
            updateMap[field] = raw;
          }
        }
        print('>>> UPDATE MAP ENVIADO: $updateMap');
        final success = await controller.updateMaterial(updateMap);

        if (success) {
          ok++;
          row['modified'] = false;
          row['modifiedFields'] = <String>{};
        }
      } catch (e) {
        print('Erro update: $e');
      }
    }

    setState(() => _isLoadingLocal = false);
    print("Atualizações concluídas: $ok itens.");
  }

  Future<void> _deleteSelected(AdminController controller) async {
    if (_selecteds.isEmpty) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Excluir"),
          content: Text(
            "Excluir ${_selecteds.length} item(s)? Esta ação não pode ser desfeita.",
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text("Cancelar")),
            ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text("Excluir")),
          ],
        );
      },
    );

    if (confirm != true) return;

    setState(() => _isLoadingLocal = true);

    int ok = 0;

    final selectedCopy = List<Map<String, dynamic>>.from(_selecteds);

    for (final row in selectedCopy) {
      final id = row['id'] as int?;
      if (id == null) continue;

      final result = await controller.deleteMaterial(id);

      if (result) {
        ok++;
        _source.remove(row);
        _selecteds.remove(row);
      }
    }

    setState(() => _isLoadingLocal = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Excluídos: $ok item(s).')),
    );
  }

  void _onChangedRowLocal(
      Map<String, dynamic> changedRow, DatatableHeader header) {
    final id = changedRow['id'];
    final row = _source.firstWhere((r) => r['id'] == id, orElse: () => {});
    if (row.isEmpty) return;

    final field = header.value;

    setState(() {
      row[field] = changedRow[field];
      row['modified'] = true;
      row['modifiedFields'] ??= <String>{};
      (row['modifiedFields'] as Set<String>).add(field);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context);

    if (_source.isEmpty && controller.materiais.isNotEmpty) {
      _source = _convertMateriasToMap(controller.materiais);
    }

    final loading = controller.isLoading || _isLoadingLocal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Ferramentas'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blueGrey))
          : LayoutBuilder(builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final bool isLargeScreen = screenWidth > 800;

              if (isLargeScreen) {
                final double baseColWidth = 120.0;
                final visibleHeaders =
                    _headers.where((h) => h.show == true).toList();
                final double checkboxWidth = 60.0;
                final double minWidth = visibleHeaders.fold<double>(
                        0.0,
                        (sum, h) =>
                            sum + ((h.flex <= 0 ? 1 : h.flex) * baseColWidth)) +
                    checkboxWidth;

                final maxTableHeight = MediaQuery.of(context).size.height;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: minWidth,
                    ),
                    child: SizedBox(
                      width: minWidth,
                      child: Card(
                        elevation: 2,
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: maxTableHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 12),
                              child: ResponsiveDatatable(
                                headers: _headers,
                                source: _source,
                                autoHeight: false,
                                showSelect: true,
                                isLoading: loading,
                                selecteds: _selecteds,
                                expanded: _expanded,
                                onChangedRow: (value, header) {
                                  _onChangedRowLocal(value, header);
                                },
                                onSelect: (value, item) {
                                  setState(() {
                                    if (value!) {
                                      _selecteds.add(item);
                                    } else {
                                      _selecteds.remove(item);
                                    }
                                  });
                                },
                                onSort: (value) {
                                  setState(() => _isLoadingLocal = true);

                                  setState(() {
                                    _sortColumn = value;
                                    _sortAscending = !_sortAscending;
                                    if (_sortAscending) {
                                      _sourceFiltered.sort((a, b) =>
                                          b["$_sortColumn"]
                                              .compareTo(a["$_sortColumn"]));
                                    } else {
                                      _sourceFiltered.sort((a, b) =>
                                          a["$_sortColumn"]
                                              .compareTo(b["$_sortColumn"]));
                                    }
                                    var _rangeTop = _currentPerPage! <
                                            _sourceFiltered.length
                                        ? _currentPage!
                                        : _sourceFiltered.length;
                                    _source = _sourceFiltered
                                        .getRange(0, _rangeTop)
                                        .toList();

                                    _isLoadingLocal = false;
                                  });
                                },
                                footers: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text("Rows per page"),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: DropdownButton<int>(
                                      value: _currentPerPage,
                                      items: _perPages
                                          .map((e) => DropdownMenuItem<int>(
                                                value: e,
                                                child: Text("$e"),
                                              ))
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentPerPage = value;
                                          _currentPage = 1;
                                          _resetData(start: 0);
                                        });
                                      },
                                      isExpanded: false,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                        "$_currentPage - $_currentPerPage of $_total"),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 16,
                                    ),
                                    onPressed: _currentPage == 1
                                        ? null
                                        : () {
                                            var _nextSet =
                                                _currentPage - _currentPerPage!;
                                            setState(() {
                                              _currentPage =
                                                  _nextSet > 1 ? _nextSet : 1;
                                              _resetData(
                                                  start: _currentPage - 1);
                                            });
                                          },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios,
                                        size: 16),
                                    onPressed: _currentPage +
                                                _currentPerPage! -
                                                1 >
                                            _total
                                        ? null
                                        : () {
                                            var _nextSet =
                                                _currentPage + _currentPerPage!;

                                            setState(() {
                                              _currentPage = _nextSet < _total
                                                  ? _nextSet
                                                  : _total - _currentPerPage!;
                                              _resetData(start: _nextSet - 1);
                                            });
                                          },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResponsiveDatatable(
                      headers: _headers,
                      source: _source,
                      autoHeight: true,
                      showSelect: true,
                      isLoading: loading,
                      selecteds: _selecteds,
                      expanded: _expanded,
                      onChangedRow: (value, header) {
                        _onChangedRowLocal(value, header);
                      },
                      onSelect: (value, item) {
                        setState(() {
                          if (value!) {
                            _selecteds.add(item);
                          } else {
                            _selecteds.remove(item);
                          }
                        });
                      },
                      onSort: (value) {
                        setState(() => _isLoadingLocal = true);

                        setState(() {
                          _sortColumn = value;
                          _sortAscending = !_sortAscending;
                          if (_sortAscending) {
                            _sourceFiltered.sort((a, b) =>
                                b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                          } else {
                            _sourceFiltered.sort((a, b) =>
                                a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                          }
                          var _rangeTop =
                              _currentPerPage! < _sourceFiltered.length
                                  ? _currentPage!
                                  : _sourceFiltered.length;
                          _source =
                              _sourceFiltered.getRange(0, _rangeTop).toList();

                          _isLoadingLocal = false;
                        });
                      },
                      footers: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Total: ${_source.length} registros'),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.green,
            onPressed: loading ? null : () => _saveChanges(controller),
            icon: const Icon(Icons.save, color: Colors.white),
            label: const Text('Salvar', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed:
                _selecteds.isEmpty ? null : () => _deleteSelected(controller),
            icon: const Icon(Icons.delete, color: Colors.white),
            label: const Text(
              "Excluir",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class EditToolsModal extends StatefulWidget {
  const EditToolsModal({super.key});
  @override
  State<EditToolsModal> createState() => _EditToolsModalState();
}

class _EditToolsModalState extends State<EditToolsModal> {
  List<Map<String, dynamic>> _source = [];
  late List<DatatableHeader> _headers;
  bool _isLoadingLocal = false;
  List<Map<String, dynamic>> _selecteds = [];
  List<bool>? _expanded;
  String? _sortColumn;
  bool _sortAscending = true;
  List<Map<String, dynamic>> _sourceFiltered = [];
  int _currentPerPage = 10;
  int _currentPage = 1;
  List<Map<String, dynamic>> _sourceOriginal = [];
  int _total = 0;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = Provider.of<AdminController>(context, listen: false);
    if (_headers.isEmpty) {
      _headers = _buildHeaders(controller);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData(controller);
    });
  }

  @override
  void dispose() {
    super.dispose();
    final controller = Provider.of<AdminController>(context, listen: false);
    controller.ferramentas.clear();
  }

  Future<void> _initData(AdminController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (controller.ferramentas.isEmpty) {
        await controller.fetchFerramentasPaginadas(
            _currentPage, _currentPerPage);
      }
      _source = _convertFerramentasToMap(controller.ferramentas);
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertFerramentasToMap(controller.ferramentas));
      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;
      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar ferramentas: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

  List<Map<String, dynamic>> _convertFerramentasToMap(List ferramentas) {
    return ferramentas.map<Map<String, dynamic>>((f) {
      return {
        'id': f.id,
        'nome': f.nome ?? '',
        'codigoSap': f.codigoSap,
        'descricao': f.descricao ?? '',
        'patrimonio': f.patrimonio ?? '',
        'divisao': f.divisao ?? '',
        'emUso': f.emUso,
        'tipoMaterialId': f.tipo?.id,
        'tipoMaterialNome': f.tipo?.nome,
        'status': f.status ?? '',
        'dataAquisicao': DateFormat('dd/MM/yyyy').format(f.dataAquisicao),
        'unidadeMedidaId': f.unidadeMedida?.id,
        'unidadeMedidaCodigo': f.unidadeMedida?.codigo,
        'baseId': f.base?.id,
        'baseNome': f.base?.nome,
        'veiculoId': f.veiculo?.id,
        'veiculoCodigo': f.veiculo?.codigo,
        'modified': false,
        'modifiedFields': <String>{},
      };
    }).toList();
  }

  final List<String> _statusOptions = [
    'Empenhada',
    'Disponível',
    'Em calibração',
    'Em reposição',
  ];

  final List<String> _divisaoOption = [
    'Ferramenta Manual',
    'Instrumento',
  ];

  List<DatatableHeader> _buildHeaders(AdminController controller) {
    return [
      DatatableHeader(text: "ID", value: "id", show: false),
      DatatableHeader(
          text: "NOME", value: "nome", show: true, editable: true, flex: 1),
      DatatableHeader(
          text: "CÓDIGO SAP",
          value: "codigoSap",
          show: true,
          editable: true,
          flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 3,
          sortable: true,
          sourceBuilder: (value, row) {
            return Expanded(
              child: Text(
                value ?? '',
                maxLines: 3,
                softWrap: true,
              ),
            );
          }),
      DatatableHeader(
          text: "PATRIMÔNIO", value: "patrimonio", show: true, editable: true),
      DatatableHeader(
          text: "EM USO",
          value: "emUso",
          show: true,
          editable: false,
          sourceBuilder: (value, row) {
            if (value == true) {
              return const Icon(Icons.check, color: Colors.green);
            } else {
              return const Icon(Icons.close, color: Colors.red);
            }
          }),
      DatatableHeader(
        text: "DIVISÃO",
        value: "divisao",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final current = value as String?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _divisaoOption.contains(current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: _divisaoOption
                  .map((s) => DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      ))
                  .toList(),
              onChanged: (novoStatus) {
                if (novoStatus == null) return;
                setState(() {
                  row['status'] = novoStatus;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('status');
                });
              },
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Tipo",
        value: "tipoMaterialId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final tipos = controller.tipos;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: tipos.any((t) => t.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: tipos
                  .map((t) => DropdownMenuItem(
                        value: t.id,
                        child: Text(t.nome),
                      ))
                  .toList(),
              onChanged: (novoTipoId) {
                if (novoTipoId == null) return;
                setState(() {
                  row['tipoMaterialId'] = novoTipoId;
                  row['tipoMaterialNome'] =
                      tipos.firstWhere((t) => t.id == novoTipoId).nome;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('tipoMaterialId');
                });
              },
            ),
          );
        },
      ),
      DatatableHeader(
        text: "STATUS",
        value: "status",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final current = value as String?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _statusOptions.contains(current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: _statusOptions
                  .map((s) => DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      ))
                  .toList(),
              onChanged: (novoStatus) {
                if (novoStatus == null) return;
                setState(() {
                  row['status'] = novoStatus;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('status');
                });
              },
            ),
          );
        },
      ),
      DatatableHeader(
        text: "DATA AQUISIÇÃO",
        value: "dataAquisicao",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          return InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: value is DateTime
                    ? value
                    : DateFormat('dd/MM/yyyy').parse(value),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (picked != null) {
                setState(() {
                  row['dataAquisicao'] = picked;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('dataAquisicao');
                });
              }
            },
            child: Center(
              child: Text(
                value is DateTime
                    ? DateFormat('dd/MM/yyyy').format(value)
                    : value ?? '',
              ),
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Unidade de Medida",
        value: "unidadeMedidaId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final unidades = controller.unidades;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: unidades.any((u) => u.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: unidades
                  .map((u) => DropdownMenuItem(
                        value: u.id,
                        child: Text(u.codigo),
                      ))
                  .toList(),
              onChanged: (novaUnidadeId) {
                if (novaUnidadeId == null) return;
                setState(() {
                  row['unidadeMedidaId'] = novaUnidadeId;
                  row['unidadeMedidaCodigo'] =
                      unidades.firstWhere((u) => u.id == novaUnidadeId).codigo;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('unidadeMedidaId');
                });
              },
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Base",
        value: "baseId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final bases = controller.bases;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: bases.any((b) => b.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: bases
                  .map((b) => DropdownMenuItem(
                        value: b.id,
                        child: Text(b.nome),
                      ))
                  .toList(),
              onChanged: (novaBaseId) {
                if (novaBaseId == null) return;
                setState(() {
                  row['baseId'] = novaBaseId;
                  row['baseNome'] =
                      bases.firstWhere((b) => b.id == novaBaseId).nome;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('baseId');
                });
              },
            ),
          );
        },
      ),
      DatatableHeader(
        text: "VEÍCULO",
        value: "veiculoId",
        show: true,
        editable: true,
        flex: 2,
        sourceBuilder: (value, row) {
          final veiculos = controller.veiculos;
          final current = value as int?;
          return DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: veiculos.any((v) => v.id == current) ? current : null,
              isDense: true,
              hint: const Text('-'),
              items: veiculos
                  .map((v) => DropdownMenuItem(
                        value: v.id,
                        child: Text(v.codigo),
                      ))
                  .toList(),
              onChanged: (novo) {
                if (novo == null) return;
                setState(() {
                  row['veiculoId'] = novo;
                  row['veiculoCodigo'] =
                      veiculos.firstWhere((v) => v.id == novo).codigo;
                  row['modified'] = true;
                  row['modifiedFields'] ??= <String>{};
                  (row['modifiedFields'] as Set<String>).add('veiculoId');
                });
              },
            ),
          );
        },
      ),
    ];
  }

  Future<void> _saveChanges(AdminController controller) async {
    final edited = _source.where((r) => (r['modified'] == true)).toList();
    if (edited.isEmpty) {
      print('Nenhuma alteração pendente.');
      return;
    }
    setState(() => _isLoadingLocal = true);
    int ok = 0;
    for (final row in edited) {
      try {
        final modifiedFields = (row['modifiedFields'] as Set?) ?? <String>{};
        if (modifiedFields.isEmpty) continue;
        final updateMap = <String, dynamic>{'id': row['id']};
        for (final field in modifiedFields) {
          final raw = row[field];
          if (raw == null) {
            updateMap[field] = null;
          } else if (raw is int || raw is double || raw is bool) {
            updateMap[field] = raw;
          } else if (raw is String) {
            final asInt = int.tryParse(raw);
            if (asInt != null) {
              updateMap[field] = asInt;
              continue;
            }
            final asDouble = double.tryParse(raw);
            if (asDouble != null) {
              updateMap[field] = asDouble;
              continue;
            }
            updateMap[field] = raw;
          } else {
            updateMap[field] = raw;
          }
        }
        final success = await controller.updateFerramenta(updateMap);
        if (success) {
          ok++;
          row['modified'] = false;
          row['modifiedFields'] = <String>{};
        }
      } catch (e) {
        print('Erro update ferramenta: $e');
      }
    }
    setState(() => _isLoadingLocal = false);
    print("Atualizações concluídas: $ok ferramentas.");
  }

  Future<void> _deleteSelected(AdminController controller) async {
    if (_selecteds.isEmpty) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Excluir Ferramenta"),
          content: Text(
            "Excluir ${_selecteds.length} ferramenta(s)? Esta ação não pode ser desfeita.",
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text("Cancelar")),
            ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text("Excluir")),
          ],
        );
      },
    );
    if (confirm != true) return;
    setState(() => _isLoadingLocal = true);
    int ok = 0;
    final selectedCopy = List<Map<String, dynamic>>.from(_selecteds);
    for (final row in selectedCopy) {
      final id = row['id'] as int?;
      if (id == null) continue;
      final result = await controller.deleteFerramenta(id);
      if (result) {
        ok++;
        _source.remove(row);
        _selecteds.remove(row);
      }
    }
    setState(() => _isLoadingLocal = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Excluídas: $ok ferramenta(s).')),
    );
  }

  void _onChangedRowLocal(
      Map<String, dynamic> changedRow, DatatableHeader header) {
    final id = changedRow['id'];
    final row = _source.firstWhere((r) => r['id'] == id, orElse: () => {});
    if (row.isEmpty) return;
    final field = header.value;
    setState(() {
      row[field] = changedRow[field];
      row['modified'] = true;
      row['modifiedFields'] ??= <String>{};
      (row['modifiedFields'] as Set<String>).add(field);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context);
    if (_source.isEmpty && controller.ferramentas.isNotEmpty) {
      _source = _convertFerramentasToMap(controller.ferramentas);
    }
    final loading = controller.isLoading || _isLoadingLocal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Ferramentas'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blueGrey))
          : LayoutBuilder(builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final bool isLargeScreen = screenWidth > 800;

              if (isLargeScreen) {
                final double baseColWidth = 120.0;
                final visibleHeaders =
                    _headers.where((h) => h.show == true).toList();
                final double checkboxWidth = 60.0;
                final double minWidth = visibleHeaders.fold<double>(
                        0.0,
                        (sum, h) =>
                            sum + ((h.flex <= 0 ? 1 : h.flex) * baseColWidth)) +
                    checkboxWidth;

                final maxTableHeight = MediaQuery.of(context).size.height;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: minWidth,
                    ),
                    child: SizedBox(
                      width: minWidth,
                      child: Card(
                        elevation: 2,
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: maxTableHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 12),
                              child: ResponsiveDatatable(
                                headers: _headers,
                                source: _source,
                                autoHeight: false,
                                showSelect: true,
                                isLoading: loading,
                                selecteds: _selecteds,
                                expanded: _expanded,
                                onChangedRow: (value, header) {
                                  _onChangedRowLocal(value, header);
                                },
                                onSelect: (value, item) {
                                  setState(() {
                                    if (value!) {
                                      _selecteds.add(item);
                                    } else {
                                      _selecteds.remove(item);
                                    }
                                  });
                                },
                                onSort: (value) {
                                  setState(() => _isLoadingLocal = true);

                                  setState(() {
                                    _sortColumn = value;
                                    _sortAscending = !_sortAscending;
                                    if (_sortAscending) {
                                      _sourceFiltered.sort((a, b) =>
                                          b["$_sortColumn"]
                                              .compareTo(a["$_sortColumn"]));
                                    } else {
                                      _sourceFiltered.sort((a, b) =>
                                          a["$_sortColumn"]
                                              .compareTo(b["$_sortColumn"]));
                                    }
                                    var _rangeTop = _currentPerPage! <
                                            _sourceFiltered.length
                                        ? _currentPage!
                                        : _sourceFiltered.length;
                                    _source = _sourceFiltered
                                        .getRange(0, _rangeTop)
                                        .toList();

                                    _isLoadingLocal = false;
                                  });
                                },
                                footers: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text("Rows per page"),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: DropdownButton<int>(
                                      value: _currentPerPage,
                                      items: _perPages
                                          .map((e) => DropdownMenuItem<int>(
                                                value: e,
                                                child: Text("$e"),
                                              ))
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentPerPage = value;
                                          _currentPage = 1;
                                          _resetData(start: 0);
                                        });
                                      },
                                      isExpanded: false,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                        "$_currentPage - $_currentPerPage of $_total"),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 16,
                                    ),
                                    onPressed: _currentPage == 1
                                        ? null
                                        : () {
                                            var _nextSet =
                                                _currentPage - _currentPerPage!;
                                            setState(() {
                                              _currentPage =
                                                  _nextSet > 1 ? _nextSet : 1;
                                              _resetData(
                                                  start: _currentPage - 1);
                                            });
                                          },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios,
                                        size: 16),
                                    onPressed: _currentPage +
                                                _currentPerPage! -
                                                1 >
                                            _total
                                        ? null
                                        : () {
                                            var _nextSet =
                                                _currentPage + _currentPerPage!;

                                            setState(() {
                                              _currentPage = _nextSet < _total
                                                  ? _nextSet
                                                  : _total - _currentPerPage!;
                                              _resetData(start: _nextSet - 1);
                                            });
                                          },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResponsiveDatatable(
                      headers: _headers,
                      source: _source,
                      autoHeight: true,
                      showSelect: true,
                      isLoading: loading,
                      selecteds: _selecteds,
                      expanded: _expanded,
                      onChangedRow: (value, header) {
                        _onChangedRowLocal(value, header);
                      },
                      onSelect: (value, item) {
                        setState(() {
                          if (value!) {
                            _selecteds.add(item);
                          } else {
                            _selecteds.remove(item);
                          }
                        });
                      },
                      onSort: (value) {
                        setState(() => _isLoadingLocal = true);

                        setState(() {
                          _sortColumn = value;
                          _sortAscending = !_sortAscending;
                          if (_sortAscending) {
                            _sourceFiltered.sort((a, b) =>
                                b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                          } else {
                            _sourceFiltered.sort((a, b) =>
                                a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                          }
                          var _rangeTop =
                              _currentPerPage! < _sourceFiltered.length
                                  ? _currentPage!
                                  : _sourceFiltered.length;
                          _source =
                              _sourceFiltered.getRange(0, _rangeTop).toList();

                          _isLoadingLocal = false;
                        });
                      },
                      footers: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Total: ${_source.length} registros'),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.green,
            onPressed: loading ? null : () => _saveChanges(controller),
            icon: const Icon(Icons.save, color: Colors.white),
            label: const Text('Salvar', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed:
                _selecteds.isEmpty ? null : () => _deleteSelected(controller),
            icon: const Icon(Icons.delete, color: Colors.white),
            label: const Text(
              "Excluir",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class NotificationArea extends StatefulWidget {
  const NotificationArea({super.key});
  @override
  State<NotificationArea> createState() => _NotificationAreaState();
}

class _NotificationAreaState extends State<NotificationArea> {
  late Future<List<cli.Alerta>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _fetchAdminAlerts();
  }

  Future<List<cli.Alerta>> _fetchAdminAlerts() async {
    try {
      return await client.admin.getAdminAlerts();
    } catch (e) {
      return [];
    }
  }

  Map<String, dynamic> _getStyleForAlertType(String? tipo) {
    switch (tipo) {
      case 'ESTOQUE_BAIXO':
        return {'icon': Icons.warning_amber, 'color': Colors.orange.shade800};
      case 'CALIBRACAO_VENCENDO':
        return {'icon': Icons.error_outline, 'color': Colors.yellow.shade800};
      case 'CALIBRACAO_VENCIDA':
        return {'icon': Icons.error_outline, 'color': Colors.red};
      default:
        return {'icon': Icons.info_outline, 'color': Colors.blueGrey};
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<cli.Alerta>>(
      future: _notificationsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blueGrey));
        } else if (snapshot.hasError) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 105.0),
            child: Text('Erro de Conexão: ${snapshot.error}',
                style: const TextStyle(color: Colors.red)),
          ));
        } else {
          final alerts = snapshot.data ?? [];

          if (alerts.isEmpty) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 105.0),
              child: Text('Sem notificações importantes no momento.',
                  style: TextStyle(color: Colors.black54)),
            ));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              final alerta = alerts[index];
              final style = _getStyleForAlertType(alerta.tipo);

              return Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(style['icon'] as IconData,
                      color: style['color'] as Color),
                  title: Text(alerta.titulo,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  subtitle: Text(alerta.mensagem,
                      style: const TextStyle(fontSize: 13)),
                  // Ação para o admin (ex: marcar como resolvido)
                  trailing: IconButton(
                    icon: const Icon(Icons.check_circle_outline,
                        color: Colors.green),
                    onPressed: () {
                      // TODO: Chamar endpoint client.admin.resolveAlert(alerta.id);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Alerta ${alerta.id} marcado para resolução.')));
                    },
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
