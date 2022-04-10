import 'dart:convert';

import 'package:borderpay/model/datamodels/countries_data_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:get/get.dart';

class CountriesController extends GetxController {
  List<CountryDetails> countries = List.empty(growable: true);

  AuthRepo networkHandler = AuthRepoImpl();

  @override
  void onInit() {
    // fetchCountries();
    super.onInit();
  }

  Future<bool> fetchCountries() async {
    var res = await networkHandler.getCountries();
    countries.clear();
    if (res != null) {
      res['data'].forEach((element) {
        countries.add(CountryDetails.fromJson(element));
      });
    }
    return countries.isNotEmpty;
  }
}
