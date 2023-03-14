import 'dart:io';

void main() {
  print('Enter name');
  String? name = stdin.readLineSync();
  int? age = int.parse(stdin.readLineSync()!);

  print("Name: ${name}\nAge: ${age}");
}
