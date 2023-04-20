import 'package:flutter/material.dart';



class AnnouncementDetails extends StatefulWidget {
  const AnnouncementDetails({super.key});

  @override
  State<AnnouncementDetails> createState() => _AnnouncementDetailsState();
}

class _AnnouncementDetailsState extends State<AnnouncementDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Announcement Details', style: TextStyle(fontSize: 24.0)),
            backgroundColor: Color.fromARGB(255, 225, 92, 152),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0,14,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Announcement Header',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe'),
                          Text('April 21, 2023'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('This is the announcement text.'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}