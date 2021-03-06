import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key, this.token = ""}) : super(key: key);

  final String token;
  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final PatientAPIVM patientApi = PatientAPIVM();
  TextEditingController idC = TextEditingController();
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  int id = 0;
  String nama = "";

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
            "Patient",
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
              //BUILDER HERE
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Semantics(
                  label: "searchID",
                  child: TextFormField(
                    controller: idC,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Iconify(
                          Ic.outline_search,
                          size: 25,
                          color: sett.cGrey2,
                        ),
                        onPressed: () {
                          setState(() {
                            nama = idC.text;
                          });
                        },
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
                  PatientBuilderAPI(
                    future: patientApi.getPatientsByNameAuthComplex(
                        widget.token, nama),
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
