import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/assignmentsModel.dart';
import 'package:flutter_code/models/correctionModel.dart';
import 'package:flutter_code/models/parentModel.dart';

class Assignment {
  final String title;
  final DateTime dueDate;

  Assignment({required this.title, required this.dueDate});
}

class CorrectionTemp {
  final String title;
  final DateTime dueDate;

  CorrectionTemp({required this.title, required this.dueDate});
}

class AssignmentsAndCorrectionsScreen extends StatefulWidget {
  @override
  State<AssignmentsAndCorrectionsScreen> createState() => _AssignmentsAndCorrectionsScreenState();
}

class _AssignmentsAndCorrectionsScreenState extends State<AssignmentsAndCorrectionsScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  ParentModel loggedInUser = ParentModel();

  final CollectionReference correctionsList = FirebaseFirestore.instance.collection('corrections');
  List correctionObjects = [];
  List corrections = [];

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = ParentModel.fromMap(value.data());
      // devtools.log(this.loggedInUser.firstName.toString());
      setState(() {
        fetchCorrections();
      });
    });
  }

  Future getCorrectionObjects() async {
    var corrections = 0;
    try {
      await correctionsList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          Correction correction = Correction();
          correction = Correction().fromMap(element.data());
          if (correction.studentCode.toString() == this.loggedInUser.studentCode.toString()){
            correctionObjects.add(correction);
            // corrections += 1;
          }
        });
      });
      return correctionObjects;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchCorrections() async {
    dynamic resultant = await getCorrectionObjects();
    if (resultant == null){
      print('Unable to retrieve');
    } else{
      setState(() {
        correctionObjects = resultant;
        correctionObjects.sort((m1, m2) {
          var r = m1.dueDate.compareTo(m2.dueDate);
          return r;
        });
        corrections = new List.from(correctionObjects.reversed);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments & Corrections'),
        backgroundColor: Color.fromARGB(255, 189, 101, 237),
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
                  title: Text(corrections[index].header),
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
