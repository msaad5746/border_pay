

mixin LocaleRepo {
  Future saveLocale({required String locale});

  String getLocale();
}