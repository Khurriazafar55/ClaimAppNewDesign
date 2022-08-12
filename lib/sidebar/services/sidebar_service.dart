import 'dart:async';
import 'dart:io';

import 'package:claim_core/dashboard/models/model_message.dart';
import 'package:claim_core/sidebar/models/model_notifications.dart';
import 'package:claim_core/sidebar/models/model_update_profile.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../splas_screen.dart';

class SidebarService {
  static final time_out = const Duration(seconds: 10);
  static final client = http.Client();

  static Future<ModelUpdateProfile> UpdateProfileImage(
      String bearer, String name, String email, File? image_file) async {
    try {
      Map<String, String> _header = {'Authorization': "Bearer $bearer"};
      Map<String, String> _body = {"name": name, "email": email};
      var request = http.MultipartRequest("POST", Uri.parse(RestApiUtils.login))
        ..fields.addAll(_body)
        ..headers.addAll(_header);

      if (image_file != null) {
        var pic = await http.MultipartFile.fromPath("avatar", image_file.path);
        //add multipart to request
        request.files.add(pic);
      }
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();

      var responseString = String.fromCharCodes(responseData);
      final modelUpdateProfile = modelUpdateProfileFromJson(responseString);
      if (modelUpdateProfile.status == 200) {
        return modelUpdateProfile;
      } else {
        return ModelUpdateProfile(
            status: modelUpdateProfile.status,
            message: RestApiUtils.GetResponse(modelUpdateProfile.status));
      }
    } on TimeoutException catch (_) {
      return ModelUpdateProfile(
          status: 408, message: RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelUpdateProfile(
          status: 501, message: RestApiUtils.GetResponse(501));
    } catch (ex) {
      return ModelUpdateProfile(status: 510, message: ex.toString());
    }
  }

  // static Future<ModelWeather> UserGoalTransaction(
  static Future<ModelNotifications> GetAllNotificationFunction(
      context, String bearer) async {
    try {
      Map<String, String> _header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse(RestApiUtils.get_all_notification), headers: _header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.get_all_notification, _header, null, response);

      if (response.statusCode == 200) {
        final _model = modelNotificationsFromMap(response.body);
        return _model;
      } else if (response.statusCode == 401) {
        // ConstantFunctions.saveSharePrefModeString("login_token", "");
        // ConstantFunctions.OpenNewScreenClean(context, ScreenSplash());
        return null!;
      } else {
        return ModelNotifications(data: null);
      }
    } on TimeoutException catch (_) {
      return ModelNotifications(data: null);
    } on SocketException {
      return ModelNotifications(data: null);
    } catch (ex) {
      return ModelNotifications(data: null);
    }
  }

  static Future<ModelMessage> LogoutFunction(
      BuildContext context, String bearer) async {
    try {
      Map<String, String> _header = {'Authorization': "Bearer $bearer"};

      var response = await client
          .post(Uri.parse("${RestApiUtils.logout}"), headers: _header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.logout, _header, null, response);

      if (response.statusCode == 200) {
        final modelMessage = modelMessageFromJson(response.body);

        if (modelMessage.status == 200) {
          return modelMessage;
        } else {
          return ModelMessage(modelMessage.status,
              RestApiUtils.GetResponse(modelMessage.status));
        }
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, ScreenSplash());
        return null!;
      } else {
        return ModelMessage(
            response.statusCode, RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelMessage(408, RestApiUtils.GetResponse(408));
    } on SocketException {
      return ModelMessage(501, RestApiUtils.GetResponse(501));
    } catch (ex) {
      return ModelMessage(510, ex.toString());
    }
  }
}
