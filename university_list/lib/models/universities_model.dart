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
        domains: json['domains'],
        name: json['name'],
        webPages: json['webPages'],
        country: json['country'],
        alphaTwoCode: json['alphaTwoCode'],
        stateProvince: json['stateProvince']);
  }
}
