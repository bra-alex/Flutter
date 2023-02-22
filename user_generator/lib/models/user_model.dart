class Results {
  List<User> results;

  Results({required this.results});

  factory Results.fromJSON(Map<String, dynamic> json) {
    return Results(results: json['results']);
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
        name: json['name'],
        location: json['location'],
        email: json['email'],
        dob: json['dob'],
        registered: json['registered'],
        phone: json['phone'],
        cell: json['cell'],
        picture: json['picture'],
        nat: json['nat']);
  }
}

class Name {
  String title;
  String first;
  String last;

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
  int postcode;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory Location.fromJSON(Map<String, dynamic> json) {
    return Location(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postcode: json['postcode']);
  }
}

class Street {
  int number;
  String name;

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
  int age;

  DOB({
    required this.date,
    required this.age,
  });

  factory DOB.fromJSON(Map<String, dynamic> json) {
    return DOB(date: json['date'], age: json['age']);
  }
}

class Registered {
  DateTime date;

  Registered({required this.date});

  factory Registered.fromJSON(Map<String, dynamic> json) {
    return Registered(date: json['date']);
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJSON(Map<String, dynamic> json) {
    return Picture(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail']);
  }
}
