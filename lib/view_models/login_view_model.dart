import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz2fun/models/login_model.dart';
import 'package:quiz2fun/models/response_data_model.dart';
import 'package:quiz2fun/services/api_service.dart';
import 'package:quiz2fun/utils/constants/app_constants.dart';
import 'package:quiz2fun/utils/constants/color_constants.dart';
import 'package:quiz2fun/utils/shared_preferences_helper.dart';
import 'package:quiz2fun/widgets/alert_bar.dart';

class LoginViewModel with ChangeNotifier {
  ApiStatus loadingStatus = ApiStatus.idle;

  TextEditingController emailTextFieldController = TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordTextFieldController = TextEditingController(text: "cityslicka");

  void loginUser({required BuildContext context, bool logInWithCommonLoader= false}) async {
    if (emailTextFieldController.text.isEmpty) {
      AlertBar.show(context, title: "Enter email", description: "Please enter a Email");
      return;
    }
    if (passwordTextFieldController.text.isEmpty) {
      AlertBar.show(context, title: "Enter password", description: "Please enter a Password");
      return;
    }
    if (!logInWithCommonLoader) {
      loadingStatus = ApiStatus.started;
      notifyListeners();
    }

    LoginModel _loginModel = LoginModel(email: emailTextFieldController.text.trim(), password: passwordTextFieldController.text);

    ResponseData responseData =
        await ApiService().loginUser(context: context, loginModel: _loginModel, logInWithCommonLoader: logInWithCommonLoader);

    if (responseData.ok) {
      //TODO: Push to next screen
      loadingStatus = ApiStatus.completed;
      String token = jsonDecode(responseData.rawResponseBody.toString())['token'];
      SharedPreferencesHelper.setAuthToken(token);
      AlertBar.show(context, title: "Done", description: "Login Successful Token: $token", backgroundColor: ColorConstants.GREEN);
    } else {
      loadingStatus = ApiStatus.failed;
    }

    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    loadingStatus = ApiStatus.idle;
    notifyListeners();
  }
}
