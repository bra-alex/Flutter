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
/*
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
*/

// Enumerations
// List of related items
// enum Weather { hot, cold, warm, humid }

// Switch statements
/*
printWeather(Weather weather) {
  switch (weather) {
    case Weather.hot:
      print('It is hot.');
      break;
    case Weather.cold:
      print('It is cold.');
      break;
    case Weather.warm:
      print('It is warm.');
      break;
    case Weather.humid:
      print('It is humid.');
      break;
  }
}
*/

// Classes
class Car {
  // Constructors
  final String make;
  final String model;
  final String bhp;

  Car(this.make, this.model, this.bhp);

// Methods
  accelerate() {
    print('${this.make} ${this.model} accelerating...');
  }

  brake() {
    print('${this.make} ${this.model} braking...');
  }

  start() {
    print('${this.make} ${this.model} starting...');
  }
}

void main() {
  /*
  nullSafety(null, 'Asiamah', 'Boakye');
  nullSafetyAssignment(null, 'Asiamah', 'Boakye');
  nullAssessment(null);
  printWeather(Weather.hot);
  */

  final car = Car('BMW', 'M5 CS', '625'); // Object - Instance of a class
  print(car.bhp);
  car.start();
}
