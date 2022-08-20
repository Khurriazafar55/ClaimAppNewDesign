// import 'package:claim_core/dashboard/models/model_dashboard.dart';
// import 'package:http/http.dart' as http;

// class DashboardServices {
//   static var time_out = const Duration(seconds: 17);
//   static var client = http.Client();
//   String log_string = "HelloGetResponse";

//   static Future<ModelDashboard> LoginFunction(String email, String password) async {
//     try {
//       Map<String, String> _body = {'email': email, 'password': password};
//       Map<String, String> _header = {"Content-Type": "application/json"};

//       const headers = {'Content-Type': 'application/json'};

//       print("HelloGetResponse login : ${RestApiUtils.login}");
//       var response = await client
//           .post(Uri.parse(RestApiUtils.login),
//               headers: headers, body: jsonEncode(_body))
//           .timeout(time_out);

//       RestApiUtils.GetPrintHeaderBody(RestApiUtils.login,
//           {"Content-Type": "application/json"}, _body, response);

//       if (response.statusCode == 200) {
//         final modelLogin = modelLoginFromMap(response.body);
//         return modelLogin;
//       } else if (response.statusCode == 403) {
//         return ModelLogin(isSuccess: false, message: "Site Disabled issue");
//       } else {
//         return ModelLogin(
//             isSuccess: false,
//             message: RestApiUtils.GetResponse(response.statusCode));
//       }
//     } on TimeoutException catch (_) {
//       return ModelLogin(
//           isSuccess: false, message: RestApiUtils.GetResponse(408));
//     } on SocketException {
//       return ModelLogin(
//           isSuccess: false, message: RestApiUtils.GetResponse(404));
//     } catch (ex) {
//       return ModelLogin(isSuccess: false, message: ex.toString());
//     }
//   }

// }
