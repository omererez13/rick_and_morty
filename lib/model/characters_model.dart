// To parse this JSON data, do
//
//     final carbonModel = carbonModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators, unnecessary_null_comparison

import 'dart:convert';

class CharactersModel {
  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin? origin;
  Location? location;
  String image;
  String url;
  DateTime? created;

  factory CharactersModel.fromRawJson(String str) =>
      CharactersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      CharactersModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        species: json["species"] == null ? null : json["species"],
        type: json["type"] == null ? null : json["type"],
        gender: json["gender"] == null ? null : json["gender"],
        origin: json["origin"] == null ? null : Origin.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        image: json["image"] == null ? null : json["image"],
        url: json["url"] == null ? null : json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : status,
        "species": species == null ? null : species,
        "type": type == null ? null : type,
        "gender": gender == null ? null : gender,
        "origin": origin == null ? null : origin?.toJson(),
        "location": location == null ? null : location?.toJson(),
        "image": image == null ? null : image,
        "url": url == null ? null : url,
        "created": created == null ? null : created?.toIso8601String(),
      };
}

class Origin {
  Origin({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Origin.fromRawJson(String str) => Origin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}
