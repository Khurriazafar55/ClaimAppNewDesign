import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:claim_core/login/models/model_forgot_password.dart';
import 'package:claim_core/login/models/model_login.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  static var time_out = const Duration(seconds: 17);
  static var client = http.Client();
  String log_string = "HelloGetResponse";

  static Future<ModelLogin> LoginFunction(String email, String password) async {
    try {
      Map<String, String> _body = {'email': email, 'password': password};
      Map<String, String> _header = {"Content-Type": "application/json"};

      const headers = {'Content-Type': 'application/json'};

      print("HelloGetResponse login : ${RestApiUtils.login}");
      var response = await client
          .post(Uri.parse(RestApiUtils.login),
              headers: headers, body: jsonEncode(_body))
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(RestApiUtils.login,
          {"Content-Type": "application/json"}, _body, response);

      if (response.statusCode == 200) {
        final modelLogin = modelLoginFromMap(response.body);
        return modelLogin;
      } else if (response.statusCode == 403) {
        return ModelLogin(isSuccess: false, message: "Site Disabled issue");
      } else {
        return ModelLogin(
            isSuccess: false,
            message: RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelLogin(
          isSuccess: false, message: RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelLogin(
          isSuccess: false, message: RestApiUtils.GetResponse(404));
    } catch (ex) {
      return ModelLogin(isSuccess: false, message: ex.toString());
    }
  }

  static Future<ModelForgotPassword> ForgotPasswordFunction(
      String email) async {
    try {
      Map<String, String> _body = {'email': email};
      // Map<String, String> _header = {"Content-Type": "application/json"};

      const headers = {'Content-Type': 'application/json'};

      var response = await client
          .post(Uri.parse(RestApiUtils.forgot),
              headers: headers, body: jsonEncode(_body))
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(RestApiUtils.forgot,
          {"Content-Type": "application/json"}, _body, response);

      if (response.statusCode == 200) {
        final _model = modelForgotPasswordFromJson(response.body);
        return _model;
      } else {
        return ModelForgotPassword(
            status: response.statusCode,
            title: RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelForgotPassword(
          status: 408, title: RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelForgotPassword(
          status: 404, title: RestApiUtils.GetResponse(404));
    } catch (ex) {
      return ModelForgotPassword(
          status: 501, title: RestApiUtils.GetResponse(501));
    }
  }
}
