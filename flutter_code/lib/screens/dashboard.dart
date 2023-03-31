import 'package:flutter/material.dart';
import 'package:flutter_code/widgets/announcementsSlider.dart';
import 'package:flutter_code/models/announcementsModel.dart';
import 'package:flutter_code/widgets/attendanceCounter.dart';
import 'package:flutter_code/widgets/navigationWidget.dart';


class DashBaord extends StatelessWidget {
  const DashBaord({super.key});

  @override
  Widget build(BuildContext context) {

    final className =  Text(
      "CLASS NAME",
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.black
        // color: Color.fromARGB(255, 143,68,192)
        // fontWeight: FontWeight.bold
      ),
    );

    final image = Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );

    final studentName = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Student Name",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );


    return Material(
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 243,243,247)
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 244, 169, 203),
              Color.fromARGB(255, 235, 235, 235),
              Colors.white,
              Color.fromARGB(255, 247, 222, 203),
            ]
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.fromLTRB(0.0,50.0,0.0,0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                SizedBox(height: 25.0),
                className,
                SizedBox(height:25.0),
                Column(
                  children: [
                    image,
                    studentName,
                    Text(
                      "Student",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[600]
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0,),
                AnnoucementsSlider(),
                AttendanceCounter(),
                NavWidget(),
              ]
            ),
          )
        ),
      ),
    );
  }
}