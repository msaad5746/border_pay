

import 'package:borderpay/di/repo_init.dart';
import 'package:get_it/get_it.dart';

GetIt it = GetIt.instance;

Future initializeDependencies()async{
  await initializeRepoDependencies();
}
