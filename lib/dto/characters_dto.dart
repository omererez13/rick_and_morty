// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison, unnecessary_cast

import 'dart:convert';
import 'package:rick_and_morty/model/characters_model.dart';

class CharactersDTO {
  CharactersDTO({
    required this.results,
  });

  List<CharactersModel> results;

  factory CharactersDTO.fromRawJsonByte(str) =>
      CharactersDTO.fromJson(json.decode(utf8.decode(str)));

  String toRawJson() => json.encode(toJson());

  factory CharactersDTO.fromJson(Map<String, dynamic> json) => CharactersDTO(
        results: List<CharactersModel>.from(
            json["results"].map((x) => CharactersModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(
                results.map((x) => x.toJson()) as Iterable<dynamic>),
      };
}
