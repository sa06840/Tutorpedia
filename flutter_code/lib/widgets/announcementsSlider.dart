import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/announcementsModel.dart';
import 'package:flutter_code/screens/announcements.dart';

class AnnoucementsSlider extends StatefulWidget {
  const AnnoucementsSlider({super.key});

  @override
  State<AnnoucementsSlider> createState() => _AnnoucementsSliderState();
}

class _AnnoucementsSliderState extends State<AnnoucementsSlider> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Top Announcements",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Announcements()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.transparent,
                        decorationColor: Colors.grey,
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(0, -7))
                        ],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        // letterSpacing: 1.0,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 230.0,
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: announcements.length,
                itemBuilder: (BuildContext context, int index) {
                  Announcement announcement = announcements[index];
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    color: Color.fromARGB(0, 0, 0, 0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 120.0,
                            width: 210.0,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    announcement.date,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    announcement.body,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Container(
                            width: 210.0, // set the width of the rectangle
                            height: 120.0, // set the height of the rectangle
                            decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 248, 171, 111),
                              color: Color.fromARGB(255, 225, 92, 152),
                              borderRadius: BorderRadius.circular(
                                  10.0), // set the border radius of the rectangle
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  announcement.header,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
