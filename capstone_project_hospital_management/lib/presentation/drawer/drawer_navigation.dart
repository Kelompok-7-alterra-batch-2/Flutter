import 'package:capstone_project_hospital_management/presentation/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/presentation/patient/patien_page.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/clarity.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: [
                Image(
                  height: MediaQuery.of(context).size.height * 0.08,
                  image: const AssetImage("assets/logo/logo.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Care Hospital",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          drawerItem(
              icon: Iconify(Ic.baseline_dashboard),
              text: 'Dashboard',
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return DashboardPage();
                }));
              }),
          drawerItem(
              icon: Iconify(Fluent.patient_20_filled),
              text: 'Patient',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PatientPage();
                }));
              }),
          drawerItem(
              icon: Iconify(Ic.settings),
              text: 'Setting',
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return LoginPage();
                // }));
              }),
          drawerItem(
              icon: Iconify(
                Ic.twotone_log_out,
              ),
              text: 'Log Out',
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return LoginPage();
                // }));
              }),
        ],
      ),
    );
  }
}

Widget drawerItem(
    {required Iconify icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        icon,
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
