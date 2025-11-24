import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class UserNotificationsArea extends StatefulWidget {
  const UserNotificationsArea({super.key});

  @override
  State<UserNotificationsArea> createState() => _UserNotificationsAreaState();
}

class _UserNotificationsAreaState extends State<UserNotificationsArea> {
  late Future<List<Alerta>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = client.userData.getMyAlerts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Alerta>>(
      future: _notificationsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.blueGrey));
        }

        final alerts = snapshot.data ?? [];

        if (alerts.isEmpty || snapshot.hasError) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 105.0),
                child: Text('Sem alertas/notificações no momento',
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black38)),
              ),
            ],
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: alerts.length,
          itemBuilder: (context, index) {
            final alerta = alerts[index];
            IconData icon = Icons.info_outline;
            Color color = Colors.blueGrey;

            if (alerta.tipo == 'DEVOLUCAO_PROXIMA') {
              icon = Icons.timer_outlined;
              color = Colors.yellow;
            }

            else if (alerta.tipo == 'DEVOLUCAO_ATRASADA'){
              icon = Icons.timer_off_outlined;
              color = Colors.red;
            }

            return Card(
              elevation: 1,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(icon, color: color),
                title: Text(alerta.titulo,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                subtitle:
                    Text(alerta.mensagem, style: const TextStyle(fontSize: 13)),
              ),
            );
          },
        );
      },
    );
  }
}
