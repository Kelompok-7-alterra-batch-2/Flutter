import 'package:capstone_project_hospital_management/widget/dashboard/dashboard_card.dart';
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
                height: MediaQuery.of(context).size.height * 0.3,
                color: const Color(0xff4e89a8),
              ),
              SizedBox(
                height: 30,
              ),
              DashboardCard(),
              DashboardCard(),
            ],
          ),
        ),
      ),
    );
  }
}
