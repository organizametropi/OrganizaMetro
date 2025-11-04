import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meu Histórico: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const Row(
          children: [
            Flexible(
              child: Text(
                'Suas ultimas movimentações apareceram aqui',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        
        // Área do Histórico (Substitui o Container fixo)
        FutureBuilder<List<Movimentacao>>(
          future: _historyFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 500, // Mantém o espaçamento
                child: Center(child: CircularProgressIndicator())
              );
            } 
            
            final history = snapshot.data ?? [];
            
            if (history.isEmpty || snapshot.hasError) {
              return Container(
                constraints: const BoxConstraints(minHeight: 500.0, minWidth: 500.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: const Center(
                  child: Text('Sem movimentações no momento', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                ),
              );
            }

            // Exibe a lista de movimentações
            return Container(
              constraints: const BoxConstraints(minHeight: 500.0, minWidth: 500.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final mov = history[index];
                  final isSaida = mov.tipoMovimentacao == 'Saída';
                  final itemNome = mov.materialId != null ? 'Material' : (mov.ferramentaId != null ? 'Ferramenta' : 'Item');
                  
                  return ListTile(
                    leading: Icon(isSaida ? Icons.arrow_upward : Icons.arrow_downward, color: isSaida ? Colors.red : Colors.green),
                    title: Text('${mov.tipoMovimentacao} de ${itemNome}', style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      'Qtd: ${mov.quantidade} | Data: ${mov.dataMovimentacao.toLocal().toString().substring(0, 16)}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Text(mov.origemBaseId != null ? 'Base ${mov.origemBaseId}' : 'Veículo'),
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