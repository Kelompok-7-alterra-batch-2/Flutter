import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {Key? key,
      this.icon = Icons.calendar_month_outlined,
      this.total = 0,
      this.information = "Appointments"})
      : super(key: key);

  final icon;
  final int total;
  final String information;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.height * 0.05,
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 0.05, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 2), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: icon is Icon
                      ? Icon(
                          icon,
                          size: MediaQuery.of(context).size.height * 0.06,
                        )
                      : FaIcon(
                          icon,
                          size: MediaQuery.of(context).size.height * 0.055,
                        ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$total",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        information,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size.fromHeight(5),
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Today",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
