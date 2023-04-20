import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/announcementsModel.dart';
import 'package:flutter_code/screens/announcementDetails.dart';


class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {

  final CollectionReference announcementsList = FirebaseFirestore.instance.collection('announcements');
  List announcementsObjects = [];
  List announcements = [];

  @override
  void initState(){
    super.initState();
    fetchAnnouncementsList();
  }

  Future getAnnouncementsList() async {
    try {
      await announcementsList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          Announcement announcement = Announcement();
          announcement = Announcement().fromMap(element.data());
          announcementsObjects.add(announcement);
        });
      });
      return announcementsObjects;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchAnnouncementsList() async {
    dynamic resultant = await getAnnouncementsList();
    if (resultant == null){
      print('Unable to retrieve');
    } else{
      setState(() {
        announcementsObjects= resultant;
        announcementsObjects.sort((m1, m2) {
          var r = m1.date.compareTo(m2.date);
          return r;
        });
        announcements = new List.from(announcementsObjects.reversed);
      });
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            // color: Color.fromARGB(255, 243,243,247)
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 244, 169, 203),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 235, 235, 235),
              // Colors.white,
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Announcements', style: TextStyle(fontSize: 24.0)),
            backgroundColor: Color.fromARGB(255, 225, 92, 152),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Container(
            color: Colors.transparent,
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              itemCount: announcements.length,
              itemBuilder: (BuildContext context, int index) {
                // var date = DateTime.fromMillisecondsSinceEpoch(announcements[index].date.seconds * 1000);
                return  GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AnnouncementDetails(announcement: announcements[index]),
                      ),
                    );
                  },
                  child: Container(
                    height: 125,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 175, 117, 141),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  // announcementss[index].date.toString().substring(
                                  //     0, announcementss[index].date.toString().length - 5),
                                  // DateFormat('yMMMMd').format(date),
                                  announcements[index].date,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Text(
                              //   announcementss[index]
                              //       .date
                              //       .toString().substring(announcementss[index].date.toString().length - 4),
                              //   style: TextStyle(
                              //       color: Colors.white, fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  announcements[index].header,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 204, 48, 118),
                                    fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  announcements[index].body,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
