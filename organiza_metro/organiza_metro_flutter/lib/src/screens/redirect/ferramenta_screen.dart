import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/page_subtitle.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/ferramentas_instrumentos/ferramentas_parts.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/controllers/ferramenta_controller.dart';

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
                 PageSubtitleBar(title: 'Gestão de Ferramentas e Instrumentos'),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                   
                        ModeSelector(controller: controller),
                        const SizedBox(height: 20),

                
                        if (controller.isLoading)
                          SizedBox(height: 700, child: const Center(child: CircularProgressIndicator(color: Colors.blueGrey)))
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
