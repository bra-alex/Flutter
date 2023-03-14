class Universities {
  List<University> universities;
  Universities({required this.universities});

  factory Universities.fromJSON(List<dynamic> json) {
    List<University> universities = [];
    universities = json.map((i) => University.fromJSON(i)).toList();
    return Universities(universities: universities);
  }
}

class University {
  List<String> domains;
  String name;
  List<String> webPages;
  String country;
  String? stateProvince;
  String alphaTwoCode;

  University(
      {required this.domains,
      required this.name,
      required this.webPages,
      required this.country,
      required this.alphaTwoCode,
      this.stateProvince});

  factory University.fromJSON(Map<String, dynamic> json) {
    return University(
        domains: List<String>.from(json['domains']),
        name: json['name'],
        webPages: List<String>.from(json['web_pages']),
        country: json['country'],
        alphaTwoCode: json['alpha_two_code'],
        stateProvince: json['state-province']);
  }
}
