// this class is used for localizations
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLocalizations {
  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String getString(String key) => language[key];
  
  List<String> getList(String key) {
    final List<String> items = new List<String>();
    if (language[key] is List) {
      items.addAll(List<String>.from(language[key].whereType<String>()));
    }  
    return items;
  }

  dynamic getMap(String key) {
    return language[key];
  }
}

Map<String, dynamic> language;

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) async {
    String string = await rootBundle.loadString("strings/${locale.languageCode}.json");
    language = json.decode(string);
    return SynchronousFuture<MyLocalizations>(MyLocalizations());
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}