import 'package:quiz2fun/utils/constants/api_constants.dart';
import 'package:quiz2fun/utils/shared_preferences_helper.dart';

class SingletonConstants {
  static SingletonConstants? _instance;

  factory SingletonConstants() => _instance ??= SingletonConstants._();

  SingletonConstants._();

  String? _baseUrl;
  String? _authToken;

  String getBaseUrl() => _baseUrl ?? ApiConstants.SERVER_BASE_URL;

  void setBaseUrl(String? baseURL) => _baseUrl = baseURL;

  Future<String?> get getToken async => _authToken ??= await SharedPreferencesHelper.getAuthTokenWithNullCheck();
}
