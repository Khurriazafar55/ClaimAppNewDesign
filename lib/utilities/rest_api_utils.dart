import 'package:claim_core/utilities/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class RestApiUtils {
  RestApiUtils._();

  // APIs Links
  // static String ip_config = "https://insuranceapi1.azurewebsites.net/";
  static String ip_config = "https://insurancefapp.azurewebsites.net/Services/";
  // static String ip_config = "https://insurancefrontapp1.azurewebsites.net/Services/";

  // static String ImageUrl = "http://fundraising.sidrafoundation.pk/storage/avatars/";
  // https://insurancefapp.azurewebsites.net/weatherforecast
  static final String login = ip_config + "api/Auth/Login";
  static final String forgot = ip_config + "api/auth/Forgot";
  static final String drop_down_get_all = ip_config + "api/DropDown/GetAll";
  static final String get_services = ip_config + "api/DropDown/GetServices";
  static final String Camera = ip_config + "api/Claim/Camera";

  static final String logout = ip_config + "api/Auth/logout";
  static final String weatherforecast = ip_config + "weatherforecast";
  static final String claim_create = ip_config + "api/claim/Create";
  static final String do_create_report = ip_config + "api/Claim/DoReport";
  static final String get_report = ip_config + "api/Claim/GetReport";
  static final String get_claim = ip_config + "api/claim/Get";
  static final String get_all_claim = ip_config + "api/claim/GetAll";
  static final String get_all_notification =
      ip_config + "api/Notification/GetAll";
  static final String get_profile = ip_config + "api/AppUser/Get";
  static final String get_contacts = ip_config + "api/CompanyContacts/Contacts";

  //Response Status and Message
  static String error_001 = "Time out error, Please try again";
  static String error_002 = "You are not connected to internet";

  static String error_default = "Bad Gateway or Request Cancelled";

  static String error_300 =
      "Request will return multiple response. Client should choose one of them.";
  static String error_301 =
      "This is a cache response because URL of requested response has been changed permanently.";
  static String error_302 =
      "The URL of the requested resource has been changed temporarily.";
  static String error_303 =
      "The response can be found under a different URI and SHOULD be retrieved using a GET method on that resource.";
  static String error_304 =
      "Response has not been modified, so the client can continue to use the same cached version of the response.";
  static String error_305 =
      "Requested response must be accessed by a proxy. (Deprecated)";
  static String error_306 =
      "It is a reserved status code and is not used anymore.";
  static String error_307 = error_default;
  static String error_308 = error_default;
  static String error_400 =
      "Bad Request and could not be understood by the server due to incorrect syntax.";
  static String error_401 = "Request requires user authentication information.";
  static String error_402 = "Provide all values";
  static String error_403 =
      "Unauthorized request. The client does not have access rights to the content.";
  static String error_404 =
      "Not Found	The server cannot find the requested resource.";
  static String error_405 =
      "Request has been disabled by the Server (Method not allowed)";
  static String error_406 = "This method is not acceptable";
  static String error_407 =
      "Client must first authenticate itself with the proxy.";
  static String error_408 =
      "Server did not receive a complete request from the client";
  static String error_409 =
      "The request could not be completed due to a conflict";
  static String error_410 =
      "The requested resource is no longer available at the server.";
  static String error_411 =
      " Server refuses to accept the request without a defined Content- Length";
  static String error_412 = "Precondition Failed";
  static String error_413 =
      "Request entity is larger than limits defined by server.";
  static String error_414 = "Request-URI Too Long.";
  static String error_415 =
      "Unsupported Media Type	The media-type in Content-type of the request is not supported by the server.";
  static String error_502 = "Bad Gateway";
  static String error_503 =
      "Service Unavailable. The server is not ready to handle the request.";
  static String error_504 = "Gateway Timeout";
  static String error_505 = "HTTP Version Not Supported";
  static String error_508 =
      "The server detected an infinite loop while processing the request.";
  static String error_510 =
      "Further extensions to the request are required for the server to fulfill it.";
  static String error_511 = "Network Authentication Required";

  static String GetResponse(int status) {
    switch (status) {
      case 1:
        print("HelloGetResponse  error_001 ${error_001}");
        return error_001;
      case 2:
        print("HelloGetResponse  error_002 ${error_002}");
        return error_002;
      case 300:
        print("HelloGetResponse  error_300 ${error_300}");
        return error_300;
      case 301:
        print("HelloGetResponse  error_301 ${error_301}");
        return error_301;
      case 302:
        print("HelloGetResponse  error_302 ${error_302}");
        return error_302;
      case 303:
        print("HelloGetResponse  error_303 ${error_303}");
        return error_303;
      case 304:
        print("HelloGetResponse  error_304 ${error_304}");
        return error_304;
      case 305:
        print("HelloGetResponse  error_305 ${error_305}");
        return error_305;
      case 306:
        print("HelloGetResponse  error_306 ${error_306}");
        return error_306;
      case 307:
        print("HelloGetResponse  error_307 ${error_307}");
        return error_307;
      case 308:
        print("HelloGetResponse  error_308 ${error_308}");
        return error_308;
      case 400:
        print("HelloGetResponse  error_400 ${error_400}");
        return error_400;
      case 401:
        print("HelloGetResponse  error_401 ${error_401}");
        return error_401;
      case 402:
        print("HelloGetResponse  error_402 ${error_402}");
        return error_402;
      case 403:
        print("HelloGetResponse  error_403 ${error_403}");
        return error_403;
      case 404:
        print("HelloGetResponse  error_404 ${error_404}");
        return error_404;
      case 405:
        print("HelloGetResponse  error_405 ${error_405}");
        return error_405;
      case 406:
        print("HelloGetResponse  error_406 ${error_406}");
        return error_406;
      case 407:
        print("HelloGetResponse  error_407 ${error_407}");
        return error_407;
      case 408:
        print("HelloGetResponse  error_408 ${error_408}");
        return error_408;
      case 409:
        print("HelloGetResponse  error_409 ${error_409}");
        return error_409;
      case 410:
        print("HelloGetResponse  error_410 ${error_410}");
        return error_410;
      case 411:
        print("HelloGetResponse  error_411 ${error_411}");
        return error_411;
      case 412:
        print("HelloGetResponse  error_412 ${error_412}");
        return error_412;
      case 413:
        print("HelloGetResponse  error_413 ${error_413}");
        return error_413;
      case 414:
        print("HelloGetResponse  error_414 ${error_414}");
        return error_414;
      case 415:
        print("HelloGetResponse  error_415 ${error_415}");
        return error_415;
      case 502:
        print("HelloGetResponse  error_502 ${error_502}");
        return error_502;
      case 503:
        print("HelloGetResponse  error_503 ${error_503}");
        return error_503;
      case 504:
        print("HelloGetResponse  error_504 ${error_504}");
        return error_504;
      case 505:
        print("HelloGetResponse  error_505 ${error_505}");
        return error_505;
      case 508:
        print("HelloGetResponse  error_508 ${error_508}");
        return error_508;
      case 510:
        print("HelloGetResponse  error_510 ${error_510}");
        return error_510;
      case 511:
        print("HelloGetResponse  error_511 ${error_511}");
        return error_511;
      default:
        print("HelloGetResponse  error_default ${error_default}");
        return error_default;
    }
  }

  static void GetPrintHeaderBody(url, header, body, response) {
    print("HelloGetResponse  url ${url}");
    print("HelloGetResponse  header ${header}");
    print("HelloGetResponse  body ${body}");
    print(
        "HelloGetResponse  response ${response != null ? response.statusCode : "null response code"} : ${response != null ? response.body : "null response body"}");
  }

  static ShowLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 145,
          height: 145,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Load a Lottie file from your assets
              Container(
                width: 70,
                height: 70,
                child: Lottie.asset(AppAssets.loading_response, width: 70),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Loading Data",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void GetPrintMessageBody(String key, status, body) {
    print("$key  Message ${GetResponse(status)}");
    print("$key  Body ${body}");
  }
}
