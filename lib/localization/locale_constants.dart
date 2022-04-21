import 'dart:ui';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/repo/locale_repo/locale_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization.dart';

const Iterable<LocalizationsDelegate<dynamic>> localizationDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const supportLanguageCode = ['en', 'ar'];

Map supportedLocaleMap = {
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ): 'assets/locale/lang_en.json',
  const Locale.fromSubtags(
    languageCode: 'ar',
  ): 'assets/locale/lang_ar.json',
};

List<Locale> supportedLocale = [
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ),
  const Locale.fromSubtags(
    languageCode: 'ar',
  ),
];

Locale? getSelectedLang(Locale? locale, Iterable<Locale> supportedLocales) {
  try {
    int selectedLang = MySharedPreferences.instance.getIntValue(
      SharedPrefKeys.selectedLanguage,
    );
    return supportedLocale[selectedLang];
  } catch (e) {
    return supportedLocale[0];
  }
}
