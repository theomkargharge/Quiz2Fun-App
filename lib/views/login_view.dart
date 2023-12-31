import 'package:flutter/material.dart';
import 'package:quiz2fun/utils/constants/app_constants.dart';
import 'package:quiz2fun/utils/constants/color_constants.dart';
import 'package:quiz2fun/utils/constants/font_family_constants.dart';
import 'package:quiz2fun/view_models/login_view_model.dart';
import 'package:quiz2fun/widgets/common_button.dart';
import 'package:quiz2fun/widgets/common_text_field.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  static const String TAG = "/LoginView";

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _buildSubmitButton(LoginViewModel loginViewModel) {
    switch (loginViewModel.loadingStatus) {
      case ApiStatus.started:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        );
      case ApiStatus.completed:
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.check,
            size: 40,
            color: ColorConstants.GREEN,
          ),
        );

      default:
        return CommonButton(
          title: "Login with Widget Specific Loader",
          function: () {
            loginViewModel.loginUser(context: context);
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      ///This flag will allow to ignore Keyboard Overflow.
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          AppConstants.APP_NAME,
          style: TextStyle(fontFamily: FontFamilyConstants.PLAY_FAIR_DISPLAY),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Image.asset(
                "assets/images/logos/Google_flutter_logo.png",
                width: 150,
              )),
          CommonTextField(
            label: "Email",
            hint: "Enter Email here",
            controller: _loginViewModel.emailTextFieldController,
          ),
          CommonTextField(
            label: "Password",
            hint: "Enter Password here",
            controller: _loginViewModel.passwordTextFieldController,
          ),
          _buildSubmitButton(_loginViewModel),
          CommonButton(
            title: "Login with Common Loader",
            function: () {
              _loginViewModel.loginUser(context: context, logInWithCommonLoader: true);
            },
          )
        ],
      ),
    );
  }
}
