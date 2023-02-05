import 'dart:io';

void main() {
  int? numOfCourses;
  int? creditHours;
  double cwa;

  print('How many courses are there?');
  numOfCourses = int.parse(stdin.readLineSync()!);

  int cumulativeMarks = calculateMarks(numOfCourses);

  print('Total credit hours');
  creditHours = int.parse(stdin.readLineSync()!);

  cwa = cumulativeMarks / creditHours;

  print(cwa);
}

int calculateMarks(numOfCourses) {
  var marks = [];
  int? score;
  int cumulativeMarks = 0;

  print('Enter the marks');

  for (var i = 0; i < numOfCourses; i++) {
    score = int.parse(stdin.readLineSync()!);
    marks.add(score);
  }

  cumulativeMarks = marks.reduce((a, b) => a + b);

  return cumulativeMarks;
}
