// ignore_for_file: avoid_unnecessary_containers

import 'package:capstone_project_hospital_management/screen/drawer/drawer_navigation.dart';
import 'package:capstone_project_hospital_management/screen/login/login_page_api.dart';
import 'package:capstone_project_hospital_management/screen/patient/done/patient_done_page.dart';
import 'package:capstone_project_hospital_management/screen/patient/patien_page.dart';
import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_api.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_done_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
    this.token = "",
    this.email = "",
  }) : super(key: key);

  final String token;
  final String email;
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PatientAPIVM patientApi = PatientAPIVM();
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  late SharedPreferences pref;
  late String tokens;
  late bool isLogin;
  bool isExp = true;
  void cekToken() async {
    pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool('isLogin') ?? false;
    tokens = pref.getString('token') ?? "";
    if (tokens != "" && tokens != " ") {
      isExp = JwtDecoder.isExpired(tokens);
    }
    if (isLogin && (isExp == false)) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPageApi()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Token : ${widget.token}");
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              centerTitle: true,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: MediaQuery.of(context).size.width > 770
                          ? MediaQuery.of(context).size.height * 0.035
                          : MediaQuery.of(context).size.height * 0.05,
                      image: const AssetImage("assets/logo/logo.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Care Hospital",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[300],
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) {
                      //   return DashboardPage();
                      // }));
                    },
                    // child: const Text("A"),
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.2,
                      image: const AssetImage("assets/pic/image1.png"),
                    ),
                  ),
                ),
              ]
              // title:
              ),
          drawer: DrawerWidget(),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical:
                          MediaQuery.of(context).size.width > 770 ? 20 : 40,
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    // color: sett.cPrimary,
                    decoration: MediaQuery.of(context).size.width > 770
                        ? BoxDecoration(
                            gradient: LinearGradient(
                              tileMode: TileMode.clamp,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                sett.cPrimary,
                                sett.cPrimary,
                                Colors.white,
                              ],
                            ),
                          )
                        : BoxDecoration(color: sett.cPrimary),
                    child: Center(
                      // child: DashboardHeadTablet(),
                      child: MediaQuery.of(context).size.width > 770
                          ? const DashboardHeadTablet()
                          : const DashboardHeadAndroid(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Patients Today",
                              style: sett.body3,
                            ),
                            Expanded(child: Container()),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return PatientPage(
                                    token: widget.token,
                                  );
                                }));
                              },
                              child: Row(
                                children: const [
                                  Text("See More"),
                                  Icon(
                                    Icons.navigate_next,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            PatientBuilderAPI(
                              future: patientApi.getPatientsAuth(widget.token),
                              limit: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Finished Consultation",
                              style: sett.body3,
                            ),
                            Expanded(child: Container()),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return PatientDonePage(
                                    token: widget.token,
                                  );
                                }));
                              },
                              child: Row(
                                children: const [
                                  Text("See More"),
                                  Icon(
                                    Icons.navigate_next,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // PAKE API

                            PatientBuilderDoneAPI(
                              future: patientApi.getPatientsAuth(widget.token),
                              limit: 4,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardHeadAndroid extends StatelessWidget {
  const DashboardHeadAndroid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tanggal = DateTime.now();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // width: MediaQuery.of(context).size.width * 0.58,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome,",
                    style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dr. Lorem Ipsum",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 23),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Image(
              height: MediaQuery.of(context).size.height * 0.12,
              image: const AssetImage("assets/logo/Vector.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.white, width: 1),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "${DateFormat("MMMM").format(tanggal)}, ${tanggal.day} ${tanggal.year}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Expanded(child: Container()),
            const Text(
              "15 Appointments",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}

class DashboardHeadTablet extends StatelessWidget {
  const DashboardHeadTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tanggal = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Welcome,",
                          style: TextStyle(
                            // fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16, fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Dr. Lorem Ipsum",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Text(
                      "${DateFormat("MMMM").format(tanggal)}, ${tanggal.day} ${tanggal.year}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white, width: 2),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "15 Appointments",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        Image(
          height: MediaQuery.of(context).size.height * 0.2,
          image: const AssetImage("assets/logo/logobiru.png"),
        ),
      ],
    );
  }
}
