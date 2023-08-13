// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/characters_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharactersModel character;

  CharacterDetailScreen({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          character.name,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: queryData.size.height / 100),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                      height: queryData.size.height / 3,
                      character.image,
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: queryData.size.height / 13,
                    horizontal: queryData.size.width / 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CharacterAttribute(
                        item: "Character Status:",
                        itemValue: character.status,
                        queryData: queryData),
                    CharacterAttribute(
                        item: "Name:",
                        itemValue: character.name,
                        queryData: queryData),
                    CharacterAttribute(
                        item: "Species:",
                        itemValue: character.species,
                        queryData: queryData),
                    CharacterAttribute(
                        item: "Gender:",
                        itemValue: character.gender,
                        queryData: queryData),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterAttribute extends StatelessWidget {
  const CharacterAttribute({
    super.key,
    required this.queryData,
    required this.item,
    required this.itemValue,
  });

  final MediaQueryData queryData;
  final String item;
  final String itemValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: queryData.size.width,
        decoration: BoxDecoration(
            color: Colors.blue[50],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(queryData.size.height / 50)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: queryData.size.height / 50,
              horizontal: queryData.size.width / 20),
          child: Center(
            child: Row(
              children: [
                Text(
                  item,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                itemValue == "Alive" ||
                        itemValue == "Dead" ||
                        itemValue == "unknown"
                    ? Container(
                        height: queryData.size.height / 30,
                        width: queryData.size.height / 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: itemValue == "Alive"
                                ? Colors.green
                                : itemValue == "Dead"
                                    ? Colors.red
                                    : Colors.orange),
                      )
                    : Text(
                        itemValue,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
              ],
            ),
          ),
        ));
  }
}
