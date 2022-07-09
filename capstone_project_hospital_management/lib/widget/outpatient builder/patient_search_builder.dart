import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/services/API/outpatient/cubit/outpatient_cubit.dart';
import 'package:capstone_project_hospital_management/widget/from_API/patient_single_list_api.dart';
import 'package:capstone_project_hospital_management/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBuilderCubit extends StatelessWidget {
  const PatientBuilderCubit({
    Key? key,
    this.limit = 0,
  }) : super(key: key);

  final int limit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OutpatientCubit(),
      child: BlocConsumer<OutpatientCubit, OutpatientState>(
        buildWhen: (context, state) {
          if (state is OutpatientSuccess ||
              state is OutpatientLoading ||
              state is OutpatientError) {
            return true;
          }
          return false;
        },
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
                  child: Text("${state.errorMessage}")),
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
          return Center(
            child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: GestureDetector(
                  // child: const Text("Nothing Here, click to refresh."),
                  child: Icon(
                    Icons.refresh,
                    size: 50,
                    color: sett.cPrimary,
                  ),
                  onTap: () {
                    context.read<OutpatientCubit>().fetchOutpatient();
                  },
                )),
          );
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
