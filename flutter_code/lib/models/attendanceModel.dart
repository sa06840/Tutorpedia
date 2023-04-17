// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

class Attendance {
  String? attendanceid;
  String? studentCode;
  String? dueDate;
  String? status;

  Attendance({this.attendanceid, this.studentCode, this.dueDate, this.status});

  // // sending data to our server
  // Map<String, dynamic> toMap() {
  //   return {
  //     'attendanceid': attendanceid,
  //     'studentCode': studentCode,
  //     'date': dueDate,
  //     'status': status,
  //   };
  // }

  Attendance fromMap(map) {
    var tempDate = DateTime.fromMillisecondsSinceEpoch(map['dueDate'].seconds * 1000);
    String strDate = DateFormat('yMMMMd').format(tempDate);
   
    return Attendance(
      attendanceid: map['attendanceid'],
      studentCode: map['studentCode'],
      dueDate: strDate,
      status: map['status'],
    );
  }
}
