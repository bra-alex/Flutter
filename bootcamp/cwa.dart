import 'dart:io';

void main() {
  int? numOfCourses;
  double cwa;

  print('How many courses are there?');
  numOfCourses = int.parse(stdin.readLineSync()!);

  cwa = double.parse(calculateCWA(numOfCourses).toStringAsFixed(2));

  print('CWA: $cwa');
}

double calculateCWA(numOfCourses) {
  int marks = 0;
  int creditHours = 0;
  int? score;
  int? credit;

  for (var i = 0; i < numOfCourses; i++) {
    print('Mark:');
    score = int.parse(stdin.readLineSync()!);

    print('Credit Hours:');
    credit = int.parse(stdin.readLineSync()!);
    creditHours += credit;

    marks += score * credit;
  }

  return marks / creditHours;
}
