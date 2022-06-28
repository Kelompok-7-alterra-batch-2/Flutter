import 'package:capstone_project_hospital_management/presentation/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/presentation/login/login_page_alt.dart';
import 'package:capstone_project_hospital_management/presentation/patient/patien_page.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/ic.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sett.cPrimary,
      child: ListView(
        padding: const EdgeInsets.symmetric(/*horizontal: 20,*/ vertical: 20),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: MediaQuery.of(context).size.width > 770
                        ? MediaQuery.of(context).size.height * 0.05
                        : MediaQuery.of(context).size.height * 0.08,
                    image: const AssetImage("assets/logo/Vector.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Care Hospital",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  // garis bawah
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.white, width: 1),
            )),
          ),
          drawerItem(
              icon: const Iconify(
                Ic.baseline_dashboard,
                color: Colors.white,
              ),
              text: 'Dashboard',
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const DashboardPage();
                }));
              }),
          drawerItem(
              icon: const Iconify(
                Fluent.patient_20_filled,
                color: Colors.white,
              ),
              text: 'Patient',
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const PatientPage();
                }));
              }),
          drawerItem(
              icon: const Iconify(
                Ic.settings,
                color: Colors.white,
              ),
              text: 'Setting',
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return LoginPage();
                // }));
              }),
          drawerItem(
              icon: const Iconify(
                Ic.twotone_log_out,
                color: Colors.white,
              ),
              text: 'Log Out',
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginPageAlt();
                }));
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
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: sett.body2wh,
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}