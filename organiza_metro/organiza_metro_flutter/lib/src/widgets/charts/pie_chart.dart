import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart';

// 🚨 WIDGET AUXILIAR PARA A LEGENDA
class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;

  const Indicator({
    super.key,
    required this.color,
    required this.text,
    this.isSquare = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: isSquare ? 16 : 10,
          height: isSquare ? 16 : 10,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class ConsumoPieChart extends StatelessWidget {
  const ConsumoPieChart({super.key});

  // Cores personalizadas para as seções
  static const List<Color> sectionColors = [
    Color(0xFF42A5F5), // Azul (Tucuruvi)
    Color(0xFFEF5350), // Vermelho (Tiradentes)
    Color(0xFFFFB74D), // Laranja
    Color(0xFF66BB6A), // Verde
    Color(0xFFAB47BC), // Roxo
  ];

  // 🚨 Variável de estado local para rastrear o toque
  static int _touchedIndex = -1;

  // 🚨 Mapeamento de ConsumoMensal para PieChartSectionData
  List<PieChartSectionData> _mapDataToSections(
      List<ConsumoMensal> consumo, double totalSum) {
    return consumo.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isTouched = index == _touchedIndex;

      final fontSize = isTouched ? 16.0 : 12.0;
      final radius = isTouched ? 110.0 : 100.0;
      final color = sectionColors[index % sectionColors.length];

      // Calcula a porcentagem
      final percentage = (item.total / totalSum) * 100;
      final titleText = percentage > 5
          ? '${percentage.toStringAsFixed(1)}%'
          : ''; // Oculta % pequenos

      return PieChartSectionData(
        color: color,
        value: item.total, // O valor é a quantidade total
        title: titleText,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [const Shadow(color: Colors.black, blurRadius: 2)],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // 🚨 Acessa o Controller e os dados
    final controller = Provider.of<RelatoriosController>(context);
    final consumo = controller.consumoPorBase; // Ou consumoPorVeiculo no futuro

    if (controller.isLoading) {
      return const Center(
          child: SizedBox(height: 50, child: CircularProgressIndicator()));
    }

    if (consumo.isEmpty) {
      return const Center(
          child: Text('Sem dados de consumo por Base/Veículo para exibir.'));
    }

    // Calcula a soma total para porcentagens e raio central
    final totalSum = consumo.fold(0.0, (sum, item) => sum + item.total);
    final sections = _mapDataToSections(consumo, totalSum);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 220,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (event is FlTapUpEvent) {
                      if (pieTouchResponse != null &&
                          pieTouchResponse.touchedSection != null) {
                        _touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                        controller.notifyListeners();
                      } else {
                        _touchedIndex = -1;
                        controller.notifyListeners();
                      }
                    }
                  },
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 2,
                centerSpaceRadius: 15,
                sections: sections,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // ✅ LEGENDAS DINÂMICAS — sem height fixo, cresce conforme o conteúdo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: consumo.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final color = sectionColors[index % sectionColors.length];
                final percentage = (item.total / totalSum) * 100;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Indicator(
                    color: color,
                    text: '${item.nome} (${percentage.toStringAsFixed(1)}%)',
                    isSquare: true,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
