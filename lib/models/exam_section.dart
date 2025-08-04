import 'package:flutter/cupertino.dart';

class ExamSection {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  const ExamSection({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });
}
