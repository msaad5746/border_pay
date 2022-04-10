import 'package:borderpay/model/arguments/register_datatoserver.dart';

mixin AuthRepo {
  Future loginUser(body);

  Future registerUser(RegisterDataServer registerDataServer);

  Future getCountries();
}
