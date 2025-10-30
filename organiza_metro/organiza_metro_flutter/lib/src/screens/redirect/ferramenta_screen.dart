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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            'Gestão de Instrumentos e Ferramentas 🛠️',
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
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
