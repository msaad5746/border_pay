import 'dart:convert';
import 'package:http/http.dart' as http;

import 'network_helper.dart';

class NetworkHelperImpl extends NetworkHelper {
  String securityKey = "D5IDOMF1PS5S90ST0KQAFTL1O5M47J4E";

  @override
  Future<http.Response> get(String url, {Map? headers}) async {
    print('----GET REQUEST----\nURL --> $url');
    final header = await appendHeader(headers: headers);
    return http.get(Uri.parse(url), headers: header).then((
      http.Response response,
    ) async {
      print(
          '----GET RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');

      return handleResponse(response);
    }).catchError((error) {
      throw (error);
    });
  }

  @override
  Future<http.Response> post(String url, {Map? headers, body, encoding}) async {
    print('----POST REQUEST----\nURL --> $url\nBody --> $body');
    final header = await appendHeader(headers: headers);
    return http
        .post(Uri.parse(url),
            body: json.encode(body), headers: header, encoding: encoding)
        .then((http.Response response) {
      print(
          '----POST RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');
      return handleResponse(response);
    }).catchError((error) {
      throw (error);
    });
  }

  @override
  Future<http.Response> delete(String url, {Map? headers}) async {
    final header = await appendHeader(headers: headers);
    return http
        .delete(Uri.parse(url), headers: header)
        .then((http.Response response) {
      print(
          '----DELETE RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');
      return handleResponse(response);
    }).catchError((error) {
      throw (error);
    });
  }

  @override
  Future<http.Response> put(String url, {Map? headers, body, encoding}) async {
    final header = await appendHeader(headers: headers);

    return http
        .put(Uri.parse(url),
            body: json.encode(body), headers: header, encoding: encoding)
        .then(
      (http.Response response) {
        print(
            '----PUT RESPONSE----\nURL --> $url\nStatus Code = ${response.statusCode}\nbody = ${response.body.toString()}');

        return handleResponse(response);
      },
    ).catchError((error) {
      throw (error);
    });
  }

  @override
  http.Response handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    switch (statusCode) {
      case 401:
        {
          throw Exception("Unauthorized");
        }
      case 500:
        {
          throw Exception("Internal server error");
        }
      default:
        return response;
    }
  }

  @override
  Future<Map<String, String>> appendHeader(
      {Map? headers, bool refresh = false}) async {
    try {
      headers ??= <String, String>{};
      headers["X-Requested-With"] = "XMLHttpRequest";
      headers["Content-Type"] = "application/json";
    } catch (e) {
      print(e.toString());
    }

    return headers as Map<String, String>;
  }
}
