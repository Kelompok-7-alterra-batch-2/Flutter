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
  // final List<MockPatient> isiPatient = [
  //   MockPatient(
  //     idPatient: 123,
  //     name: "Oscar",
  //     doB: DateTime(1997, 11, 21),
  //     address: "Jalan Ketapang",
  //     gender: "Pria",
  //     diagnosis: "no",
  //     prescription: "",
  //     isDone: false,
  //   ),
  //   MockPatient(
  //     idPatient: 124,
  //     name: "Oktorian",
  //     doB: DateTime(2000, 11, 12),
  //     address: "Jalan Ketapang",
  //     gender: "Pria",
  //     diagnosis: "no",
  //     prescription: "",
  //     isDone: false,
  //   ),
  //   MockPatient(
  //     idPatient: 125,
  //     name: "Oktorian",
  //     doB: DateTime(2000, 11, 12),
  //     address: "Jalan Ketapang",
  //     gender: "Pria",
  //     diagnosis: "no",
  //     prescription: "",
  //     isDone: false,
  //   ),
  // ];

  late SharedPreferences pref;
  late bool newDB;

  void cekDB() async {
    pref = await SharedPreferences.getInstance();
    newDB = pref.getBool('ndb') ?? true;

    // if (newDB) {
    //   _databasePatient.insertPatient(isiPatient[0]);
    //   _databasePatient.insertPatient(isiPatient[1]);
    //   _databasePatient.insertPatient(isiPatient[2]);
    //   _databasePatient.insertPatient(isiPatient[2]);
    //   pref.setBool('ndb', false);
    // } else {
    //   debugPrint('data sudah ada');
    // }
  }

  @override
  void initState() {
    cekDB();
    //catatan : pake shared preferences!
    super.initState();
  }

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
        // nextScreen: const DashboardPage(),
        // nextScreen: const PatientDetailPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color(0xff4e89a8),
      ),
    );
  }
}
