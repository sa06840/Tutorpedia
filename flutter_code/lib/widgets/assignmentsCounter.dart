import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/studentModel.dart';

class AssignmentsCounter extends StatefulWidget {
  const AssignmentsCounter({super.key});

  @override
  State<AssignmentsCounter> createState() => _AssignmentsCounterState();
}

class _AssignmentsCounterState extends State<AssignmentsCounter> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
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
                      onTap: () {},
                      child: Text(
                        "My Inbox",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 35.0,
                    //   width: 175,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    //     color: Color.fromARGB(255, 243,223,254),
                    //     // boxShadow: [
                    //       // BoxShadow(
                    //       //   color: Colors.black26,
                    //       //   offset: Offset(0.0, 2.0),
                    //       //   blurRadius: 6.0,
                    //       // ),
                    //     // ],
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Date till Today",
                    //       style: TextStyle(
                    //         fontSize: 16.0,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 22, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color:  Color.fromARGB(255, 216, 241, 204),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,10,0,5),
                              child: Text(
                                "${std.numberofAssignments}",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Color.fromARGB(255, 46,137,1)
                                ),
                              ),
                            ),
                            Text(
                              "Assignments",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 46,137,1)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color.fromARGB(255, 255,228,195),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,10,0,5),
                              child: Text(
                                "${std.numberofCorrections}",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Color.fromARGB(255, 251,137,1)
                                ),
                              ),
                            ),
                            Text(
                              "Corrections",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 251,137,1)
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