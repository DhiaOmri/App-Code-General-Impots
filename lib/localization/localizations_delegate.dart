import 'package:code_general_impots/localization/language/language_fr.dart';
import 'package:flutter/material.dart';
import 'package:code_general_impots/localization/language/language_ar.dart';

import 'language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['fr', 'ar'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'fr':
        return LanguageFR();
      case 'ar':
        return LanguageAr();
      default:
        return LanguageFR();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
