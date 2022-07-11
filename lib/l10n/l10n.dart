import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('tr'),
    const Locale('en'),
    const Locale('ta'),
    const Locale('zh'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'ta':
        return 'Çok yakında';
      case 'zh':
        return 'Çok Yakında';
      default:
        return 'Türkçe';
    }
  }
}
