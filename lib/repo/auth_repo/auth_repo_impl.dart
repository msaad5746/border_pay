import 'dart:convert';

import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/controllers/login_controller.dart';
import 'package:borderpay/model/arguments/register_datatoserver.dart';
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
        print(response.body);
        loginController.saveLoginData(json.decode(response.body.toString()));
        storage.setBoolValue('isLogin', true);
        return json.decode(response.body.toString());
      } else {
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future registerUser(RegisterDataServer registerDataServer) async {
    try {
      var response = await networkHelper.post(
        endPoints.registerUser(),
        body: registerDataServer.toJson(),
      );
      if (response.statusCode == 201) {
        print(response.body);
        return json.decode(response.body.toString());
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      print(e.toString());
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
}
