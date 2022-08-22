import 'package:claim_core/login/screens/password_reset.dart';
import 'package:claim_core/login/services/login_services.dart';
import 'package:claim_core/utilities/app_assets.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../app_theme_work/theme_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // _emailController.text = "sifatullahshah@gmail.com";
    // _passwordController.text = "Bok@12345";

    _emailController.text = "khurriazafar@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PasswordReset()));
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
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
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
                child: Image.asset(AppAssets.claim_core_logo, scale: 5),
              ),
              Align(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      "Claim",
                      style: TextStyle(
                        color: Color.fromRGBO(205, 13, 30, 1),
                        fontFamily: 'circulat_std_bold.ttf',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
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
                        fontWeight: FontWeight.w700,
                        fontFamily: 'circulat_std_bold.ttf',
                      ),
                    ),
                  ])),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password Reset",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your email address",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 35),
              _textheading('Email'),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _emailController,
                  // focusNode: _focusEmail,

                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  // validator: _validateConfirmPassword,
                  // obscureText: !isConfirmPasswordVisible,
                ),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  // color: Colors.blue,
                  // color: Color.fromRGBO(255, 102, 0, 1),
                  color: ThemeColors.orange_button,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  onPressed:
                      // onSingInTap;
                      onForgotPasswordTap,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  // color: Colors.blue,
                  // color: Color.fromRGBO(255, 102, 0, 1),
                  color: ThemeColors.orange_button,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {},

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
