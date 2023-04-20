import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/attendanceModel.dart';
import 'package:flutter_code/models/parentModel.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  ParentModel loggedInUser = ParentModel();

  final CollectionReference attendanceList = FirebaseFirestore.instance.collection('attendance');
  List attendanceObjects = [];
  List attendance = [];

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = ParentModel.fromMap(value.data());
      setState(() {
        // fetchCorrections();
        fetchAttendance();
      });
    });
  }
  
  Future getAttendanceObjects() async {
    try {
      await attendanceList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          Attendance attendance = Attendance();
          attendance = Attendance().fromMap(element.data());
          if (attendance.studentCode.toString() == this.loggedInUser.studentCode.toString()){
            attendanceObjects.add(attendance);
          }
        });
      });
      return attendanceObjects;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchAttendance() async {
    dynamic resultant = await getAttendanceObjects();
    if (resultant == null){
      print('Unable to retrieve');
    } else{
      setState(() {
        attendanceObjects = resultant;
        attendanceObjects.sort((m1, m2) {
          var r = m1.dueDate.compareTo(m2.dueDate);
          return r;
        });
        // attendance = new List.from(attendanceObjects.reversed);
        attendance = attendanceObjects;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance',
        style: TextStyle(fontSize: 24),),
        backgroundColor: Color.fromARGB(255, 189, 101, 237),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 24, 16, 16),
            child: Text(
              'Log',
              // style: Theme.of(context).textTheme.headline5,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,

            ),
          ),
          Divider(thickness: 2),
          SizedBox(
            // height: 300.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: attendance.length > 10 ? 5 : attendance.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // title: Text(attendance[index].header.toString()),
                  title: Text('${attendance[index].dueDate}',style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  trailing: Text(
                    // 'Missing',
                    attendance[index].status.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: attendance[index].status == 'Present' ? Colors.green : 
           attendance[index].status == 'Absent' ? Colors.red :
           Colors.orange, // Change this to the third color you want to use
                    ),
                  ),
                );
              },
            ),
          ),
         
        ],
      ),
    );
  }
}
