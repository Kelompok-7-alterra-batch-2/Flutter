import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
// ignore: unused_import
import 'package:capstone_project_hospital_management/model/patient.dart';
import 'package:capstone_project_hospital_management/screen/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetailPageAPI extends StatefulWidget {
  const PatientDetailPageAPI({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final OutpatientModel patient;
  @override
  State<PatientDetailPageAPI> createState() => _PatientDetailPageAPIState();
}

class _PatientDetailPageAPIState extends State<PatientDetailPageAPI> {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _diagnoseController = TextEditingController();
  final TextEditingController _prescriptionController = TextEditingController();
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
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return const PatientPage();
                // }));
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: sett.cGrey15,
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: MediaQuery.of(context).size.width > 770
                    ? MediaQuery.of(context).size.width * 0.2
                    : MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: Text("Update Patient Data", style: sett.body3),
                  ),
                ),
                ColumnData(
                  labelName: "ID Patient",
                  idSemantics: "patientIDField",
                  hintText: "${widget.patient.patient!.id}",
                ),
                ColumnData(
                  labelName: "Name",
                  idSemantics: "NameField",
                  hintText: "${widget.patient.patient!.name}",
                ),
                ColumnData(
                  labelName: "Date of Birth",
                  idSemantics: "DOBField",
                  hintText: "${widget.patient.patient!.dob}",
                ),
                ColumnData(
                  labelName: "Phone Number",
                  idSemantics: "Phone Number",
                  hintText: "${widget.patient.patient!.phoneNumber}",
                ),
                ColumnData(
                  labelName: "Address",
                  idSemantics: "AddressField",
                  hintText: "${widget.patient.patient!.address}",
                ),
                ColumnData(
                  labelName: "Gender",
                  idSemantics: "GenderField",
                  hintText: "${widget.patient.patient!.gender!.type}",
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Diagnosis",
                          style: sett.body3,
                        ),
                      ),
                      Semantics(
                        label: "diagnosisId",
                        child: TextFormField(
                          controller: _diagnoseController,
                          enabled: true,
                          maxLines: 3,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            filled: true,
                            fillColor: sett.cGrey15,
                            hintStyle: const TextStyle(fontSize: 14),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sett.cGrey15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sett.cGrey17),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sett.cNeutral),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sett.isTablet ? 30 : 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Prescription",
                          style: sett.body3,
                        ),
                      ),
                      Semantics(
                        label: "prescriptionId",
                        child: TextFormField(
                          controller: _prescriptionController,
                          enabled: true,
                          maxLines: 3,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            filled: true,
                            fillColor: sett.cGrey15,
                            hintStyle: const TextStyle(fontSize: 14),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sett.cGrey15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sett.cGrey17),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: sett.cNeutral),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sett.isTablet ? 30 : 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: sett.cPrimary,
                    ),
                    onPressed: () {
                      if (_diagnoseController.text.trim() == "" ||
                          _prescriptionController.text.trim() == "") {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Warning",
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: const Text(
                                    "You must fill the diagnose and prescription column before update!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("ok"),
                                  ),
                                ],
                              );
                            });
                      } else {
                        showAlertDialog(
                            context,
                            widget.patient,
                            _diagnoseController.text.toString(),
                            _prescriptionController.text.toString());
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontFamily: "Lato", fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, OutpatientModel patient,
      String diagnose, String prescription) {
    // set up the buttons
    final PatientAPIVM _patientApi = PatientAPIVM();
    late SharedPreferences pref;
    Widget cancelButton = ElevatedButton(
      child: Text(
        "No",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: sett.cPrimary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      child: const Text(
        "Yes",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: sett.cPrimary,
      ),
      onPressed: () async {
        pref = await SharedPreferences.getInstance();
        String tokens = pref.getString('token') ?? "";
        String emails = pref.getString('email') ?? "";
        if (tokens != "" && tokens != " ") {
          _patientApi.updateOutpatientDiagnoseAuth(
            patient.id,
            token: tokens,
            diagnose: diagnose,
            prescription: prescription,
          );
          _patientApi
              .updateOutpatientToDoneAuth(patient.id, tokens)
              .then((value) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return DashboardPage(
                token: tokens,
                email: emails,
              );
            }));
            // Navigator.pop(context);
          });
        }
        // dbPatient.updatePatient(patient);
        // debugPrint(patient.toString());
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Iconify(
              EmojioneMonotone.information,
              color: sett.cPrimary,
              size: MediaQuery.of(context).size.height * 0.03,
            ),
          ),
          Text(
            "Confirmation",
            style: sett.body2,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Are you sure this data is correct?",
            textAlign: TextAlign.center,
            style: sett.body6,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              continueButton,
              const SizedBox(
                width: 30,
              ),
              cancelButton,
            ],
          )
        ],
      ),
      contentPadding: const EdgeInsets.all(20),
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ColumnData extends StatelessWidget {
  const ColumnData({
    Key? key,
    required this.labelName,
    required this.idSemantics,
    required this.hintText,
    this.isEnabled = false,
    this.isFilled = true,
    this.maxLine = 1,
    this.isFocused = false,
  }) : super(key: key);

  final String labelName;
  final String idSemantics;
  final String hintText;
  final bool isEnabled;
  final bool isFilled;
  final bool isFocused;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              labelName,
              style: sett.body3,
            ),
          ),
          Semantics(
            label: idSemantics,
            child: TextFormField(
              enabled: isEnabled,
              // initialValue: initValue,
              maxLines: maxLine,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                filled: isFilled,
                fillColor: isFocused ? sett.cGrey15 : sett.cGrey16,
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 14),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: sett.cGrey15),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: sett.cGrey17),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: sett.cNeutral),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sett.isTablet ? 30 : 10,
          ),
        ],
      ),
    );
  }
}
