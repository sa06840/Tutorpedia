import 'package:cloud_firestore/cloud_firestore.dart';

class Assignment {
  final String title;
  final String dueDate;

  Assignment({required this.title, required this.dueDate});
}

class CorrectionTemp {
  final String title;
  final String dueDate;

  CorrectionTemp({required this.title, required this.dueDate});
}

List<Assignment> assignments = [
  Assignment(
    title: 'Assignment 1',
    dueDate: 'March 25, 2023',
  ),
  Assignment(
    title: 'Assignment 2',
    dueDate: 'April 5, 2023',
  ),
  Assignment(
    title: 'Assignment 3',
    dueDate: 'April 10, 2023',
  ),
  Assignment(
    title: 'Assignment 4',
    dueDate: 'May 2, 2023',
  ),
   Assignment(
    title: 'Assignment 5',
    dueDate: 'April 10, 2023',
  ),
  Assignment(
    title: 'Assignment 6',
    dueDate: 'May 2, 2023',
  ),
];

// List<CorrectionTemp> corrections = [
//   CorrectionTemp(
//     title: 'Assignment 1',
//     dueDate: 'March 25, 2023',
//   ),
//   CorrectionTemp(
//     title: 'Assignment 2',
//     dueDate: 'April 5, 2023',
//   ),
//   CorrectionTemp(
//     title: 'Assignment 3',
//     dueDate: 'April 10, 2023',
//   ),
//   CorrectionTemp(
//     title: 'Assignment 4',
//     dueDate: 'May 2, 2023',
//   ),
// ];
