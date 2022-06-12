import 'package:capstone_project_hospital_management/model/mock_patient.dart';
import 'package:capstone_project_hospital_management/presentation/patient/patien_page.dart';
import 'package:capstone_project_hospital_management/services/database/mock_sqlite.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:sqflite/sqflite.dart';

class PatientDetailPageDummy extends StatefulWidget {
  PatientDetailPageDummy({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final MockPatient patient;
  @override
  State<PatientDetailPageDummy> createState() => _PatientDetailPageDummyState();
}

class _PatientDetailPageDummyState extends State<PatientDetailPageDummy> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _diagnoseController = TextEditingController();
  final TextEditingController _prescriptionController = TextEditingController();
  final DatabasePatient dbPatient = DatabasePatient();
  @override
  Widget build(BuildContext context) {
    final date = widget.patient.doB;
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
                return const PatientPage();
              }));
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
                padding: EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Text("Update Patient Data", style: sett.body3),
                ),
              ),
              ColumnData(
                labelName: "Name",
                idSemantics: "NameField",
                hintText: widget.patient.name,
              ),
              ColumnData(
                labelName: "Date of Birth",
                idSemantics: "DOBField",
                hintText: "${date.day}/${date.month}/${date.year}",
              ),
              ColumnData(
                labelName: "Address",
                idSemantics: "AddressField",
                hintText: widget.patient.address,
              ),
              ColumnData(
                labelName: "Gender",
                idSemantics: "GenderField",
                hintText: widget.patient.gender,
              ),
              // ColumnData(
              //   labelName: "Diagnosis",
              //   idSemantics: "Diagnosis",
              //   hintText: "",
              //   isEnabled: true,
              //   maxLine: 2,
              //   isFocused: true,
              // ),
              // ColumnData(
              //   labelName: "Prescription",
              //   idSemantics: "Prescription",
              //   hintText: "",
              //   isEnabled: true,
              //   maxLine: 2,
              //   isFocused: true,
              // ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Diagnosis",
                        style: sett.body3,
                      ),
                    ),
                    Semantics(
                      label: "diagnosisId",
                      child: TextFormField(
                        controller: _diagnoseController,
                        // initialValue: widget.patient.diagnosis == null
                        //     ? "yet"
                        //     : widget.patient.diagnosis,
                        enabled: true,
                        maxLines: 3,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          filled: true,
                          fillColor: sett.cGrey15,
                          hintStyle: TextStyle(fontSize: 14),
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
                margin: EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
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
                        // initialValue: widget.patient.prescription == null
                        //     ? "yet"
                        //     : widget.patient.prescription,
                        maxLines: 3,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          filled: true,
                          fillColor: sett.cGrey15,
                          hintStyle: TextStyle(fontSize: 14),
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
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sett.cPrimary,
                  ),
                  onPressed: () {
                    widget.patient.diagnosis = _diagnoseController.text;
                    widget.patient.prescription = _prescriptionController.text;
                    showAlertDialog(context, widget.patient);
                  },
                  child: Text(
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
    );
  }

  showAlertDialog(BuildContext context, MockPatient patient) {
    // set up the buttons
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
      child: Text(
        "Yes",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: sett.cPrimary,
      ),
      onPressed: () {
        dbPatient.updatePatient(patient);
        debugPrint(patient.toString());
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const PatientPage();
        }));
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
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              continueButton,
              SizedBox(
                width: 30,
              ),
              cancelButton,
            ],
          )
        ],
      ),
      contentPadding: EdgeInsets.all(20),
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
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
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
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                filled: isFilled,
                fillColor: isFocused ? sett.cGrey15 : sett.cGrey16,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14),
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
