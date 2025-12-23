import 'package:flutter/material.dart';
import 'package:service_app_design/pages/home_page.dart';
import 'package:service_app_design/pages/login_page.dart';
import 'package:service_app_design/pages/register_page.dart';
import 'package:service_app_design/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "splash": (context) {
          return SplashScreen();
        },
        "login": (context) {
          return LoginPage();
        },
        "register": (context) {
          return RegisterPage();
        },
        "home": (context) {
          return HomePage();
        },
      },
    );
  }
}
