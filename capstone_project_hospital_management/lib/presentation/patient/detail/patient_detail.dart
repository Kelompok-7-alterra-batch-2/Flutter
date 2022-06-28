import 'package:capstone_project_hospital_management/presentation/patient/patien_page.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';

class PatientDetailPage extends StatefulWidget {
  const PatientDetailPage({Key? key}) : super(key: key);

  @override
  State<PatientDetailPage> createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
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
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Text("Update Patient Data", style: sett.body3),
                ),
              ),
              const ColumnData(
                labelName: "Name",
                idSemantics: "NameField",
                hintText: "Wanda Maximoff",
              ),
              const ColumnData(
                labelName: "Date of Birth",
                idSemantics: "DOBField",
                hintText: "10/08/1996",
              ),
              const ColumnData(
                labelName: "Address",
                idSemantics: "AddressField",
                hintText: "Jl. Mawar 4 No. 10, Jakarta Barat",
              ),
              const ColumnData(
                labelName: "Gender",
                idSemantics: "GenderField",
                hintText: "Female",
              ),
              const ColumnData(
                labelName: "Diagnosis",
                idSemantics: "Diagnosis",
                hintText: "",
                isEnabled: true,
                maxLine: 2,
                isFocused: true,
              ),
              const ColumnData(
                labelName: "Prescription",
                idSemantics: "Prescription",
                hintText: "",
                isEnabled: true,
                maxLine: 2,
                isFocused: true,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: sett.cPrimary,
                  ),
                  onPressed: () {
                    showAlertDialog(context);
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
    );
  }

  showAlertDialog(BuildContext context) {
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
      onPressed: () {},
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
