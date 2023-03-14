class DoggoModel {
  String message;

  DoggoModel({required this.message});

  factory DoggoModel.fromJSON(Map<String, dynamic> json) {
    return DoggoModel(message: json['message']);
  }
}
