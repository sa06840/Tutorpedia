// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_code/models/announcementsModel.dart';

// class Database {

//   Future getAnnouncementsList() async {
//     final CollectionReference announcementsList = FirebaseFirestore.instance.collection('announcements');
//     List announcements = [];
//     List announcementObjects = [];

//     try {
//       await announcementsList.get().then((querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           Announcement announcement = Announcement();
//           announcement = Announcement().fromMap(element.data());
//           announcementObjects.add(announcement);
//         });
//       });
//       if (announcementObjects == null){
//         print('Unable to retrieve');
//         return null;
//       } else{
//         announcementObjects.sort((m1, m2) {
//           var r = m1.date.compareTo(m2.date);
//           return r;
//         });
//         announcements = new List.from(announcementObjects.reversed);
//         return announcements;
//       }
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }


// }
