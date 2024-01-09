import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verzel_project/pages/home_page.dart';
import 'package:verzel_project/pages/login_view.dart';
import 'package:verzel_project/pages/slapsh_page.dart';
import 'package:verzel_project/repositories/offer_repository.dart';
import 'package:verzel_project/utils/api.dart';
import 'package:verzel_project/utils/navigator_key.dart';

final getIt = GetIt.instance;

setup() {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<OfferRepository>(OfferRepository());
  // getIt.registerSingleton<ApiHelper>(ApiHelper());
  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper()) ;
}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0XFF14CC60),
          primaryColorLight:const Color(0XFF14CC60),
          primaryColorDark: const Color(0XFF14CC60),
          useMaterial3: true,
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                width: 2,
                color: Color(0XFF14CC60),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(top: 16, bottom: 16)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          )),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(top: 16, bottom: 16, left: 18, right: 18)
              ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return const Color(0XFF14CC60);
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ) 
          ),
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: const Color(0xFF272727).withOpacity(0.5),
            iconColor: const Color(0xFF272727).withOpacity(0.5),
            prefixIconColor: const Color(0xFF272727).withOpacity(0.5),
            contentPadding: const EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
            hintStyle: TextStyle(
              color: const Color(0xFF272727).withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.w300
            ),
            labelStyle: TextStyle(color: const Color(0xFF272727).withOpacity(0.5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              enableFeedback: false,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              selectedIconTheme: IconThemeData(color: Colors.orange),
              unselectedIconTheme: IconThemeData(color: Colors.grey)),
          primarySwatch: Colors.blue,
        ),
      home: const SplashPage()
    );
  }
}