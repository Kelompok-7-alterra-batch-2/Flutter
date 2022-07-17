import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone_project_hospital_management/screen/login/login_page_api.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Lato",
        primaryColor: const Color(0xff4e89a8),
      ),
      title: "Hostpital Management",
      home: AnimatedSplashScreen(
        splash: 'assets/logo/logo_text_white.png',
        splashIconSize: 200,
        nextScreen: const LoginPageApi(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color(0xff4e89a8),
      ),
    );
  }
}
