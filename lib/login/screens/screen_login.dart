import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/dashboard/screens/dashboard.dart';
import 'package:claim_core/dashboard/screens/screen_dashboard.dart';
import 'package:claim_core/data/database_user.dart';
import 'package:claim_core/login/screens/forgot_screen.dart';
import 'package:claim_core/login/services/login_services.dart';
import 'package:claim_core/utilities/app_assets.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/constant_functions.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  bool isPasswordVisible = false;

  final bottom_side = BorderSide(
    color: Colors.grey[400]!,
    width: 1.8,
  );

  String? fcm_token = "";

  DatabaseUser _databaseUser = DatabaseUser();

  @override
  void initState() {
    super.initState();
    isPasswordVisible = false;
    // _emailController.text = "sifatullahshah@gmail.com";
    // _passwordController.text = "Bok@12345";

    _emailController.text = "khurriazafar@gmail.com";
    _passwordController.text = "Bok@12345";
    _databaseUser.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables
    GestureTapCallback onSingInTap = () {
      print("HelloImranKhana : GestureTapCallback");

      String email = _emailController.text.toString();
      String password = _passwordController.text.toString();

      print("HelloImranKhana : ${email}");
      print("HelloImranKhana : ${password}");

      RestApiUtils.ShowLoadingDialog(context);
      LoginServices.LoginFunction(email, password).then((value) {
        Navigator.pop(context);
        if (value.isSuccess!) {
          ConstantFunctions.saveSharePrefModeString(
              "login_token", value.message!);
          ConstantFunctions.OpenNewScreenClean(context, ScreenDashboard());
        } else {
          ConstantFunctions.getSnakeBar(context, value.message!);
        }
      });
    };

    // ignore: prefer_function_declarations_over_variables
    GestureTapCallback onForgotPasswordTap = () {
      print("HelloImranKhana : GestureTapCallback");

      String email = _emailController.text.toString();
      // String password = _passwordController.text.toString();

      print("HelloImranKhana : ${email}");

      if (_emailController.text.length > 0) {
        RestApiUtils.ShowLoadingDialog(context);
        LoginServices.ForgotPasswordFunction(email).then((value) {
          Navigator.pop(context);
          if (value.status == 200) {
            ConstantFunctions.getSnakeBar(context, value.title!);
          } else {
            ConstantFunctions.getSnakeBar(context, value.title!);
          }
        });
      } else {
        ConstantFunctions.getSnakeBar(context, "Please first enter password");
      }
    };

    return Scaffold(
      backgroundColor: ThemeColors.background_color1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        /*actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, ConstantFunctions.OpenNewActivity(ScreenTheme()));
            },
            child: Icon(
              Icons.text_fields,
              color: ThemeColors.primary_dark_lt,
            ),
          ),
          SizedBox(width: 20)
        ],*/
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets,
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppAssets.sign_in_logo, scale: 5),
              ),
              Align(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      "Claim",
                      style: TextStyle(
                        color: Color.fromRGBO(205, 13, 30, 1),
                        fontSize: 40,
                        fontFamily: "circulat_std_bold",
                        fontWeight: FontWeight.w700,

                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   width: 1,
                    // ),
                    Text(
                      "Core",
                      style: TextStyle(
                        color: ThemeColors.primary_dark_lt,
                        fontSize: 40,
                        fontFamily: 'circulat_std_bold.ttf',

                        fontWeight: FontWeight.w700,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi there! Nice to see you again",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 35),
              _textheading('Email'),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _emailController,
                  focusNode: _focusEmail,

                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  // validator: _validateConfirmPassword,
                  // obscureText: !isConfirmPasswordVisible,
                ),
              ),
              _textheading('Password'),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _passwordController,
                  focusNode: _focusPassword,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  // validator: _validateConfirmPassword,
                  obscureText: !isPasswordVisible,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onForgotPasswordTap,
                      child: _text('Stay in Signed in'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                      child: _text('Forgot Password?'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  // color: Colors.blue,
                  color: ThemeColors.orange_button,
                  // color: Color.fromRGBO(255, 102, 0, 1),
                  // color:Color(FFF6EE),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "log in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  onPressed: onSingInTap,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _text(text1) {
    TextStyle style1 = TextStyle(
        color: Color.fromRGBO(205, 13, 30, 1),
        fontSize: 12,
        fontWeight: FontWeight.bold);
    return Container(
      child: Text(text1, style: style1),
    );
  }

  _textheading(text) {
    TextStyle style1 = TextStyle(
        color: Color.fromRGBO(205, 13, 30, 1),
        fontSize: 20,
        fontWeight: FontWeight.bold);
    return Container(
      child: Text(text, style: style1),
    );
  }
}
