import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class UserHistoryWidget extends StatefulWidget {
  const UserHistoryWidget({super.key});

  @override
  State<UserHistoryWidget> createState() => _UserHistoryWidgetState();
}

class _UserHistoryWidgetState extends State<UserHistoryWidget> {
  late Future<List<Movimentacao>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = client.userData.getMyHistory();
  }

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Atividade recente',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        const SizedBox(height: 6),
        const Text(
          'Últimas movimentações da sua conta. Clique em um item para ver mais detalhes.',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        const SizedBox(height: 14),
        FutureBuilder<List<Movimentacao>>(
          future: _historyFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                  height: 320, // Mantém o espaçamento razoável
                  child: Center(
                      child:
                          CircularProgressIndicator(color: Colors.blueGrey)));
            }

            final history = snapshot.data ?? [];

            if (snapshot.hasError) {
              return Container(
                constraints: const BoxConstraints(minHeight: 200.0),
                padding: const EdgeInsets.all(16),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Text('Erro ao carregar histórico: ${snapshot.error}'),
              );
            }

            if (history.isEmpty) {
              return Container(
                constraints: const BoxConstraints(minHeight: 200.0),
                padding: const EdgeInsets.all(16),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Text('Sem movimentações no momento',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                ),
              );
            }

            return Container(
              constraints: const BoxConstraints(minHeight: 200.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: history.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final mov = history[index];
                  final isSaida =
                      mov.tipoMovimentacao.toLowerCase() == 'saída' ||
                          mov.tipoMovimentacao.toLowerCase() == 'saida';

                  final itemDescricao = mov.material?.descricao ??
                      mov.ferramenta?.descricao ??
                      (mov.materialId != null
                          ? 'Material #${mov.materialId}'
                          : mov.ferramentaId != null
                              ? 'Ferramenta #${mov.ferramentaId}'
                              : 'Item');

                  final origem = mov.origemBase?.nome ??
                      (mov.origemBaseId != null
                          ? 'Base ${mov.origemBase?.nome}'
                          : (mov.origemVeiculo?.descricao ??
                              (mov.origemVeiculoId != null
                                  ? 'Veículo ${mov.origemVeiculo?.codigo}'
                                  : '—')));
                  final destino = mov.destinoBase?.nome ??
                      (mov.destinoBaseId != null
                          ? 'Base ${mov.destinoBase?.nome}'
                          : (mov.destinoVeiculo?.descricao ??
                              (mov.destinoVeiculoId != null
                                  ? 'Veículo ${mov.destinoVeiculo?.codigo}'
                                  : '—')));

                  final dateText = mov.dataMovimentacao != null
                      ? df.format(mov.dataMovimentacao!.toLocal())
                      : (mov.dataRequisicao != null
                          ? df.format(mov.dataRequisicao!.toLocal())
                          : '—');

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          backgroundColor: isSaida
                              ? Colors.red.shade100
                              : Colors.green.shade100,
                          child: Icon(
                              isSaida
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: isSaida ? Colors.red : Colors.green,
                              size: 18),
                        ),
                        title: Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              '${mov.tipoMovimentacao} — $itemDescricao',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Chip(
                              label: Text(
                                mov.quantidade != null
                                    ? (mov.quantidade! % 1 == 0
                                        ? mov.quantidade!.toInt().toString()
                                        : mov.quantidade!.toStringAsFixed(2))
                                    : '-',
                              ),
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ],
                        ),
                        subtitle: Wrap(
                          direction: Axis.vertical, 
                          spacing: 6,
                          runSpacing: 4,
                          children: [
                            Text(dateText,
                                style: const TextStyle(fontSize: 12)),
                            Text('Origem: $origem',
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Destino: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Text(destino),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (mov.modalidadeEntrega != null)
                                  Row(children: [
                                    const Text('Modalidade: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Text(mov.modalidadeEntrega!)
                                  ]),
                                if (mov.observacao != null &&
                                    mov.observacao!.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  const Text('Observação:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 4),
                                  Text(mov.observacao!),
                                ],
                                const SizedBox(height: 8),
                                Text('ID: ${mov.id ?? '-'}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black54)),
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
          },
        ),
      ],
    );
  }
}
