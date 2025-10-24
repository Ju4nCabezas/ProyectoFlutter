import 'dart:math';
import 'package:flutter/material.dart';

class Reportes {
  final String id_reporte;
  final String id_usuario;
  final Point<double>? ubicacion;
  final DateTime fecha;
  final TimeOfDay hora;
  final String comentario;

  Reportes({
    required this.id_reporte,
    required this.id_usuario,
    required this.ubicacion,
    required this.fecha,
    required this.hora,
    required this.comentario,
  });

  factory Reportes.fromJson(Map<String, dynamic> json) {
    // Extraer punto si viene como texto "(lat, long)"
    Point<double>? parsedPoint;
    if (json['Ubicacion'] != null && json['Ubicacion'] is String) {
      final match = RegExp(
        r'\(?\s*([-\d.]+)\s*,\s*([-\d.]+)\s*\)?',
      ).firstMatch(json['Ubicacion']);
      if (match != null) {
        parsedPoint = Point<double>(
          double.tryParse(match.group(1) ?? '0') ?? 0.0,
          double.tryParse(match.group(2) ?? '0') ?? 0.0,
        );
      }
    }

    // Parsear hora ("12:45:00")
    TimeOfDay parsedTime = const TimeOfDay(hour: 0, minute: 0);
    if (json['Hora'] != null) {
      final parts = json['Hora'].split(':');
      if (parts.length >= 2) {
        parsedTime = TimeOfDay(
          hour: int.tryParse(parts[0]) ?? 0,
          minute: int.tryParse(parts[1]) ?? 0,
        );
      }
    }

    return Reportes(
      id_reporte: json['ID_Reporte'] ?? '',
      id_usuario: json['ID_Usuario'] ?? '',
      ubicacion: parsedPoint,
      fecha: DateTime.tryParse(json['Fecha'] ?? '') ?? DateTime.now(),
      hora: parsedTime,
      comentario: json['Comentario'] ?? '',
    );
  }
}
