
class StudentAttendance{
  late int present;
  late int absent;
  late int lateArrival;

  StudentAttendance({
    required this.present,
    required this.absent,
    required this.lateArrival,
  });
}

StudentAttendance std = StudentAttendance(present: 10, absent: 2, lateArrival: 4);
