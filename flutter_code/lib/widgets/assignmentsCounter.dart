import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/parentModel.dart';
import 'package:flutter_code/models/studentModel.dart';
import 'package:flutter_code/screens/assignments_corrections.dart';
import 'package:flutter_code/models/correctionModel.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as devtools show log;
import '../models/assignmentsModel.dart';

class AssignmentsCounter extends StatefulWidget {
  const AssignmentsCounter({super.key});

  @override
  State<AssignmentsCounter> createState() => _AssignmentsCounterState();
}

class _AssignmentsCounterState extends State<AssignmentsCounter> {

  User? user = FirebaseAuth.instance.currentUser;
  ParentModel loggedInUser = ParentModel();

  final CollectionReference correctionsList = FirebaseFirestore.instance.collection('corrections');
  var numberOfCorrections = 0;

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = ParentModel.fromMap(value.data());
      // devtools.log(this.loggedInUser.firstName.toString());
      setState(() {
        fetchNumCorrections();
        fetchNumAssignments();
      });
    });
  }

  Future getCorections() async {
    var numCorrections = 0;
    try {
      await correctionsList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          Correction correction = Correction();
          correction = Correction().fromMap(element.data());
          // devtools.log(this.loggedInUser.studentCode.toString());
          if (correction.studentCode.toString() == this.loggedInUser.studentCode.toString()){
            numCorrections += 1;
            
          }
        });
      });
      return numCorrections;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchNumCorrections() async {
    dynamic resultant = await getCorections();
    if (resultant == null){
      print('Unable to retrieve');
    } else{
      setState(() {
        numberOfCorrections = resultant;
      });
    }
  }

  final CollectionReference assignmentsList = FirebaseFirestore.instance.collection('assignments');
  var numberOfAssignments = 0;

  Future getAssignments() async {
    var numAssignments = 0;
    try {
      await assignmentsList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          Assignment assignment = Assignment();
          assignment = Assignment().fromMap(element.data());
          if (assignment.studentCode.toString() == this.loggedInUser.studentCode.toString()){
            numAssignments += 1;
          }
        });
      });
      return numAssignments;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchNumAssignments() async {
    dynamic resultant = await getAssignments();
    if (resultant == null){
      print('Unable to retrieve');
    } else{
      setState(() {
        numberOfAssignments = resultant;
      });
    }
  }

  String currentDate = DateFormat('yMMMMd').format(DateTime.now());  

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
        child: GestureDetector(
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AssignmentsAndCorrectionsScreen()),
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
                              builder: (context) => AssignmentsAndCorrectionsScreen()),
                        );
                      },
                        child: Text(
                          "My Inbox",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Container(
                        height: 35.0,
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
                                  // "${std.numberofAssignments}",
                                  numberOfAssignments.toString(),
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
                                  // "${std.numberofCorrections}",
                                  numberOfCorrections.toString(),
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
      ),
    );
  }
}