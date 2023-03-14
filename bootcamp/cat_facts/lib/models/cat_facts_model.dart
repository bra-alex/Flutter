class CatFacts {
  String fact;

  CatFacts({required this.fact});

  factory CatFacts.fromJSON(Map<String, dynamic> json) {
    return CatFacts(fact: json['fact']);
  }
}
