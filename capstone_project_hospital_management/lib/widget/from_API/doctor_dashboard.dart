import 'package:capstone_project_hospital_management/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorDashboardAndroid extends StatelessWidget {
  const DoctorDashboardAndroid({
    Key? key,
    required this.future,
    required this.futureCount,
  }) : super(key: key);

  final Future<DoctorModel> future;
  final Future<int> futureCount;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DoctorModel>(
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
        DateTime tanggal = DateTime.now();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.58,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome,",
                        style: TextStyle(
                            // fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.name!.length > 15
                            ? "Dr. ${snapshot.data!.name!.substring(0, 14)}..."
                            : "Dr. ${snapshot.data!.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Image(
                  height: MediaQuery.of(context).size.height * 0.12,
                  image: const AssetImage("assets/logo/Vector.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${DateFormat("MMMM").format(tanggal)}, ${tanggal.day} ${tanggal.year}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Expanded(child: Container()),
                FutureBuilder<int>(
                    future: futureCount,
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
                      return Text(
                        "${snapshot.data} Appointments",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      );
                    })
              ],
            ),
          ],
        );
      },
    );
  }
}

class DoctorDashboardTablet extends StatelessWidget {
  const DoctorDashboardTablet({
    Key? key,
    required this.future,
    required this.futureCount,
  }) : super(key: key);

  final Future<DoctorModel> future;
  final Future<int> futureCount;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DoctorModel>(
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

        var tanggalT = DateTime.now();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Welcome,",
                            style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16, fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            snapshot.data!.name!.length > 15
                                ? "Dr. ${snapshot.data!.name!.substring(0, 14)}..."
                                : "Dr. ${snapshot.data!.name}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Text(
                        "${DateFormat("MMMM").format(tanggalT)}, ${tanggalT.day} ${tanggalT.year}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.white, width: 2),
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<int>(
                    future: futureCount,
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
                      return Text(
                        "${snapshot.data} Appointments",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      );
                    })
              ],
            ),
            Expanded(child: Container()),
            Image(
              height: MediaQuery.of(context).size.height * 0.2,
              image: const AssetImage("assets/logo/logobiru.png"),
            ),
          ],
        );
      },
    );
  }
}
