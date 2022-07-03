import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_single_list_done_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';

class PatientBuilderDoneAPI extends StatelessWidget {
  const PatientBuilderDoneAPI({
    Key? key,
    required this.future,
    this.limit = 0,
  }) : super(key: key);

  final Future<List<OutpatientModel>> future;
  final int limit;

  @override
  Widget build(BuildContext context) {
    int outpatientDone = 0;
    int buildLimit = 0;
    return FutureBuilder<List<OutpatientModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: const CircularProgressIndicator()),
          );
        }

        if (snapshot.data!.isNotEmpty) {
          for (var a in snapshot.data!) {
            if (a.outpatientCondition!.conditions == "done") {
              outpatientDone++;
            }
          }
        }

        if (outpatientDone <= 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Nothing Yet",
                  style: sett.body3d,
                ),
              ),
            ),
          );
        }
        int limited = limit == 0 ? snapshot.data!.length : limit;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            // itemCount: limit == 0
            //     ? snapshot.data!.length
            //     : snapshot.data!.length < limit
            //         ? snapshot.data!.length
            //         : limit,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final patients = snapshot.data![index];

              if (patients.outpatientCondition!.conditions != "done" ||
                  buildLimit == limited) {
                return const SizedBox.shrink();
              }

              if (patients.outpatientCondition!.conditions == "done") {
                buildLimit++;
              }

              return _buildPatientCard(patients, context);
            },
          ),
        );
      },
    );
  }
}

Widget _buildPatientCard(OutpatientModel patient, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: PatientSingleListAPIDone(
      patient: patient,
    ),
  );
}
