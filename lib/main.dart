import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz2fun/utils/constants/app_constants.dart';
import 'package:quiz2fun/utils/constants/color_constants.dart';
import 'package:quiz2fun/utils/navigation_helper.dart';
import 'package:quiz2fun/views/custom_url_view.dart';
import 'package:quiz2fun/views/login_view.dart';

void main() async {
  //Check if custom URL flag is set and make safe check for production
  //If true custom url screen is shown
  //
  Widget _defaultHome = AppConstants.isCustomURLBuild && !AppConstants.isProdBuild
      ? NavigationHelper.getLoginViewWithProvider()
      : NavigationHelper.getCustomURLViewWithProvider();

  WidgetsFlutterBinding.ensureInitialized();
  //Locks orientation
  //Can be changed at runtime via same method.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ///Sets Status Bar Color
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: ));

  runApp(
     MaterialApp(
      title: AppConstants.APP_NAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorConstants.PRIMARY),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => _defaultHome,

        ///Home Route is Denoted as /
        ///Set tag in view itself, so it can be used directly maintaining consistency.
        CustomURLView.TAG: (context) => NavigationHelper.getCustomURLViewWithProvider(),
        LoginView.TAG: (context) => NavigationHelper.getLoginViewWithProvider(),
      },
    ),
  );
}
