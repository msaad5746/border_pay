import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/di/di.dart';
import 'package:borderpay/repo/locale_repo/locale_repo.dart';
import 'package:borderpay/repo/locale_repo/locale_repo_impl.dart';

Future initializeRepoDependencies() async {
  MySharedPreferences sharedPreferences = MySharedPreferences.instance;

  it.registerLazySingleton<LocaleRepo>(
    () => LocaleRepoImpl(
      sharedPreferences: sharedPreferences,
    ),
  );
}
