import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verzel_project/pages/home_page.dart';
import 'package:verzel_project/pages/login_view.dart';
import 'package:verzel_project/utils/navigator_key.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  initState() {
    super.initState();
    _checkUserAuthentication();
  }
  Future<void> _checkUserAuthentication() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn =  prefs.getBool('isLoggedIn');
    if(isLoggedIn == null || isLoggedIn == false) {
      Navigator.of(NavigationService.navigatorKey.currentContext!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } else {
      Navigator.of(NavigationService.navigatorKey.currentContext!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}