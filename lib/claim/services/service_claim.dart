import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:claim_core/claim/models/model_camera.dart';
import 'package:claim_core/claim/models/model_do_report.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/models/model_get_claim_id.dart';
import 'package:claim_core/claim/models/model_get_report.dart';
import 'package:claim_core/claim/models/model_service.dart';
import 'package:claim_core/dashboard/models/model_all_dropdown.dart';
import 'package:claim_core/dashboard/models/model_message.dart';
import 'package:claim_core/splas_screen.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ServiceClaim {
  static var time_out = const Duration(seconds: 15);
  static var client = http.Client();

  //done handling
  static Future<ModelGetClaim> GetClaimFunction(context, String bearer) async {
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse(RestApiUtils.get_all_claim), headers: header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.get_all_claim, header, null, response);

      if (response.statusCode == 200) {
        final model = modelGetClaimFromMap(response.body);
        if (model.data!.length == 0) {
          model.message = "No claims found";
          model.status = 200;
        } else {
          model.message = "Claims found";
          model.status = 200;
        }
        return model;
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelGetClaim(
          status: response.statusCode,
          data: null,
          message: RestApiUtils.GetResponse(response.statusCode),
        );
      }
    } on TimeoutException catch (_) {
      return ModelGetClaim(
        status: 1,
        data: null,
        message: RestApiUtils.GetResponse(1),
      );
    } on SocketException {
      return ModelGetClaim(
        status: 2,
        data: null,
        message: RestApiUtils.GetResponse(2),
      );
    } catch (ex) {
      return ModelGetClaim(
        status: 600,
        data: null,
        message: ex.toString(),
      );
    }
  }

  //done handling
  static Future<ModelMessage> CreateClaimFunction(
      context, String bearer, valueMap) async {
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .post(Uri.parse(RestApiUtils.claim_create),
              headers: header, body: jsonEncode(valueMap))
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.claim_create, header, jsonEncode(valueMap), response);

      if (response.statusCode == 200) {
        return ModelMessage(
            response.statusCode, "Claim Submitted Successfully");
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelMessage(
            response.statusCode, RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelMessage(1, RestApiUtils.GetResponse(1));
    } on SocketException {
      return ModelMessage(2, RestApiUtils.GetResponse(2));
    } catch (ex) {
      return ModelMessage(600, ex.toString());
    }
  }

  //done handling
  static Future<ModelGetReport> GetReportFunction(
      context, String bearer, String claimId) async {
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse("${RestApiUtils.get_report}?id=$claimId"),
              headers: header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          "${RestApiUtils.get_report}/id=$claimId", header, null, response);

      if (response.statusCode == 200) {
        final model = modelGetReportFromMap(response.body);
        model.status = 200;
        model.message = "Reports getting successfully";
        return model;
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelGetReport(
            status: response.statusCode,
            data: null,
            message: RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelGetReport(
          status: 1, data: null, message: RestApiUtils.GetResponse(1));
    } on SocketException {
      return ModelGetReport(
          status: 2, data: null, message: RestApiUtils.GetResponse(2));
    } catch (ex) {
      return ModelGetReport(status: 600, data: null, message: ex.toString());
    }
  }

  //done handling
  static Future<ModelDoReport> CreateReportFunction(
      context, String bearer, valueMap) async {
    print("HelloSifat : $valueMap");

    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .post(Uri.parse(RestApiUtils.do_create_report),
              headers: header, body: jsonEncode(valueMap))
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(RestApiUtils.do_create_report, header,
          jsonEncode(valueMap), response);

      if (response.statusCode == 200) {
        final model = modelDoReportFromMap(response.body);
        model.status = 200;
        model.message = "Report created successfully";
        return model;
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelDoReport(
            status: response.statusCode,
            claimReportModel: null,
            message: RestApiUtils.GetResponse(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return ModelDoReport(
          status: 1,
          claimReportModel: null,
          message: RestApiUtils.GetResponse(1));
    } on SocketException {
      return ModelDoReport(
          status: 2,
          claimReportModel: null,
          message: RestApiUtils.GetResponse(2));
    } catch (ex) {
      print("HelloGetResponse  error exx ${ex.toString()}");
      return ModelDoReport(
          status: 600, claimReportModel: null, message: ex.toString());
    }
  }

  //done handling
  static Future<ModelAllDropdown> GetAllDropDown(context, String bearer) async {
    try {
      Map<String, String> header = {
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse(RestApiUtils.drop_down_get_all), headers: header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.drop_down_get_all, header, null, response);

      if (response.statusCode == 200) {
        final model = modelAllDropdownFromJson(response.body);
        model.status = 200;
        model.message = "values getting successful";
        if (model.data != null && model.data!.length > 0) {
          return model;
        } else {
          return ModelAllDropdown(
              status: response.statusCode,
              message: "Values not found",
              data: null);
        }
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelAllDropdown(
            status: response.statusCode,
            message: RestApiUtils.GetResponse(response.statusCode),
            data: null);
      }
    } on TimeoutException catch (_) {
      return ModelAllDropdown(
          status: 1, message: RestApiUtils.GetResponse(1), data: null);
    } on SocketException {
      return ModelAllDropdown(
          status: 2, message: RestApiUtils.GetResponse(2), data: null);
    } catch (ex) {
      return ModelAllDropdown(status: 600, message: ex.toString(), data: null);
    }
  }

  //done handling
  static Future<ModelService> GetServiceTypeDropDown(
      context, String bearer) async {
    try {
      Map<String, String> header = {
        'Authorization': 'Bearer $bearer',
      };

      var response = await client
          .get(Uri.parse(RestApiUtils.get_services), headers: header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.get_services, header, null, response);

      if (response.statusCode == 200) {
        final model = modelServiceFromMap(response.body);
        if (model.data != null && model.data!.length > 0) {
          return model;
        } else {
          return ModelService(
              status: response.statusCode,
              message: "Found zero records",
              data: null);
        }
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelService(
            status: response.statusCode,
            message: RestApiUtils.GetResponse(response.statusCode),
            data: null);
      }
    } on TimeoutException catch (_) {
      return ModelService(
          status: 1, message: RestApiUtils.GetResponse(1), data: null);
    } on SocketException {
      return ModelService(
          status: 2, message: RestApiUtils.GetResponse(2), data: null);
    } catch (ex) {
      return ModelService(status: 600, message: ex.toString(), data: null);
    }
  }

  //done handling
  static Future<ModelGetClaimId> GetClaimById(
      context, String bearer, String claimId) async {
    try {
      Map<String, String> header = {'Authorization': 'Bearer $bearer'};

      var response = await client
          .get(Uri.parse("${RestApiUtils.get_claim}?id=$claimId"),
              headers: header)
          .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          "${RestApiUtils.get_claim}?id=$claimId", header, null, response);

      if (response.statusCode == 200) {
        final model = modelGetClaimIdFromMap(response.body);

        if (model.data != null && model.data!.length > 0) {
          model.status = 200;
          model.message = "Records found";
          return model;
        } else {
          return ModelGetClaimId(
              status: 200, message: "No record found", data: null);
        }
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelGetClaimId(
            status: response.statusCode,
            message: RestApiUtils.GetResponse(response.statusCode),
            data: null);
      }
    } on TimeoutException catch (_) {
      return ModelGetClaimId(
          status: 1, message: RestApiUtils.GetResponse(1), data: null);
    } on SocketException {
      return ModelGetClaimId(
          status: 2, message: RestApiUtils.GetResponse(2), data: null);
    } catch (ex) {
      return ModelGetClaimId(status: 600, message: ex.toString(), data: null);
    }
  }

  //done handling
  static Future<ModelCamera> UploadCameraImage(
      BuildContext context, String bearer,
      {required String Damage_type,
      required String Image_name,
      required String Image_format,
      required String structure_type,
      required String room_type,
      required String Image_taken_side,
      required String Macro,
      required String Image_path,
      required String claimId,
      required String reportId,
      required File image_file}) async {
    try {
      Map<String, String> header = {'Authorization': "Bearer $bearer"};
      Map<String, String> body = {
        "Damage_type": Damage_type,
        "Image_name": Image_name,
        "Image_format": Image_format,
        "structure_type": structure_type,
        "room_type": room_type,
        "Image_taken_side": Image_taken_side,
        "Macro": Macro,
        "Image_path": Image_path,
        "claimId": claimId,
        "reportId": reportId,
      };
      var request =
          http.MultipartRequest("POST", Uri.parse(RestApiUtils.Camera))
            ..fields.addAll(body)
            ..headers.addAll(header);

      var pic = await http.MultipartFile.fromPath("upfiles", image_file.path);
      //add multipart to request
      request.files.add(pic);
      var response = await request.send();

      print("HelloGetResponse  statusCode ${response.statusCode}");

      if (response.statusCode == 200) {
        //Get the response from the server
        var responseData = await response.stream.toBytes();

        var responseString = String.fromCharCodes(responseData);

        print("HelloGetResponse  responseString $responseString");

        RestApiUtils.GetPrintHeaderBody(
            RestApiUtils.Camera, header, body, null);

        final modelCamera = modelCameraFromMap(responseString);
        modelCamera.status = 200;
        modelCamera.message = "Picture upload successfully";
        return modelCamera;
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, SplashScreen());
        return null!;
      } else {
        return ModelCamera(
          status: 200,
          message: RestApiUtils.GetResponse(response.statusCode),
          dataCamera: null,
        );
      }
    } on TimeoutException catch (_) {
      return ModelCamera(
          status: 1, message: RestApiUtils.GetResponse(1), dataCamera: null);
    } on SocketException {
      return ModelCamera(
          status: 2, message: RestApiUtils.GetResponse(2), dataCamera: null);
    } catch (ex) {
      return ModelCamera(status: 600, message: ex.toString(), dataCamera: null);
    }
  }
}
