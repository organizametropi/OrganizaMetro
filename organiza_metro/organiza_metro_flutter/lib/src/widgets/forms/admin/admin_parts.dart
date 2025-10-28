

// ===========================================================================
// 1. MODAL ADICIONAR FUNCIONÁRIO
// ===========================================================================
import 'package:flutter/material.dart';

class AddEmployeeModal extends StatefulWidget {
  const AddEmployeeModal({super.key});
  @override
  State<AddEmployeeModal> createState() => _AddEmployeeModalState();
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

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      print('--- Adicionar Funcionário ---');
      print('Primeiro Nome: ${_firstNameController.text}');
      print('Nome Completo: ${_fullNameController.text}');
      print('Email: ${_emailController.text}');
      print('Telefone: ${_phoneController.text}');
      print('Registro: ${_registryController.text}');
      print('Área: ${_areaController.text}');
      print('Senha: ${_passwordController.text}');
      
      // TODO: Chamar o endpoint real do Serverpod
      // final success = await client.admin.addEmployee(...);
      await Future.delayed(const Duration(seconds: 1)); // Simula chamada de rede
      final success = true; // Simula sucesso

      setState(() => _isLoading = false);
      if (success && mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Funcionário adicionado com sucesso!')),
        );
      } else if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao adicionar funcionário.')),
        );
      }
    }
  }

  @override
  void dispose() {
    // Limpeza dos controllers
    _firstNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    // ... (restante)
    super.dispose();
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
            children: [
              TextFormField(controller: _firstNameController, decoration: const InputDecoration(labelText: 'Primeiro Nome'), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              TextFormField(controller: _fullNameController, decoration: const InputDecoration(labelText: 'Nome Completo'), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email'), keyboardType: TextInputType.emailAddress, validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              TextFormField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Telefone'), keyboardType: TextInputType.phone),
              TextFormField(controller: _registryController, decoration: const InputDecoration(labelText: 'Registro (ex: r123450)'), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              TextFormField(controller: _areaController, decoration: const InputDecoration(labelText: 'Área'), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              TextFormField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true, validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          child: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Adicionar'),
        ),
      ],
    );
  }
}

// ===========================================================================
// 2. MODAL ADICIONAR MATERIAL/FERRAMENTA
// ===========================================================================
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

  // Controllers para campos
  final _sapController = TextEditingController();
  final _descController = TextEditingController();
  // ... (outros controllers: unidadeId, tipoId, patrimonio, etc.)

  Future<void> _submit() async {
     if (_formKey.currentState!.validate()) {
       setState(() => _isLoading = true);
       print('--- Adicionar ${_selectedType == ItemType.material ? "Material" : "Ferramenta"} ---');
       print('Código SAP: ${_sapController.text}');
       print('Descrição: ${_descController.text}');
       // ... (imprimir outros campos)

       // TODO: Chamar o endpoint correto
       // if (_selectedType == ItemType.material) await client.admin.addMaterial(...);
       // else await client.admin.addTool(...);
       await Future.delayed(const Duration(seconds: 1));
       final success = true;

       setState(() => _isLoading = false);
        if (success && mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${_selectedType == ItemType.material ? "Material" : "Ferramenta"} adicionado(a) com sucesso!')),
            );
        } else if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro ao adicionar ${_selectedType == ItemType.material ? "material" : "ferramenta"}.')),
            );
        }
     }
  }
   @override
  void dispose() {
    _sapController.dispose();
    _descController.dispose();
    // ...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Material ou Ferramenta'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedButton<ItemType>(
                segments: const [
                  ButtonSegment(value: ItemType.material, label: Text('Material')),
                  ButtonSegment(value: ItemType.ferramenta, label: Text('Ferramenta')),
                ],
                selected: {_selectedType},
                onSelectionChanged: (newSelection) {
                  setState(() => _selectedType = newSelection.first);
                },
              ),
              const SizedBox(height: 15),
              TextFormField(controller: _sapController, decoration: const InputDecoration(labelText: 'Código SAP'), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              TextFormField(controller: _descController, decoration: const InputDecoration(labelText: 'Descrição'), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              // TODO: Adicionar Dropdowns para TipoMaterial e UnidadeMedida (buscando do Serverpod)
              
              // Campos Condicionais
              if (_selectedType == ItemType.material) ...[
                TextFormField(decoration: const InputDecoration(labelText: 'Quantidade Inicial'), keyboardType: TextInputType.number),
                TextFormField(decoration: const InputDecoration(labelText: 'Estoque Mínimo'), keyboardType: TextInputType.number),
              ],
              if (_selectedType == ItemType.ferramenta) ...[
                 TextFormField(decoration: const InputDecoration(labelText: 'Patrimônio (Opcional)')),
                 // TODO: Adicionar Dropdown/Radios para Tipo (Instrumento/Ferramenta) e Status Inicial
              ],
            ],
          ),
        ),
      ),
      actions: [
         TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          child: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Adicionar'),
        ),
      ],
    );
  }
}

