import 'package:flutter/material.dart';

class HistoryModel {
  final String name;
  final DateTime date;
  final TimeOfDay time;
  final String description;

  HistoryModel({
    required this.name,
    required this.date,
    required this.time,
    required this.description,
  });
}
