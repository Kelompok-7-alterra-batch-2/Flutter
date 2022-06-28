import 'package:capstone_project_hospital_management/presentation/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/presentation/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/presentation/vm/patient_view_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_done_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:capstone_project_hospital_management/widget/temp%20feature/patient_done_builder.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class PatientDonePage extends StatefulWidget {
  const PatientDonePage({Key? key}) : super(key: key);

  @override
  State<PatientDonePage> createState() => _PatientDonePageState();
}

class _PatientDonePageState extends State<PatientDonePage> {
  final PatientVM patientvm = PatientVM();
  final PatientAPIVM patientApi = PatientAPIVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: Semantics(
          label: "Tombol kembali",
          child: IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const DashboardPage();
              }));
            },
          ),
        ),
        title: const Text(
          "Finished Consultation Patient",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: sett.cGrey15,
          padding: MediaQuery.of(context).size.width > 770
              ? EdgeInsets.all(40)
              : EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Semantics(
                label: "searchID",
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Iconify(
                        Ic.outline_search,
                        size: 25,
                        color: sett.cGrey2,
                      ),
                      onPressed: () {},
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search Here',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: sett.cGrey15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: sett.cGrey2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                PatientBuilderDoneAPI(
                  future: patientApi.getPatients(),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
