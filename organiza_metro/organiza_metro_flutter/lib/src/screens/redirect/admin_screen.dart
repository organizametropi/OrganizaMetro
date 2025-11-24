import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/page_subtitle.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/admin/admin_parts.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageSubtitleBar(title: 'Painel Administrativo'),
            
            const SizedBox(height: 20),

            // 1. GRID DE BOTÕES DE AÇÃO
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    crossAxisCount: 2, // 2 botões por linha
                    shrinkWrap:
                        true, // Para caber dentro do SingleChildScrollView
                    physics:
                        const NeverScrollableScrollPhysics(), // Desabilita scroll do Grid
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5, // Ajusta a proporção dos botões
                    children: [
                      _AdminActionButton(
                        icon: Icons.person_add,
                        label: 'Adicionar Funcionário',
                        color: Colors.blue,
                        onPressed: () => _showAddEmployeeModal(context),
                      ),
                      _AdminActionButton(
                        icon: Icons.add_box,
                        label: 'Adicionar Material/Ferramenta',
                        color: Colors.green,
                        onPressed: () => _showAddMaterialToolModal(context),
                      ),
                      _AdminActionButton(
                        icon: Icons.edit_note,
                        label: 'Editar Materiais',
                        color: Colors.orange,
                        onPressed: () => _showEditMaterialsModal(context),
                      ),
                      _AdminActionButton(
                        icon: Icons.build_circle,
                        label: 'Editar Ferramentas',
                        color: Colors.purple,
                        onPressed: () => _showEditToolsModal(context),
                      ),
                      _AdminActionButton(
                        icon: Icons.tune,
                        label: 'Adicionar Calibrações',
                        color: Colors.teal,
                        onPressed: () => _showCalibrationsModal(context),
                      ),
                      _AdminActionButton(
                        icon: Icons.group,
                        label: 'Gerenciar Funcionários',
                        color: Colors.indigo,
                        onPressed: () => _showManageEmployeesModal(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  // 2. ÁREA DE NOTIFICAÇÕES
                  const Text(
                    'Notificações Importantes 🔔',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const NotificationArea(),
                ],
              ),
            ), // Widget que busca e exibe notificações
          ],
        ),
      ),
    );
  }

  // --- Funções para abrir os Modais ---
  void _showAddEmployeeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AddEmployeeModal(),
    );
  }

  void _showAddMaterialToolModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SingleChildScrollView(child: const AddMaterialToolModal()),
    );
  }

  void _showEditMaterialsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Dialog.fullscreen(
        child: EditMaterialsModal(),
      ),
    );
  }

  void _showEditToolsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const Dialog.fullscreen(child: EditToolsModal()),
    );
  }

  void _showCalibrationsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const ManageCalibrationsModal(),
    );
  }

  void _showManageEmployeesModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const ManageEmployeesModal(),
    );
  }
}

// ===========================================================================
// WIDGET AUXILIAR PARA BOTÕES
// ===========================================================================
class _AdminActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _AdminActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
