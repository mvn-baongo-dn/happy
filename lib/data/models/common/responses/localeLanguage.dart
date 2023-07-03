import 'package:flutter/material.dart';

class LocaleLanguage {
  LocaleLanguage({
    required this.id,
    required this.name,
    required this.locale,
  });
  int id;
  String name;
  Locale locale;
}

List<LocaleLanguage> localeLanguages = [
  LocaleLanguage(id: 1, name: 'Việt Nam', locale: Locale('vi')),
  LocaleLanguage(id: 2, name: 'Nhật Bản', locale: Locale('ja')),
  LocaleLanguage(id: 3, name: 'English', locale: Locale('es')),
];
