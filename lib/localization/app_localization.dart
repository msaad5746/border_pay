import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'locale_constants.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  Map<String, String> _localizedStrings = Map();

  Future<bool> load() async {
    if (locale == null) {
      return false;
    }
    final String data = await rootBundle.loadString(supportedLocaleMap[locale]);
    final Map<String, dynamic> jsonMap = json.decode(data);

    _localizedStrings = jsonMap.map((String key, dynamic value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(dynamic key, {String param1 = "", String param2 = ""}) {
    String translation = _localizedStrings[key] ?? key;

    if (param1.isNotEmpty) {
      translation = translation.replaceAll('{param1}', param1);
      if (param2.isNotEmpty) {
        translation = translation.replaceAll('{param2}', param2);
      }
    }
    return translation;
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportLanguageCode.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
