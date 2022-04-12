import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
  String get labelUrl;
  String get labelInfo;
  String get labelSelectLanguage;
  String get documents;
  String get research;
}
