
class Student{
  late int present;
  late int absent;
  late int lateArrival;
  late int numberofAssignments;
  late int numberofCorrections;

  Student({
    required this.present,
    required this.absent,
    required this.lateArrival,
    required this.numberofAssignments,
    required this.numberofCorrections
  });
}

Student std = Student(present: 10, absent: 2, lateArrival: 4, numberofAssignments: 7, numberofCorrections: 3);
