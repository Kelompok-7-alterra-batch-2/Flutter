import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/screen/vm/patient_api_view_model.dart';
import 'package:capstone_project_hospital_management/services/API/outpatient/cubit/outpatient_cubit.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_builder_api.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_single_list_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBuilderCubit extends StatelessWidget {
  const PatientBuilderCubit({
    Key? key,
    this.limit = 0,
    this.token = "",
  }) : super(key: key);

  final int limit;
  final String token;
  @override
  Widget build(BuildContext context) {
    final PatientAPIVM patientAPIVM = PatientAPIVM();
    return BlocProvider(
      create: (context) => OutpatientCubit(),
      child: BlocConsumer<OutpatientCubit, OutpatientState>(
        listener: (context, state) {
          if (state is OutpatientError) {
            debugPrint("error : ${state.errorMessage}");
          } else if (state is OutpatientLoading) {
            debugPrint("Loading...");
          } else if (state is OutpatientSuccess) {
            debugPrint("Fetch data Success");
          }
        },
        builder: (context, state) {
          int adaOutpatient = 0;
          int buildLimit = 0;

          if (state is OutpatientLoading) {
            return Center(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: const CircularProgressIndicator()),
            );
          } else if (state is OutpatientError) {
            return Center(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(state.errorMessage)),
            );
          } else if (state is OutpatientSuccess) {
            if (state.outpatientList.isNotEmpty) {
              for (var a in state.outpatientList) {
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

            int limited = limit == 0 ? state.outpatientList.length : limit;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.outpatientList.length,
                itemBuilder: (context, index) {
                  final patients = state.outpatientList[index];

                  if (patients.outpatientCondition!.conditions == "done" ||
                      buildLimit == limited) {
                    return const SizedBox.shrink();
                  }

                  if (patients.outpatientCondition!.conditions != "done") {
                    buildLimit++;
                  }
                  return _buildPatientCard(patients, context);
                },
              ),
            );
          }

          return PatientBuilderAPI(future: patientAPIVM.getPatientsAuth(token));
        },
      ),
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
