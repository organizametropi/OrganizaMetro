import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart';
import 'package:intl/intl.dart';

class ConsumoLineChart extends StatelessWidget {
  const ConsumoLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RelatoriosController>(context);
    final dados = controller.consumoPeriodoDetalhado;

    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (dados.isEmpty) {
      return const Center(child: Text('Nenhum consumo registrado no período selecionado.'));
    }

    // 1. Mapeamento de Dados para FlSpot (Três Séries)
    final List<FlSpot> spotsMaterial = [];
    final List<FlSpot> spotsFerramenta = [];
    final List<FlSpot> spotsTotal = [];
    
    double maxTotal = 0;

    for (int i = 0; i < dados.length; i++) {
      final item = dados[i];
      final total = item.totalMaterial + item.totalFerramenta;
      
      spotsMaterial.add(FlSpot(i.toDouble(), item.totalMaterial));
      spotsFerramenta.add(FlSpot(i.toDouble(), item.totalFerramenta));
      spotsTotal.add(FlSpot(i.toDouble(), total));
      
      if (total > maxTotal) maxTotal = total;
    }

    // Encontra o valor máximo para dimensionar o eixo Y
    final maxY = maxTotal * 1.1; 

    // Função para exibir as datas (eixo X)
    Widget getBottomTitle(double value, TitleMeta meta) {
      final index = value.toInt();
      if (index >= 0 && index < dados.length) {
        final date = dados[index].data;
        return SideTitleWidget(
          meta: meta,
          space: 4.0,
          child: Text(DateFormat('dd/MM').format(date), style: const TextStyle(fontSize: 10)),
        );
      }
      return const SizedBox.shrink();
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🚨 Legenda Multi-Linha
        Center(child: _buildLegend()),
        const SizedBox(height: 10),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 16.0),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  
                  // Eixo X (Datas)
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 60,
                      interval: 1.0, 
                      getTitlesWidget: (value, meta) => getBottomTitle(value, meta),
                    ),
                  ),
                  
                  // Eixo Y (Quantidade)
                  leftTitles: AxisTitles(
                    axisNameWidget: const Text('Qtd. Consumida', style: TextStyle(fontWeight: FontWeight.bold)),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: (maxY / 4).ceilToDouble(),
                      getTitlesWidget: (value, meta) => Text(value.toStringAsFixed(0), style: const TextStyle(fontSize: 10)),
                    ),
                  ),
                ),
                
                borderData: FlBorderData(show: true, border: Border.all(color: Colors.black12)),
                
                minX: 0,
                maxX: (dados.length - 1).toDouble(),
                minY: 0,
                maxY: maxY,
                
                // 🚨 As Três Séries de Dados
                lineBarsData: [
                  // SÉRIE 1: Total Geral (Mais grossa e escura)
                  LineChartBarData(
                    spots: spotsTotal,
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                  ),
                  // SÉRIE 2: Material (Linha pontilhada)
                  LineChartBarData(
                    spots: spotsMaterial,
                    isCurved: true,
                    color: Colors.orange.shade700,
                    barWidth: 2,
                    dashArray: [10, 5], // Linha pontilhada
                    dotData: const FlDotData(show: false),
                  ),
                  // SÉRIE 3: Ferramenta (Linha pontilhada)
                  LineChartBarData(
                    spots: spotsFerramenta,
                    isCurved: true,
                    color: Colors.green.shade700,
                    barWidth: 2,
                    dashArray: [10, 5], // Linha pontilhada
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  // 🚨 Widget de Legenda para Múltiplas Linhas
  Widget _buildLegend() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Indicator(color: Colors.red, text: 'Total Consumido', isSquare: true),
                SizedBox(width: 20),
                Indicator(color: Colors.orange, text: 'Material', isSquare: true),
                SizedBox(width: 20),
                Indicator(color: Colors.green, text: 'Ferramenta', isSquare: true),
            ],
        ),
      );
  }
}

// 🚨 Lembre-se de incluir a classe Indicator se ela não estiver no arquivo
class Indicator extends StatelessWidget {
    final Color color;
    final String text;
    final bool isSquare;
    const Indicator({required this.color, required this.text, this.isSquare = false, super.key});
    @override
    Widget build(BuildContext context) {
        return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                  Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                  ),
                  const SizedBox(width: 4),
                 Text(text, style: const TextStyle(fontSize: 12)),
              ],
          );
    }
}