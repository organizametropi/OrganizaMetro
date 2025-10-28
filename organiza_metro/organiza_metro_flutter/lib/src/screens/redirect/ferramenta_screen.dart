import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/ferramentas_instrumentos/ferramentas_parts.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/controllers/ferramenta_controller.dart';
import 'package:responsive_table/responsive_table.dart';



class FerramentaPage extends StatelessWidget {
  const FerramentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FerramentaController()..fetchData(),
      child: Consumer<FerramentaController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: const MyAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Gestão de Instrumentos e Ferramentas 🛠️',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 20),

                  // 1. SELEÇÃO DE MODO (RETIRAR / DEVOLVER)
                  ModeSelector(controller: controller),
                  const SizedBox(height: 20),

                  // 2. CONTEÚDO PRINCIPAL
                  if (controller.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (controller.mode == FerramentaMode.retirar)
                    RetiradaView(controller: controller)
                  else
                    DevolucaoView(controller: controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
