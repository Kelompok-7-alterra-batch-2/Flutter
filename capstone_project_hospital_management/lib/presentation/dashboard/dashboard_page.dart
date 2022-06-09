// ignore_for_file: avoid_unnecessary_containers

import 'package:capstone_project_hospital_management/presentation/drawer/drawer_navigation.dart';
import 'package:capstone_project_hospital_management/widget/patient_single_list.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // testing

  @override
  Widget build(BuildContext context) {
    sett.isTablet = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          flexibleSpace: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: sett.isTablet
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
                    vertical: sett.isTablet ? 20 : 40,
                  ),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  // color: sett.cPrimary,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      sett.cPrimary,
                      sett.cPrimary,
                      Colors.white,
                    ],
                  )),
                  child: Center(
                    // child: DashboardHeadTablet(),
                    child: sett.isTablet
                        ? DashboardHeadTablet()
                        : DashboardHeadAndroid(),
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
                          const Text(
                            "Patients Today",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                // color: Colors.white,
                                fontSize: 18),
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
                      Column(children: const [
                        PatientSingleList(),
                        PatientSingleList()
                      ]),
                    ],
                  ),
                ),
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
            const Text(
              "May, 22 2022",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    const Text(
                      "May, 22 2022",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.white, width: 2),
                )),
              ),
              SizedBox(
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
