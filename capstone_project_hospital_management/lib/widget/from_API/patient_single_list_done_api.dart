import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/screen/patient/detail/patient_detail_api.dart';
import 'package:capstone_project_hospital_management/screen/patient/detail/patient_detail_api_done.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';

class PatientSingleListAPIDone extends StatelessWidget {
  const PatientSingleListAPIDone({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final OutpatientModel patient;
  @override
  Widget build(BuildContext context) {
    debugPrint(patient.toString());
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
        color: sett.cGrey4,
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
                "${patient.queue}",
                style: sett.body3d,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            // padding: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Text(
                  "${patient.patient!.name}",
                  style: sett.body5d,
                ),
                Expanded(child: Container()),
                Text(
                  "${patient.appointmentReason}",
                  style: sett.body6d,
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
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PatientDetailPageDoneAPI(
                      patient: patient,
                    );
                  }));
                },
                icon: Icon(
                  Icons.navigate_next,
                  color: sett.cDone,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
