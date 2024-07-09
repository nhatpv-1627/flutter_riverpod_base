import 'package:flutter_base/src/data/base/data_source.dart';
import 'package:flutter_base/src/data/model/login_token.dart';

class AuthRemoteDataSource with DataSource {
  // Mock login data
  Future<Token> login(String username, String password) async {
    final response = await excuse(() async {
      await Future.delayed(const Duration(seconds: 1));
      return Token(
          accessToken: "accessToken_response_${username}_$password",
          refreshToken: "refreshToken_response_${username}_$password");
    });
    return response;
  }
}
