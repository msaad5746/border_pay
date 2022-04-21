import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';

import 'locale_repo.dart';

class LocaleRepoImpl implements LocaleRepo {
  LocaleRepoImpl({required this.sharedPreferences});

  final MySharedPreferences sharedPreferences;

  @override
  String getLocale() {
    return sharedPreferences.getStringValue(
      SharedPrefKeys.locale,
    );
  }

  @override
  Future saveLocale({required String locale}) async {
    return sharedPreferences.setStringValue(
      SharedPrefKeys.locale,
      locale,
    );
  }
}
