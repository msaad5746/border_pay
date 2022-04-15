import 'package:borderpay/model/arguments/register_datatoserver.dart';
import 'package:borderpay/model/datamodels/verify_user_model.dart';

mixin AuthRepo {
  Future loginUser(body);

  Future registerUser(RegisterDataServer registerDataServer);

  Future verifyUser(VerifyUserModel user);

  Future changePassword(body, int userId);

  Future updateUserDetails(int userId, body);

  Future getUserDetails(int userId);

  Future deleteUserAccount(int userId);

  Future getCountries();
}
