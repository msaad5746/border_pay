// To parse this JSON data, do
//
//     final countriesDataModel = countriesDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CountriesDataModel countriesDataModelFromJson(String str) => CountriesDataModel.fromJson(json.decode(str));

String countriesDataModelToJson(CountriesDataModel data) => json.encode(data.toJson());

class CountriesDataModel {
  CountriesDataModel({
    required this.status,
    required this.response,
  });

  bool status;
  Response? response;

  factory CountriesDataModel.fromJson(Map<String, dynamic> json) => CountriesDataModel(
    status: json["status"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response": response!.toJson(),
  };
}

class Response {
  Response({
    required this.message,
    required this.detail,
  });

  String message;
  CountryDetail detail;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    message: json["message"],
    detail: CountryDetail.fromJson(json["detail"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "detail": detail.toJson(),
  };
}

class CountryDetail {
  CountryDetail({
    required this.country,
  });

  List<CountryDetails> country;

  factory CountryDetail.fromJson(Map<String, dynamic> json) => CountryDetail(
    country: List<CountryDetails>.from(json["data"].map((x) => CountryDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(country.map((x) => x.toJson())),
  };
}

class CountryDetails {
  CountryDetails({
    required this.flag,
    required this.id,
    required this.iso,
    required this.name,
    required this.nicename,
    required this.iso3,
    required this.numcode,
    required this.phonecode,
  });

  String flag;
  int id;
  String iso;
  String name;
  String nicename;
  dynamic iso3;
  dynamic numcode;
  String phonecode;

  factory CountryDetails.fromJson(Map<String, dynamic> json) => CountryDetails(
    flag: json["flag"],
    id: json["id"],
    iso: json["iso"],
    name: json["name"],
    nicename: json["nicename"],
    iso3: json["iso3"] == null ? null : json["iso3"],
    numcode: json["numcode"] == null ? null : json["numcode"],
    phonecode: json["phonecode"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "id": id,
    "iso": iso,
    "name": name,
    "nicename": nicename,
    "iso3": iso3 == null ? null : iso3,
    "numcode": numcode == null ? null : numcode,
    "phonecode": phonecode,
  };
}