// ===========================================================================
// 3. MODAL EDITAR MATERIAIS (Simplificado)
// ===========================================================================
class EditMaterialsModal extends StatefulWidget {
  const EditMaterialsModal({super.key});
  @override
  State<EditMaterialsModal> createState() => _EditMaterialsModalState();
}

class _EditMaterialsModalState extends State<EditMaterialsModal> {
  // TODO: Implementar busca e exibição com ResponsiveDatatable editável
  bool _isLoading = false; // Simula o estado
  List<Map<String, dynamic>> _source = []; // Dados mockados por enquanto

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Usar Scaffold dentro do Dialog.fullscreen
       appBar: AppBar(title: const Text('Editar Materiais'), actions: [
           IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop())
       ]),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : const Center(child: Text("TODO: Tabela Editável de Materiais aqui.")), // Placeholder
    );
  }
}

// ===========================================================================
// 4. MODAL EDITAR FERRAMENTAS (Simplificado)
// ===========================================================================
class EditToolsModal extends StatefulWidget {
  const EditToolsModal({super.key});
  @override
  State<EditToolsModal> createState() => _EditToolsModalState();
}

class _EditToolsModalState extends State<EditToolsModal> {
  // TODO: Implementar busca e exibição com ResponsiveDatatable editável
  bool _isLoading = false;
   List<Map<String, dynamic>> _source = [];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('Editar Ferramentas'), actions: [
          IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop())
       ]),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : const Center(child: Text("TODO: Tabela Editável de Ferramentas aqui.")), // Placeholder
    );
  }
}


// ===========================================================================
// 5. ÁREA DE NOTIFICAÇÕES
// ===========================================================================
class NotificationArea extends StatefulWidget {
  const NotificationArea({super.key});
  @override
  State<NotificationArea> createState() => _NotificationAreaState();
}

class _NotificationAreaState extends State<NotificationArea> {
  late Future<List<String>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _fetchNotifications();
  }

  Future<List<String>> _fetchNotifications() async {
    // TODO: Chamar o endpoint real do Serverpod
    // return await client.admin.getNotifications();
    await Future.delayed(const Duration(milliseconds: 500)); // Simula delay
    // Dados mockados
    return [
      "⚠️ Estoque baixo: Parafuso X (2 unidades)",
      "⏰ Calibração vencendo: Multímetro P123 (Vence em 3 dias)",
      "❌ Calibração vencida: Alicate Amperímetro A456"
    ]; 
    // return []; // Simula sem notificações
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _notificationsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar notificações: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('✅ Sem notificações importantes no momento.', style: TextStyle(color: Colors.black54)));
        } else {
          final notifications = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true, // Para caber na Column
            physics: const NeverScrollableScrollPhysics(), // Desabilita scroll da lista
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              IconData icon = Icons.info_outline;
              Color color = Colors.blueGrey;
              if (notification.contains('⚠️')) { icon = Icons.warning_amber; color = Colors.orange; }
              if (notification.contains('⏰')) { icon = Icons.timer_outlined; color = Colors.blue; }
              if (notification.contains('❌')) { icon = Icons.error_outline; color = Colors.red; }

              return Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(icon, color: color),
                  title: Text(notification, style: const TextStyle(fontSize: 14)),
                ),
              );
            },
          );
        }
      },
    );
  }
}