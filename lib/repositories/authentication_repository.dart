import 'package:verzel_project/utils/api.dart';

class AuthenticationRepository {
  final ApiHelper _apiHelper = ApiHelper();

  Future<dynamic> login(String username, String password) async {
    dynamic result = await _apiHelper.api.post(
      "/auth/login",
      data: {
        "username": username,
        "password": password
      }
    );
    return result.data;
  }
}
