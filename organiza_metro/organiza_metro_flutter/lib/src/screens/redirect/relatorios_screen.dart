import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/page_subtitle.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/relatorios/relatorios_parts.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart';
import 'package:responsive_table/responsive_table.dart';

// TODO: Importar fl_chart

// Componentes da Página (Colocados em um arquivo separado, ex: relatorios_parts.dart)

class relatoriosPage extends StatelessWidget { // Transformado em StatelessWidget
  const relatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RelatoriosController(),
      child: Consumer<RelatoriosController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: const MyAppBar(),
            body: SingleChildScrollView(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 PageSubtitleBar(title: 'Relatórios e Análises'),

                  const SizedBox(height: 20),
    
                  // 🚨 1. SELECTOR PRINCIPAL (Dashboard vs Gerencial)
                  MainSelector(controller: controller),
                  const SizedBox(height: 20),

                  // 🚨 2. SUB-SELECTOR (Material vs Ferramenta / Tipo de Relatório)
                  SubSelector(controller: controller),
                  const SizedBox(height: 30),

                  // 🚨 3. ÁREA DE CONTEÚDO DINÂMICO
                  if (controller.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (controller.mode == RelatorioMode.dashboard)
                    DashboardView(controller: controller)
                  else
                    RelatorioGerencialView(controller: controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}