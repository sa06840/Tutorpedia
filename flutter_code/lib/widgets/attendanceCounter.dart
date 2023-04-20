import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/attendanceModel.dart';
import 'package:flutter_code/models/parentModel.dart';
import 'package:flutter_code/screens/attendance.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as devtools show log;

class AttendanceCounter extends StatefulWidget {
  const AttendanceCounter({super.key});

  @override
  State<AttendanceCounter> createState() => _AttendanceCounterState();
}

class _AttendanceCounterState extends State<AttendanceCounter> {
  User? user = FirebaseAuth.instance.currentUser;
  ParentModel loggedInUser = ParentModel();

  final CollectionReference attendanceList =
      FirebaseFirestore.instance.collection('attendance');
  var num_present = 0;
  var num_absent = 0;
  var num_late = 0;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = ParentModel.fromMap(value.data());
      // devtools.log(this.loggedInUser.firstName.toString());
      setState(() {
        // fetchNumCorrections();
        fetchNumAttendance();
      });
    });
  }

  Future getAttendance() async {
    var num_present = 0;
    var num_absent = 0;
    var num_late = 0;
    try {
      await attendanceList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          Attendance attendance = Attendance();
          
          attendance = Attendance().fromMap(element.data());

          if (attendance.studentCode.toString() ==
              this.loggedInUser.studentCode.toString()) {
            if (attendance.status.toString() == "Present") {
              num_present += 1;
            } else if (attendance.status.toString() == "Absent") {
              num_absent += 1;
            } else if (attendance.status.toString() == "Late") {
              num_late += 1;
            }
          }
        });
      });
      
      return ([num_present, num_absent, num_late]);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchNumAttendance() async {
    dynamic resultant= await getAttendance();
    // devtools.log(numPresent.toString());
      // devtools.log(numAbsent.toString());
      devtools.log(resultant.toString());
    if (resultant[0] == null || resultant[1] == null || resultant[2]== null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        num_present = resultant[0];
        num_absent = resultant[1];
        num_late = resultant[2];
      });
    }
  }

  String currentDate = DateFormat('yMMMMd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
        child: GestureDetector(
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AttendanceScreen()),
              );
            },
          child: Container(
              height: 180,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttendanceScreen()),
                            );
                          },
                          child: Text(
                            "Attendance",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: 35.0,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            color: Color.fromARGB(255, 243, 223, 254),
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
                              // "Date till Today",
                              currentDate,
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
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Color.fromARGB(255, 216, 241, 204),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    num_present.toString(),
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Color.fromARGB(255, 46, 137, 1)),
                                  ),
                                ),
                                Text(
                                  "Present",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 46, 137, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Color.fromARGB(255, 255, 223, 231),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    num_absent.toString(),
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Color.fromARGB(255, 255, 2, 65)),
                                  ),
                                ),
                                Text(
                                  "Absent",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 255, 2, 65)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: Color.fromARGB(255, 255, 228, 195),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    num_late.toString(),
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Color.fromARGB(255, 251, 137, 1)),
                                  ),
                                ),
                                Text(
                                  "Late",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 251, 137, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
