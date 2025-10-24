import 'package:flutter/material.dart';
import 'package:spycatch/widgets/custom_drawer.dart';
import 'package:go_router/go_router.dart';

class ScanView extends StatelessWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear Dispositivos')),
      drawer: CustomDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go(
              '/deviceList',
              extra: {'endpoint': '/devices', 'title': 'Lista de Reportes'},
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(40),
          ),
          child: const Icon(
            Icons.wifi,
            size: 40,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
