import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_code/models/attendanceModel.dart';

class AttendanceCounter extends StatefulWidget {
  const AttendanceCounter({super.key});

  @override
  State<AttendanceCounter> createState() => _AttendanceCounterState();
}

class _AttendanceCounterState extends State<AttendanceCounter> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
        child: Container(
          height: 155,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Attendance",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        color: Color.fromARGB(255, 243,223,254),
                        // boxShadow: [
                          // BoxShadow(
                          //   color: Colors.black26,
                          //   offset: Offset(0.0, 2.0),
                          //   blurRadius: 6.0,
                          // ),
                        // ],
                      ),
                      child: Center(
                        child: Text(
                          "Date till Today",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color.fromARGB(255, 114,87,192),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,10,0,5),
                              child: Text(
                                "${std.present}",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              "Present",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color.fromARGB(255, 114,87,192),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,10,0,5),
                              child: Text(
                                "${std.absent}",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              "Absent",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color.fromARGB(255, 114,87,192),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,10,0,5),
                              child: Text(
                                "${std.lateArrival}",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              "Late",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}