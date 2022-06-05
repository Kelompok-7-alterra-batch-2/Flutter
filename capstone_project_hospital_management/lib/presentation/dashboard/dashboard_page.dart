// ignore_for_file: avoid_unnecessary_containers

import 'package:capstone_project_hospital_management/presentation/drawer/drawer_navigation.dart';
import 'package:capstone_project_hospital_management/widget/patient_single_list.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height * 0.05,
                image: const AssetImage("assets/logo/logo.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Care Hospital",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
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
                  padding: const EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: const Color(0xff4e89a8),
                  child: Center(
                    child: Column(
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
                            // Text(
                            //   "May, 22 2022",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w600,
                            //       color: Colors.white,
                            //       fontSize: 18),
                            // ),
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
                    ),
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
