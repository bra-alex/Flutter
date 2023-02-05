import 'dart:io';

void main() {
  int? numOfCourses;
  int? score;
  int? creditHours;
  int cumulativeMarks = 0;
  double cwa;

  var marks = [];
  print('How many courses are there?');
  numOfCourses = int.parse(stdin.readLineSync()!);

  print('Enter the marks');

  for (var i = 0; i < numOfCourses; i++) {
    score = int.parse(stdin.readLineSync()!);
    marks.add(score);
  }

  print('Total credit hours');
  creditHours = int.parse(stdin.readLineSync()!);

  cumulativeMarks = marks.reduce((a, b) => a + b);

  cwa = cumulativeMarks / creditHours;

  print(cwa);
}
