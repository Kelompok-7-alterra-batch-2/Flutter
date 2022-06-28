import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_single_list_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';

class PatientBuilderAPI extends StatelessWidget {
  const PatientBuilderAPI({
    Key? key,
    required this.future,
    this.limit = 0,
  }) : super(key: key);

  final Future<List<OutpatientModel>> future;
  final int limit;
  @override
  Widget build(BuildContext context) {
    int adaOutpatient = 0;
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
            if (a.outpatientCondition!.conditions != "done") {
              adaOutpatient++;
            }
          }
        }

        if (adaOutpatient <= 0) {
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

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: limit == 0
                ? snapshot.data!.length
                : snapshot.data!.length < limit
                    ? snapshot.data!.length
                    : limit,
            itemBuilder: (context, index) {
              final patients = snapshot.data![index];

              if (patients.outpatientCondition!.conditions == "done") {
                return const SizedBox.shrink();
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
    child: PatientSingleListAPI(
      patient: patient,
    ),
  );
}
