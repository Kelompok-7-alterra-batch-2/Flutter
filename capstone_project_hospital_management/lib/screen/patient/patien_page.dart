import 'package:capstone_project_hospital_management/screen/dashboard/dashboard_page.dart';
import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/screen/vm/patient_view_model.dart';
import 'package:capstone_project_hospital_management/services/API/outpatient/cubit/outpatient_cubit.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_api.dart';
import 'package:capstone_project_hospital_management/widget/outpatient%20builder/patient_search_builder.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key, this.token = ""}) : super(key: key);

  final String token;
  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final PatientVM patientvm = PatientVM();
  final PatientAPIVM patientApi = PatientAPIVM();
  TextEditingController idC = TextEditingController();
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    late SharedPreferences pref;
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
                //   return const DashboardPage();
                // }));
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Iconify(
                          Ic.outline_search,
                          size: 25,
                          color: sett.cGrey2,
                        ),
                        onPressed: () async {
                          // pref = await SharedPreferences.getInstance();
                          // String tokenS = pref.getString('token') ?? "";
                          // if (tokenS != "" && tokenS != " ") {
                          //   context
                          //       .read<OutpatientCubit>()
                          //       .fetchOutpatient(int.parse(idC.text), tokenS);
                          // }
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
                    future: patientApi.getPatientsAuth(widget.token),
                  ),
                  // PatientBuilderCubit(
                  //   token: widget.token,
                  // ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
