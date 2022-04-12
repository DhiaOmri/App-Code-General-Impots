import 'package:flutter/foundation.dart';

class DataAr with ChangeNotifier {
  final int id;
  final String title;
  final String content;
  final String date;
  final int parent;
  final List category;

  DataAr(
    this.id,
    this.title,
    this.content,
    this.date,
    this.parent,
    this.category,
  );
  factory DataAr.fromMap(Map<String, dynamic> json) {
    return DataAr(
      json['id'],
      json['title']['rendered'],
      json['content']['rendered'],
      json['date'],
      json['parent'],
      json['manualdocumentationcategory'],
    );
  }
}
