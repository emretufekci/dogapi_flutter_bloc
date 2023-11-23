// To parse this JSON data, do
//
//     final dog = dogFromJson(jsonString);

import 'dart:convert';

Dog dogFromJson(String str) => Dog.fromJson(json.decode(str) as Map<String, dynamic>);
Dog dogImageFromJson(String str) => Dog.fromJson(json.decode(str) as Map<String, dynamic>);
String dogToJson(Dog data) => json.encode(data.toJson());

class Dog {
  Map<String, List<String>> message;
  String status;
  String image;

  Dog({
    required this.message,
    required this.status,
    required this.image,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
    message: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
    status: json["status"],
    image: '',
  );

  Map<String, dynamic> toJson() => {
    "message": Map.from(message).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
    "status": status,
    "image" : image,
  };
}