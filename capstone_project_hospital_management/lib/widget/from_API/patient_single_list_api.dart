import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/screen/patient/detail/patient_detail_api.dart';
import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PatientSingleListAPI extends StatelessWidget {
  PatientSingleListAPI({
    Key? key,
    required this.patient,
    this.antrian = 0,
  }) : super(key: key);

  late SharedPreferences pref;

  final OutpatientModel patient;
  final PatientAPIVM patientApi = PatientAPIVM();
  final int antrian;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width > 770
          ? MediaQuery.of(context).size.height * 0.08
          : MediaQuery.of(context).size.height * 0.12,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset.fromDirection(1),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width > 770
                ? MediaQuery.of(context).size.height * 0.05
                : MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width > 770
                ? MediaQuery.of(context).size.height * 0.05
                : MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: sett.cPrimary.withOpacity(0.25),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                // "${patient.queue}",
                "$antrian",
                style: sett.body3p,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Text(
                  patient.patient!.name!.length > 20
                      ? "${patient.patient!.name!.substring(0, 14)}..."
                      : "${patient.patient!.name}",
                  style: sett.body5,
                ),
                Expanded(child: Container()),
                Text(
                  patient.appointmentReason!.length > 15
                      ? "${patient.appointmentReason!.substring(0, 10)}..."
                      : "${patient.appointmentReason}",
                  style: sett.body6,
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          Expanded(child: Container()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.height * 0.06,
            child: Semantics(
              label: "goDetailId",
              child: IconButton(
                  onPressed: () async {
                    pref = await SharedPreferences.getInstance();
                    String token = pref.getString("token") ?? "";
                    if (token != " " && token != "") {
                      patientApi.updateOutpatientToProcessAuth(
                          patient.id, token);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PatientDetailPageAPI(
                          patient: patient,
                        );
                      }));
                    }
                  },
                  icon: const Icon(Icons.navigate_next)),
            ),
          ),
        ],
      ),
    );
  }
}
