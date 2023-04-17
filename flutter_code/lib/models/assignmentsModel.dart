import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class Assignment {
  String? assignmentid;
  String? studentCode;
  String? header;
  String? dueDate;
  String? status;
  String? grade;

  Assignment({this.assignmentid, this.studentCode, this.header, this.dueDate, this.status, this.grade});

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'assignmentid': assignmentid,
      'studentCode': studentCode,
      'header': header,
      'dueDate': dueDate,
      'status': status,
      'grade': grade
    };
  }

  Assignment fromMap(map) {
    var tempDate = DateTime.fromMillisecondsSinceEpoch(map['dueDate'].seconds * 1000);
    String strDate = DateFormat('yMMMMd').format(tempDate);
    String gradeOfAssignment = '';
    if (map['status'].toString() == "graded"){
      gradeOfAssignment = map['grade'].toString();
    }
    else if (map['status'].toString() == "pending"){
      gradeOfAssignment = "Pending";
    }
    else if (map['status'].toString() == "missing"){
      gradeOfAssignment = "Missing";
    }
    return Assignment(
      assignmentid: map['assignmentid'],
      studentCode: map['studentCode'],
      header: map['header'],
      dueDate: strDate,
      status: map['status'],
      grade: gradeOfAssignment
    );
  }

}

