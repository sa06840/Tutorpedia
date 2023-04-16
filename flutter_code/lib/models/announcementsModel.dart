// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

class Announcement {
  String? announcementid;
  String? header;
  String? body;
  String? date;

  Announcement({this.announcementid, this.header, this.body, this.date});

  // receiving data from server
  // factory Announcement.fromMap(map) {
  //   return Announcement(
  //     announcementid: map['announcementid'],
  //     header: map['header'],
  //     body: map['body'],
  //     date: map['date'],
  //   );
  // }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'announcementid': announcementid,
      'header': header,
      'body': body,
      'date': date,
    };
  }

  Announcement fromMap(map) {
    var tempDate = DateTime.fromMillisecondsSinceEpoch(map['date'].seconds * 1000);
    String strDate = DateFormat('yMMMMd').format(tempDate);
    return Announcement(
      announcementid: map['announcementid'],
      header: map['header'],
      body: map['body'],
      date: strDate,
    );
  }

}


// List<Announcement> announcementss = [
//   Announcement(
//     header: 'Announcement 1', 
//     date: 'March 25, 2023', 
//     body: 'jncjwniucen newncucni nwciniuc icuencunce cbkbcew jncjecec ionoejwncec   oncenc iocnoue'
//   ),
//   Announcement(
//     header: 'Announcement 2', 
//     date: 'March 26, 2023', 
//     body: 'jncjwniucen newncucni nwciniuc icuencunce'
//   ),
//   Announcement(
//     header: 'Announcement 3', 
//     date: 'March 28, 2023', 
//     body: 'jncjwniucen newncucni nwciniuc icuencunce'
//   ),
//   Announcement(
//     header: 'Announcement 4', 
//     date: 'March 28, 2023', 
//     body: 'jncjwniucen newncucni nwciniuc icuencunce'
//   ),
//   Announcement(
//     header: 'Announcement 5', 
//     date: 'March 31, 2023', 
//     body: 'jncjwniucen newncucni nwciniuc icuencunce'
//   ),
// ];