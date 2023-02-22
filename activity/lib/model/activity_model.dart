class Activity {
  String activity;
  String type;
  int participants;
  double price;

  Activity(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price});

  factory Activity.fromJSON(Map<String, dynamic> json) {
    return Activity(
        activity: json['activity'],
        type: json['type'],
        participants: json['participants'],
        price: json['price'].toDouble());
  }
}
