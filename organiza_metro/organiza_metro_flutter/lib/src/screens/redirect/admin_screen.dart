import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/controllers/admin_controller.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/admin/admin_parts.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AdminController()..fetchAllData(),
        child: Consumer<AdminController>(builder:
            (BuildContext context, AdminController value, Widget? child) {
          return Scaffold(
            appBar: const MyAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 95),
                    color: const Color.fromRGBO(0, 20, 137, 0.7),
                    child: SizedBox(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                          child: Text(
                            'Ações Administrativas',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 42,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1.5, 1.5),
                                    blurRadius: 3.0,
                                    color: Colors.black45,
                                  ),
                                  Shadow(
                                    offset: Offset(-1.0, -1.0),
                                    blurRadius: 2.0,
                                    color: Colors.black26,
                                  ),
                                ]),
                          ),
                        )
                      ],
                    )),
                  ),
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
                          childAspectRatio:
                              2.5, // Ajusta a proporção dos botões
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
                              onPressed: () =>
                                  _showAddMaterialToolModal(context),
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
                          ],
                        ),

                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 10),

                        // 2. ÁREA DE NOTIFICAÇÕES
                        const Text(
                          'Notificações Importantes 🔔',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
        }));
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
      builder: (_) => const AddMaterialToolModal(),
    );
  }

  void _showEditMaterialsModal(BuildContext context) {
    showDialog(
      context: context,
      // Ocupa mais espaço para a tabela
      builder: (_) => const Dialog.fullscreen(child: EditMaterialsModal()),
    );
  }

  void _showEditToolsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const Dialog.fullscreen(child: EditToolsModal()),
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
