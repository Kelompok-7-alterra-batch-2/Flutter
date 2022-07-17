import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_done_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';

class PatientDonePage extends StatefulWidget {
  const PatientDonePage({Key? key, this.token = ""}) : super(key: key);

  final String token;
  @override
  State<PatientDonePage> createState() => _PatientDonePageState();
}

class _PatientDonePageState extends State<PatientDonePage> {
  final PatientAPIVM patientApi = PatientAPIVM();

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: Semantics(
            label: "Tombol kembali",
            child: IconButton(
              icon: const Icon(Icons.navigate_before),
              onPressed: () {
                Navigator.pop(context);
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
                ? const EdgeInsets.all(40)
                : const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Column(
                children: [
                  PatientBuilderDoneAPI(
                    future: patientApi.getPatientsAuth(widget.token),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
