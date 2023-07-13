import 'package:flutter/material.dart';
import 'package:quiz2fun/models/login_model.dart';
import 'package:quiz2fun/models/response_data_model.dart';
import 'package:quiz2fun/utils/api_helper.dart';
import 'package:quiz2fun/utils/constants/api_constants.dart';

class ApiService {
  Future<ResponseData> loginUser({required BuildContext context, required LoginModel loginModel, required bool logInWithCommonLoader}) {
    Uri _uri = Uri.parse(baseURL + ApiConstants.LOGIN);

    return ApiHelper().postRequest(context, _uri, loginModel.toMap(),
        useAuth: false, showLoader: logInWithCommonLoader, responseName: "Login", showLog: true, showError: true);
  }
}
