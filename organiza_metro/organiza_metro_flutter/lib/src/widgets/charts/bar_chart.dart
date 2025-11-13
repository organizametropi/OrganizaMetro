import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart'; // Importar Controller

class ConsumoBarChart extends StatelessWidget {
  const ConsumoBarChart({super.key});

  // Mapeamento de cores para as barras
  static const List<Color> barColors = [
    Color(0xFFEF5350),
    Color(0xFFFF9800),
    Color(0xFFFFEE58),
    Color(0xFF66BB6A),
    Color(0xFF26C6DA),
    Color(0xFF42A5F5),
    Color(0xFF90A4AE),
    Color(0xFF7E57C2),
    Color(0xFFD4E157),
    Color(0xFFAB47BC),
  ];

  // 🚨 1. Função para Mapear ConsumoMensal para BarChartGroupData
  List<BarChartGroupData> _mapConsumoToBarData(List<ConsumoMensal> consumo) {
    return consumo.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            // 🚨 CORRIGIDO: Usando o campo 'totalConsumido'
            toY: item.total,
            color: barColors[index % barColors.length],
            width: 20,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
            ),
          ),
        ],
      );
    }).toList();
  }

  // 🚨 2. Função para Títulos Inferiores (Recebe o valor e o metadado)
  Widget _getBottomTitles(
      double value, TitleMeta meta, List<ConsumoMensal> consumo) {
    const style = TextStyle(fontSize: 10, color: Colors.black);

    // O valor do 'value' é o índice (0.0, 1.0, 2.0...)
    final int index = value.toInt();

    if (index < consumo.length) {
      // 🚨 CORRIGIDO: Usando o campo 'materialDescricao'
      final String label = consumo[index].nome;

      return SideTitleWidget(
        meta: meta,
        space: 4,
        child: Text(
          label.length > 15 ? '${label.substring(0, 15)}...' : label,
          style: style,
          textAlign: TextAlign.right,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RelatoriosController>(context);
    final consumo = controller.itemType == ItemType.material ? controller.topConsumidosMaterial : controller.topConsumidosFerramenta;

    if (controller.isLoading) {
      return const Center(
          child: SizedBox(height: 50, child: CircularProgressIndicator()));
    }

    if (consumo.isEmpty) {
      return const Center(
          child: Text('Nenhum dado de consumo encontrado no último mês.'));
    }

    final barData = _mapConsumoToBarData(consumo);

    // 🚨 CORRIGIDO: Usando o campo 'totalConsumido' para cálculo do maxY
    final maxY = consumo.fold(
        0.0, (prev, element) => element.total > prev ? element.total : prev);

    return BarChart(
      BarChartData(
        barGroups: barData,
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY * 1.1,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 80,
              // 🚨 PASSANDO METADATA: A função de título agora aceita os 3 argumentos
              getTitlesWidget: (value, meta) =>
                  _getBottomTitles(value, meta, consumo),
            ),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: const Text('Total Consumido',
                style: TextStyle(fontWeight: FontWeight.bold)),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: maxY > 50 ? (maxY / 5).ceilToDouble() : 10,
              getTitlesWidget: (value, meta) {
                if (value == 0) return const Text('');
                return Text(value.toStringAsFixed(0),
                    style: const TextStyle(fontSize: 10));
              },
            ),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Color(0xFFE0E0E0),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black, width: 1),
            left: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        barTouchData: BarTouchData(enabled: false),
      ),
    );
  }
}

