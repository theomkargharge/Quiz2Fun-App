import 'package:quiz2fun/view_models/custom_url_view_model.dart';
import 'package:quiz2fun/view_models/login_view_model.dart';
import 'package:quiz2fun/views/custom_url_view.dart';
import 'package:quiz2fun/views/login_view.dart';
import 'package:provider/provider.dart';

///Navigation Helper
///Naming Standard:
///               Fun that gives View with provider             - getViewNameWithProvider()
///               Fun that pushes View                          - gotoViewName()
///               Fun(Data data) that pushes View with data     - gotoViewNameWithData(data)
///               Fun that clears stack and pushes View         - clearAndGotoViewName
///
///
class NavigationHelper {
  static getCustomURLViewWithProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CustomURLViewModel(),
        )
      ],
      child: CustomURLView(),
    );
  }

  static getLoginViewWithProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        )
      ],
      child: LoginView(),
    );
  }
}
