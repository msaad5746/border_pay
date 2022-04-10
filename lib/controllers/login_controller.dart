import 'package:borderpay/model/datamodels/login_model.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UserModel loginData = UserModel();

  saveLoginData(dynamic data) {
    if (data != null) {
      LoginUserModel loginModel = LoginUserModel.fromJson(data);
      if (loginModel.status) {
        loginData = loginModel.data;
        print('=>save Login data in login controller');
      }
    }
  }
}
