import 'package:capstone_project_hospital_management/widget/dashboard/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height * 0.05,
                image: const AssetImage("assets/logo/logo.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Care Hospital",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height * 0.3,
                color: const Color(0xff4e89a8),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.58,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                          Text(
                            "May, 22 2022",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
                        )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DashboardCard(total: 145),
              DashboardCard(
                total: 45,
                icon: FontAwesomeIcons.userDoctor,
                information: "Doctors",
              ),
              // DashboardCard(),
              DashboardCard(
                total: 5,
                icon: FontAwesomeIcons.truckMedical,
                information: "Emergency Room",
              ),
              // DashboardCard(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              )
            ],
          ),
        ),
      ),
    );
  }
}
