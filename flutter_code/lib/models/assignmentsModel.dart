class Assignment {
  final String title;
  final String dueDate;

  Assignment({required this.title, required this.dueDate});
}

class Correction {
  final String title;
  final String dueDate;

  Correction({required this.title, required this.dueDate});
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

List<Correction> corrections = [
  Correction(
    title: 'Assignment 1',
    dueDate: 'March 25, 2023',
  ),
  Correction(
    title: 'Assignment 2',
    dueDate: 'April 5, 2023',
  ),
  Correction(
    title: 'Assignment 3',
    dueDate: 'April 10, 2023',
  ),
  Correction(
    title: 'Assignment 4',
    dueDate: 'May 2, 2023',
  ),
];
