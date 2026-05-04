import 'package:flutter/material.dart';

Color getTypeColor(String type) {
  if (type.contains("Fire")) return Colors.orange;
  if (type.contains("Water")) return Colors.blue;
  if (type.contains("Grass")) return Colors.green;
  if (type.contains("Electric")) return Colors.yellow.shade700;
  if (type.contains("Psychic")) return Colors.purple;
  if (type.contains("Rock")) return Colors.brown;
  if (type.contains("Ghost")) return Colors.deepPurple;
  return Colors.grey;
}