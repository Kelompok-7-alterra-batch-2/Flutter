// ignore_for_file: avoid_unnecessary_containers

import 'package:capstone_project_hospital_management/presentation/drawer/drawer_navigation.dart';
import 'package:capstone_project_hospital_management/presentation/patient/done/patient_done_page.dart';
import 'package:capstone_project_hospital_management/presentation/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/presentation/vm/patient_view_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_api.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_done_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // testing
  final PatientVM patientvm = PatientVM();
  final PatientAPIVM patientApi = PatientAPIVM();
  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).size.width > 700) {
    //   sett.isTablet = true;
    //   // _isTablet = true;
    //   // testing = true;
    //   debugPrint("ini tablet");
    // } else {
    //   sett.isTablet = false;
    //   // _isTablet = false;
    //   // testing = false;
    //   debugPrint("ini bukan tablet");
    // }
    return SafeArea(
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
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const DashboardPage();
                    }));
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
        drawer: const DrawerWidget(),
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
                    vertical: MediaQuery.of(context).size.width > 770 ? 20 : 40,
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

                // DashboardCard(total: 145),
                // DashboardCard(
                //   total: 45,
                //   icon: FontAwesomeIcons.userDoctor,
                //   information: "Doctors",
                // ),
                // // DashboardCard(),
                // DashboardCard(
                //   total: 5,
                //   icon: FontAwesomeIcons.truckMedical,
                //   information: "Emergency Room",
                // ),
                // DashboardCard(),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.03,
                // ),
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
                            onPressed: () {},
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
                      // Column(children: const [
                      //   PatientSingleList(),
                      //   PatientSingleList()
                      // ]),
                      // ShrinkWrappingViewport(
                      //   offset: ViewportOffset.zero(),
                      //   slivers: [
                      //     PatientBuilder(
                      //       future: patientvm.getPatients(),
                      //     ),
                      //   ],
                      // )

                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.3,
                      //   // height: double.infinity,
                      //   child: PatientBuilder(
                      //     future: patientvm.getPatients(),
                      //   ),
                      // ),
                      Column(
                        children: [
                          // PatientBuilder(
                          //   future: patientvm.getPatients(),
                          //   limit: 3,
                          // ),
                          // PAKE API
                          PatientBuilderAPI(
                            future: patientApi.getPatients(),
                            limit: 3,
                          )
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
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const PatientDonePage();
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
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.3,
                      //   // height: double.infinity,
                      //   child: PatientBuilderDone(
                      //     future: patientvm.getPatients(),
                      //   ),
                      // ),
                      Column(
                        children: [
                          // PatientBuilderDone(
                          //   future: patientvm.getPatients(),
                          //   limit: 3,
                          // ),
                          // PAKE API
                          PatientBuilderDoneAPI(
                            future: patientApi.getPatients(),
                            limit: 3,
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
