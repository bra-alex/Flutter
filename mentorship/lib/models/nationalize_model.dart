class NationalizeModel {
  List<Country> country;
  String name;

  NationalizeModel({
    required this.country,
    required this.name,
  });

  factory NationalizeModel.fromJSON(Map<String, dynamic> json) {
    List<Country> country = [];
    json["country"].forEach((c) => {country.add(Country.fromJSON(c))});

    return NationalizeModel(
      country: country,
      name: json["name"],
    );
  }
}

class Country {
  String countryId;
  double probability;

  Country({
    required this.countryId,
    required this.probability,
  });

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
      countryId: json["country_id"],
      probability: json["probability"],
    );
  }
}
