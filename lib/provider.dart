import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/characters_dto.dart';
import 'package:rick_and_morty/model/characters_model.dart';

class CharacterProvider extends ChangeNotifier {
  List<CharactersModel> characters = [];
  StringBuffer bufferedItems = StringBuffer("");
  String bufferedString = "";
  Future searchCharacters(String searchText) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.get(
          Uri.parse('https://rickandmortyapi.com/api/character'),
        );
        characters = [];
        if (response.statusCode == 200) {
          CharactersDTO responseDTO =
              CharactersDTO.fromRawJsonByte(response.bodyBytes);
          if (responseDTO.results.isNotEmpty == true) {
            for (CharactersModel data in responseDTO.results) {
              bufferedItems.write(data.name);
              bufferedItems.write(data.species);
              bufferedString = bufferedItems.toString().toLowerCase();

              if (bufferedString.contains(searchText.toLowerCase())) {
                characters.add(data);
              }
              bufferedItems = StringBuffer("");
              bufferedString = "";
            }
          }
        }
      }
    } on SocketException catch (_) {
      print("${_.osError!.message}");
    }
    notifyListeners();
  }
}
