import 'package:intl/intl.dart';

class Results {
  List<User> results;

  Results({required this.results});

  factory Results.fromJSON(Map<String, dynamic> json) {
    List<User> users = [];
    json['results'].forEach((user) {
      users.add(User.fromJSON(user));
    });
    return Results(results: users);
  }
}

class User {
  String gender;
  Name name;
  Location location;
  String email;
  DOB dob;
  Registered registered;
  String phone;
  String cell;
  Picture picture;
  String nat;

  String sex() {
    return '${gender[0].toUpperCase()}${gender.substring(1).toLowerCase()}';
  }

  User(
      {required this.gender,
      required this.name,
      required this.location,
      required this.email,
      required this.dob,
      required this.registered,
      required this.phone,
      required this.cell,
      required this.picture,
      required this.nat});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        gender: json['gender'],
        name: Name.fromJSON(json['name']),
        location: Location.fromJSON(json['location']),
        email: json['email'],
        dob: DOB.fromJSON(json['dob']),
        registered: Registered.fromJSON(json['registered']),
        phone: json['phone'],
        cell: json['cell'],
        picture: Picture.fromJSON(json['picture']),
        nat: json['nat']);
  }
}

class Name {
  String title;
  String first;
  String last;

  String fullName() {
    return '$title $first $last';
  }

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJSON(Map<String, dynamic> json) {
    return Name(title: json['title'], first: json['first'], last: json['last']);
  }
}

class Location {
  Street street;
  String city;
  String state;
  String country;
  String postcode;

  String getLocation() {
    return '${street.fullStreet()}, $city, $state, $country';
  }

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory Location.fromJSON(Map<String, dynamic> json) {
    return Location(
        street: Street.fromJSON(json['street']),
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postcode: json['postcode'].toString());
  }
}

class Street {
  int number;
  String name;

  String fullStreet() {
    return '$number $name';
  }

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJSON(Map<String, dynamic> json) {
    return Street(number: json['number'], name: json['name']);
  }
}

class DOB {
  DateTime date;

  String formattedDate() {
    return DateFormat.yMMMMd().format(date);
  }

  DOB({
    required this.date,
  });

  factory DOB.fromJSON(Map<String, dynamic> json) {
    return DOB(date: DateTime.parse(json['date']));
  }
}

class Registered {
  DateTime date;

  String formattedDate() {
    return DateFormat.yMMMM().format(date);
  }

  Registered({required this.date});

  factory Registered.fromJSON(Map<String, dynamic> json) {
    return Registered(date: DateTime.tryParse(json['date'])!);
  }
}

class Picture {
  String large;

  Picture({
    required this.large,
  });

  factory Picture.fromJSON(Map<String, dynamic> json) {
    return Picture(large: json['large']);
  }
}
