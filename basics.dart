// Maps
// Values are distinct
/*
maps(){
  var person = {'age': 20, 'fName': 'Me'};
  person['lName'] = 'You'; //Add a new key-value pair
  print(person);
}
*/

// Null Safety
// Null-aware assignment operator
nullSafety(String? fName, String? mName, String? lName) {
  String? name = fName ?? mName ?? lName;
  print(name);
}

nullSafetyAssignment(String? fName, String? mName, String? lName) {
  String? name = fName;
  name ??= mName;
  print(name);
}

nullAssessment(List<String>? names) {
  final length = names?.length ?? 0;
  print(length);
}

void main() {
  nullSafety(null, 'Asiamah', 'Boakye');
  nullSafetyAssignment(null, 'Asiamah', 'Boakye');
  nullAssessment(null);
}
