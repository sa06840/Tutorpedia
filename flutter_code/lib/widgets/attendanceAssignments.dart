import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/widgets/assignmentsCounter.dart';
import 'package:flutter_code/widgets/attendanceCounter.dart';

class AttendanceAssignments extends StatefulWidget {
  const AttendanceAssignments({super.key});

  @override
  State<AttendanceAssignments> createState() => _AttendanceAssignmentsState();
}

class _AttendanceAssignmentsState extends State<AttendanceAssignments> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: CarouselSlider(
            items: [AttendanceCounter(), AssignmentsCounter()],
            options: CarouselOptions(
                height: 250,
                padEnds: false,
                // enlargeCenterPage: true,
                // autoPlay: true,
                // aspectRatio: 16 / 9,
                // autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
                scrollDirection: Axis.vertical)));
  }
}
