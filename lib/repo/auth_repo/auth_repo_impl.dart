import 'dart:convert';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/controllers/login_controller.dart';
import 'package:borderpay/model/arguments/register_datatoserver.dart';
import 'package:borderpay/model/datamodels/login_model.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/model/datamodels/verify_user_model.dart';
import 'package:borderpay/response/register_response.dart';
import 'package:borderpay/services/network/network_endpoints.dart';
import 'package:borderpay/services/network/network_helper.dart';
import 'package:borderpay/services/network/network_helper_impl.dart';
import 'package:get/get.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  NetworkHelper networkHelper = NetworkHelperImpl();
  EndPoints endPoints = EndPoints();
  MySharedPreferences storage = MySharedPreferences.instance;
  LoginController loginController = Get.put(
    LoginController(),
    permanent: true,
  );

  @override
  Future loginUser(body) async {
    try {
      var response = await networkHelper.post(
        endPoints.logInUser(),
        body: body,
      );
      if (response.statusCode == 200) {
        loginController.saveLoginData(json.decode(response.body.toString()));
        storage.setStringValue(SharedPrefKeys.user, response.body.toString());
        storage.setBoolValue(SharedPrefKeys.isLogin, true);
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<RegisterResponse> registerUser(
      RegisterDataServer registerDataServer) async {
    RegisterResponse registerResponse = RegisterResponse.emptyObj();
    try {
      var response = await networkHelper.post(
        endPoints.registerUser(),
        body: registerDataServer.toJson(),
      );
      registerResponse = RegisterResponse.fromJson(
        jsonDecode(
          response.body.toString(),
        ),
        response.statusCode,
      );
      return registerResponse;
    } catch (e) {
      registerResponse.statusMsg = e.toString();
      return registerResponse;
    }
  }

  @override
  Future verifyUser(VerifyUserModel verifyUserModel) async {
    try {
      var response = await networkHelper.put(
        endPoints.verifyUser(),
        body: verifyUserModel.toJson(),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future changePassword(body, int userId) async {
    try {
      var response = await networkHelper.put(
        endPoints.changePassword(userId),
        body: body,
      );
      if (response.statusCode == 201) {
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future getCountries() async {
    try {
      var response = await networkHelper.get(
        endPoints.getCountries(),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future deleteUserAccount(int userId) async {
    try {
      var response = await networkHelper.get(
        endPoints.getCountries(),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future updateUserDetails(int userId, body) async {
    try {
      var response = await networkHelper.put(
        endPoints.updateUserDetails(userId),
        body: body,
      );
      if (response.statusCode == 201) {
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future getUserDetails(int userId) async {
    try {
      var response = await networkHelper.get(
        endPoints.updateUserDetails(userId),
      );
      if (response.statusCode == 201) {
        loginController.saveLoginData(json.decode(response.body.toString()));
        LoginUserModel loginModel =
            LoginUserModel.fromJson(json.decode(response.body.toString()));
        storage.setStringValue(SharedPrefKeys.user, response.body.toString());
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
