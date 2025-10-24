import 'package:flutter/material.dart';
import 'package:spycatch/router/go_router.dart';
import 'package:spycatch/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme:
          AppTheme.lightTheme, //thema personalizado y permamente en toda la app
      title: 'Flutter - UCEVA', // Usa el tema personalizado.
      routerConfig: appRouter, // Usa el router configurado
    );
  }
}
