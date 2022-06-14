import 'package:capstone_project_hospital_management/model/mock_patient.dart';
import 'package:capstone_project_hospital_management/widget/patient_single_list.dart';
import 'package:flutter/material.dart';

import 'patient_single_list_dummy.dart';

class PatientBuilder extends StatelessWidget {
  const PatientBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<MockPatient>> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MockPatient>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final patients = snapshot.data![index];

              if (patients.isDone == true) {
                return SizedBox.shrink();
              }
              return _buildPatientCard(patients, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildPatientCard(MockPatient mockPatient, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: PatientSingleListDummy(
        patient: mockPatient,
      ),
    );
  }
}
