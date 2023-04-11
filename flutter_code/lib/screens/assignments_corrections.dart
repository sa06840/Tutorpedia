import 'package:flutter/material.dart';
import 'package:flutter_code/models/assignmentsModel.dart';

class Assignment {
  final String title;
  final DateTime dueDate;

  Assignment({required this.title, required this.dueDate});
}

class Correction {
  final String title;
  final DateTime dueDate;

  Correction({required this.title, required this.dueDate});
}

class AssignmentsAndCorrectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments & Corrections'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'Assignments',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 300.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: assignments.length > 10 ? 5 : assignments.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(assignments[index].title),
                  subtitle: Text('Due: ${assignments[index].dueDate}'),
                  trailing: Text(
                    'Missing',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(thickness: 2),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'Corrections',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 250.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: corrections.length > 4 ? 4 : corrections.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(corrections[index].title),
                  subtitle: Text('Due: ${corrections[index].dueDate}'),
                  trailing: Text(
                    'Missing',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
