import 'dart:async';
import 'dart:io';

import 'package:claim_core/dashboard/models/model_get_contact.dart';
import 'package:claim_core/dashboard/models/model_profile.dart';
import 'package:claim_core/splas_screen.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  static var time_out = const Duration(seconds: 10);
  static var client = http.Client();

  // static Future<ModelWeather> UserGoalTransaction(
  static Future<ModelProfile> GetProfile(String bearer) async {
    try {
      Map<String, String> _header = {
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse(RestApiUtils.get_profile), headers: _header)
          .timeout(time_out);
      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.get_profile, _header, null, response);

      if (response.statusCode == 200) {
        final modelProfile = modelProfileFromJson(response.body);

        if (modelProfile.data != null) {
          return modelProfile;
        } else {
          return ModelProfile(data: null);
        }
      } else {
        return ModelProfile(data: null);
      }
    } on TimeoutException catch (_) {
      return ModelProfile(data: null);
    } on SocketException {
      return ModelProfile(data: null);
    } catch (ex) {
      return ModelProfile(data: null);
    }
  }

  static Future<ModelGetContact> GetContact(
      BuildContext context, String bearer) async {
    try {
      Map<String, String> _header = {
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse(RestApiUtils.get_contacts), headers: _header)
          .timeout(time_out);
      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.get_contacts, _header, null, response);

      if (response.statusCode == 200) {
        final modelGetContact = modelGetContactFromMap(response.body);

        if (modelGetContact.data != null) {
          return modelGetContact;
        } else {
          return ModelGetContact(data: null);
        }
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");

        ConstantFunctions.OpenNewScreenClean(context, ScreenSplash());
        return null!;
      } else {
        return ModelGetContact(data: null);
      }
    } on TimeoutException catch (_) {
      return ModelGetContact(data: null);
    } on SocketException {
      return ModelGetContact(data: null);
    } catch (ex) {
      return ModelGetContact(data: null);
    }
  }
}
