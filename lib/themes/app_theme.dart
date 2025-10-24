import 'package:flutter/material.dart';

class AppTheme {
  //! tema claro
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 17, 2, 35), // Color semilla
        brightness: Brightness.light, // Tema oscuro
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Color del AppBar
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0), // Texto blanco para el AppBar
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 235, 216, 235), // Fondo del Drawer
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87), // Estilo de texto
        bodyMedium: TextStyle(color: Colors.black87),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(
            255,
            255,
            255,
            255,
          ), // Color de fondo del botón elevado
          foregroundColor: const Color.fromARGB(
            255,
            0,
            0,
            0,
          ), // Color del texto del botón
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bordes redondeados
          ),
          shadowColor: const Color.fromARGB(
            255,
            13,
            12,
            12,
          ), // Color de la sombra
          elevation: 8, // Elevación del botón
        ),
      ),
    );
  }
}
