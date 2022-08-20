import 'package:claim_core/login/models/model_login.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  //constuctor object calling
  ModelLogin userModel = ModelLogin();
  ModelLogin get userdata {
    return userModel;
  }

  void addlogindata(ModelLogin data) {
    userModel = data;
    notifyListeners();
  }
}
