

// ===========================================================================
// 1. MODAL ADICIONAR FUNCIONÁRIO
// ===========================================================================
import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class AddEmployeeModal extends StatefulWidget{
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

  // ... (dispose e _submit permanecem) ...

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Novo Funcionário'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, // Alinhar campos
            children: [
              // 🚨 Dados Básicos
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Identificação:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextFormField(controller: _firstNameController, decoration: const InputDecoration(labelText: 'Primeiro Nome', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _fullNameController, decoration: const InputDecoration(labelText: 'Nome Completo', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              const SizedBox(height: 20),

              // 🚨 Contato
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Contato e Registro:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()), keyboardType: TextInputType.emailAddress, validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Telefone', border: OutlineInputBorder(), hintText: '(XX) XXXXX-XXXX'), keyboardType: TextInputType.phone),
              const SizedBox(height: 10),
              TextFormField(
                controller: _registryController, 
                decoration: const InputDecoration(
                  labelText: 'Registro', 
                  helperText: 'Padrão: rXXXXXY (ex: r123450)',
                  border: OutlineInputBorder()
                ), 
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null
              ),
              const SizedBox(height: 10),
              TextFormField(controller: _areaController, decoration: const InputDecoration(labelText: 'Área / Departamento', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              const SizedBox(height: 20),

              // 🚨 Segurança
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Segurança:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: _passwordController, 
                decoration: const InputDecoration(labelText: 'Senha', border: OutlineInputBorder(), hintText: 'Mínimo 8 caracteres'), 
                obscureText: true, 
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: _isLoading ? null : null,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('Adicionar', style: TextStyle(color: Colors.white)),
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
  final _patrimonioController = TextEditingController(); // NOVO
  final _initialQtyController = TextEditingController(); // NOVO
  final _minStockController = TextEditingController(); // NOVO

  // Mocked Dropdown Values
  String? _selectedUnidade;
  String? _selectedTipoMaterial;
  String? _selectedToolType; // Instrumento / Ferramenta

  // Mock Data (substituir por chamadas client.admin.getUnidadeMedida())
  final List<String> _unidadeOptions = ['UN', 'CJ', 'KG', 'L'];
  final List<String> _tipoMaterialOptions = ['Consumo', 'Giro'];
  final List<String> _toolTypeOptions = ['Instrumento', 'Ferramenta'];


  Future<void> _submit() async {
     // ... (lógica de submit permanece) ...
     // Lembre-se de validar se _selectedUnidade e _selectedTipoMaterial não são nulos.
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
    return AlertDialog(
      title: const Text('Adicionar Material ou Ferramenta'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🚨 Seletor de Tipo
              SegmentedButton<ItemType>(
                segments: const [
                  ButtonSegment(value: ItemType.material, label: Text('Material')),
                  ButtonSegment(value: ItemType.ferramenta, label: Text('Ferramenta')),
                ],
                selected: {_selectedType},
                onSelectionChanged: (newSelection) {
                  setState(() => _selectedType = newSelection.first);
                },
                style: SegmentedButton.styleFrom(selectedBackgroundColor: Colors.black12),
              ),
              const SizedBox(height: 20),

              // 🚨 Campos Comuns
              TextFormField(controller: _sapController, decoration: const InputDecoration(labelText: 'Código SAP', border: OutlineInputBorder()), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _descController, decoration: const InputDecoration(labelText: 'Descrição', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
              const SizedBox(height: 20),
              
              // 🚨 Dropdown Unidade de Medida
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Unidade de Medida', border: OutlineInputBorder()),
                value: _selectedUnidade,
                items: _unidadeOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (v) => setState(() => _selectedUnidade = v),
                validator: (v) => v == null ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 20),
              
              // 🚨 Campos Condicionais
              if (_selectedType == ItemType.material) ...[
                // Material Fields
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Tipo de Material (Consumo/Giro)', border: OutlineInputBorder()),
                  value: _selectedTipoMaterial,
                  items: _tipoMaterialOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedTipoMaterial = v),
                  validator: (v) => v == null ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(controller: _initialQtyController, decoration: const InputDecoration(labelText: 'Quantidade Inicial', border: OutlineInputBorder()), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? 'Obrigatório' : null),
                const SizedBox(height: 10),
                TextFormField(controller: _minStockController, decoration: const InputDecoration(labelText: 'Estoque Mínimo', border: OutlineInputBorder()), keyboardType: TextInputType.number),
              ],
              
              if (_selectedType == ItemType.ferramenta) ...[
                // Ferramenta Fields
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Tipo do Ativo', border: OutlineInputBorder()),
                  value: _selectedToolType,
                  items: _toolTypeOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedToolType = v),
                  validator: (v) => v == null ? 'Obrigatório' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(controller: _patrimonioController, decoration: const InputDecoration(labelText: 'Patrimônio', border: OutlineInputBorder())),
                // TODO: Adicionar campos de data de aquisição/calibração inicial
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: _isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('Adicionar', style: TextStyle(color: Colors.white)),
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
  // O futuro agora espera uma lista de objetos Alerta
  late Future<List<Alerta>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _fetchAdminAlerts();
  }
  
  // 🚨 Função que chama o endpoint ADMIN
  Future<List<Alerta>> _fetchAdminAlerts() async {
    try {
      // 🚨 Chamada ao endpoint restrito
      return await client.admin.getAdminAlerts();
    } catch (e) {
      // Se houver erro de acesso (ex: não é admin)
      print('Erro ao buscar alertas do Admin: $e');
      return []; 
    }
  }

  // Mapeia o tipo do alerta para um ícone/cor
  Map<String, dynamic> _getStyleForAlertType(String? tipo) {
    switch (tipo) {
      case 'ESTOQUE_BAIXO':
        return {'icon': Icons.warning_amber, 'color': Colors.orange.shade800};
      case 'DEVOLUCAO_PROXIMA':
        return {'icon': Icons.timer_outlined, 'color': Colors.blue.shade700};
      case 'CALIBRACAO_VENCENDO':
      case 'CALIBRACAO_VENCIDA':
        return {'icon': Icons.error_outline, 'color': Colors.red};
      default:
        return {'icon': Icons.info_outline, 'color': Colors.blueGrey};
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Alerta>>(
      future: _notificationsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Exibe erro de rede/servidor de forma clara
          return Center(child: Text('Erro de Conexão: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
        } else {
          final alerts = snapshot.data ?? [];
          
          if (alerts.isEmpty) {
            return const Center(child: Text('Sem notificações importantes no momento.', style: TextStyle(color: Colors.black54)));
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
                  leading: Icon(style['icon'] as IconData, color: style['color'] as Color),
                  title: Text(alerta.titulo ?? 'Alerta Geral', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  subtitle: Text(alerta.mensagem, style: const TextStyle(fontSize: 13)),
                  // Ação para o admin (ex: marcar como resolvido)
                  trailing: IconButton(
                    icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                    onPressed: () {
                      // TODO: Chamar endpoint client.admin.resolveAlert(alerta.id);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alerta ${alerta.id} marcado para resolução.')));
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