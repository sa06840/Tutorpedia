import 'package:intl/intl.dart';

class Correction {
  String? correctionid;
  String? studentCode;
  String? header;
  String? dueDate;

  Correction({this.correctionid, this.studentCode, this.header, this.dueDate});

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'correctionid': correctionid,
      'studentCode': studentCode,
      'header': header,
      'dueDate': dueDate,
    };
  }

  Correction fromMap(map) {
    var tempDate = DateTime.fromMillisecondsSinceEpoch(map['dueDate'].seconds * 1000);
    String strDate = DateFormat('yMMMMd').format(tempDate);
    return Correction(
      correctionid: map['correctionid'],
      studentCode: map['studentCode'],
      header: map['header'],
      dueDate: strDate,
    );
  }

}