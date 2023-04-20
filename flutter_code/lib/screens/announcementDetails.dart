import 'package:flutter/material.dart';

class AnnouncementDetails extends StatefulWidget {
  const AnnouncementDetails({Key? key}) : super(key: key);

  @override
  State<AnnouncementDetails> createState() => _AnnouncementDetailsState();
}

class _AnnouncementDetailsState extends State<AnnouncementDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement Details', style: TextStyle(fontSize: 24.0)),
        backgroundColor: Color.fromARGB(255, 225, 92, 152),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 80, 0, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Announcement Header',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: screenHeight * 0.5,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 5.0, // add a shadow to the card
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  width: cardWidth,
                  child: Text('This is the announcement text.'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
