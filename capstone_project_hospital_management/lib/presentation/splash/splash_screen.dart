import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone_project_hospital_management/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Lato",
      ),
      title: "Hostpital Management",
      home: AnimatedSplashScreen(
        splash: 'assets/logo/logo_text_white.png',
        splashIconSize: 170,
        nextScreen: const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color(0xff4e89a8),
      ),
    );
  }
}
