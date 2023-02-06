import 'dart:io';

void main() {
  int? numOfCourses;
  double cwa;

  print('How many courses are there?');
  numOfCourses = int.parse(stdin.readLineSync()!);

  cwa = calculateMarks(numOfCourses);

  print(cwa);
}

double calculateMarks(numOfCourses) {
  var marks = [];
  var creditHours = [];
  int? score;
  int? credit;
  int cumulativeMarks = 0;

  for (var i = 0; i < numOfCourses; i++) {
    print('Mark:');
    score = int.parse(stdin.readLineSync()!);

    print('Credit Hours');
    credit = int.parse(stdin.readLineSync()!);
    creditHours.add(credit);

    marks.add(score * credit);
  }

  int totalCredits = creditHours.reduce((a, b) => a + b);

  cumulativeMarks = marks.reduce((a, b) => a + b);

  print(cumulativeMarks);

  return cumulativeMarks / totalCredits;
}

int totalCreditHours(creditHours) {
  return 0;
}
