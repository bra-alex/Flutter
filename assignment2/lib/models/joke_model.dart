class Jokes {
  int id;
  String type;
  String setup;
  String punchline;

  Jokes(
      {required this.id,
      required this.type,
      required this.setup,
      required this.punchline});

  factory Jokes.fromJSON(Map<String, dynamic> json) {
    return Jokes(
        id: json['id'],
        type: json['type'],
        setup: json['setup'],
        punchline: json['punchline']);
  }
}
