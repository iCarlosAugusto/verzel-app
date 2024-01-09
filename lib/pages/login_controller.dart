import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verzel_project/pages/home_page.dart';
import 'package:verzel_project/repositories/authentication_repository.dart';
import 'package:verzel_project/utils/navigator_key.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  
  final TextEditingController _nameFieldController = TextEditingController();
  TextEditingController get nameFieldController => _nameFieldController;
  
  final TextEditingController _passwordFieldController = TextEditingController();
  TextEditingController get passwordFieldController => _passwordFieldController;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _storage = const FlutterSecureStorage();
  

  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();

  Future authenticate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      dynamic result = await _authenticationRepository.login(
        _nameFieldController.text,
        _passwordFieldController.text
      );
      await _storage.write(key: "acessToken", value: result["acessToken"]);
      await _storage.write(key: "refreshToken", value: result["refreshToken"]);
      await _storage.write(key: "statusUser", value: "loggedin");
      prefs.setBool("isLoggedIn", true);
      Navigator.of(NavigationService.navigatorKey.currentContext!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }
}