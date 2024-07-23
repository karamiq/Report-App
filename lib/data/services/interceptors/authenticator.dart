import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticator extends Interceptor {
  //final Authentication authentication;
  Authenticator(
      // this.authentication,
      );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //final isSignedIn = authentication.isSignedIn();
    // final token = authentication.build()?.token;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print('the token at the intersptor: $token');

    //if (isSignedIn) options.headers["Authorization"] = "Bearer $token";
    options.headers["Authorization"] = "Bearer $token";

    super.onRequest(options, handler);
  }
}
