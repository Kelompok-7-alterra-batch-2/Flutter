import 'package:capstone_project_hospital_management/presentation/patient/patien_page.dart';
import 'package:flutter/material.dart';

class PatientDetailPage extends StatefulWidget {
  const PatientDetailPage({Key? key}) : super(key: key);

  @override
  State<PatientDetailPage> createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  final _formKey = GlobalKey<FormState>();

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
          color: Colors.grey[300],
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Text(
                    "Update Patient Data",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ColumnData(
                labelName: "Name",
                idSemantics: "NameField",
                hintText: "Wanda Maximoff",
              ),
              ColumnData(
                labelName: "Date of Birth",
                idSemantics: "DOBField",
                hintText: "10/08/1996",
              ),
              ColumnData(
                labelName: "Address",
                idSemantics: "AddressField",
                hintText: "Jl. Mawar 4 No. 10, Jakarta Barat",
              ),
              ColumnData(
                labelName: "Gender",
                idSemantics: "GenderField",
                hintText: "Female",
              ),
              ColumnData(
                labelName: "Diagnosis",
                idSemantics: "Diagnosis",
                hintText: "write here...",
                isEnabled: true,
                maxLine: 4,
                isFocused: true,
              ),
              ColumnData(
                labelName: "Prescription",
                idSemantics: "Prescription",
                hintText: "write here...",
                isEnabled: true,
                maxLine: 4,
                isFocused: true,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff4e89a8),
                  ),
                  onPressed: () {},
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
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Semantics(
            label: idSemantics,
            child: TextFormField(
              enabled: isEnabled,
              maxLines: maxLine,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                filled: isFilled,
                fillColor: isFocused ? Colors.grey[400] : Colors.grey[200],
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
