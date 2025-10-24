import 'package:go_router/go_router.dart';
import 'package:spycatch/views/tipsList.dart';
import 'package:spycatch/views/deviceList.dart';
import 'package:spycatch/views/homepage.dart';
import 'package:spycatch/views/scan.dart';

import '../widgets/error_screen.dart';

final GoRouter appRouter = GoRouter(
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const ScanView()),
    GoRoute(
      path: '/deviceList',
      builder: (context, state) {
        final extra = state.extra as Map<String, String>?;
        final endpoint = extra?['endpoint'] ?? '/devices';
        final title = extra?['title'] ?? 'Lista de Reportes';
        return DeviceListView(endpoint: endpoint, title: title);
      },
    ),
    GoRoute(
      path: '/tipsList',
      name: 'tipsList',
      builder: (context, state) {
        print('Building TipsList route'); // Debug print
        final extra = state.extra as Map<String, String>?;
        final endpoint = extra?['endpoint'] ?? '/tips';
        final title = extra?['title'] ?? 'Lista de Tips';
        return TipsList(endpoint: endpoint, title: title);
      },
    ),
    // Define your routes here
  ],
);
