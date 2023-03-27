import 'package:flutter/material.dart';


class DashBaord extends StatelessWidget {
  const DashBaord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutorpedia"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Tutorpedia"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}