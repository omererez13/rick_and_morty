// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/provider.dart';
import 'package:rick_and_morty/view/details_screen.dart';
import 'package:provider/provider.dart';

class CharacterSearchScreen extends StatefulWidget {
  @override
  State<CharacterSearchScreen> createState() => _CharacterSearchScreenState();
}

class _CharacterSearchScreenState extends State<CharacterSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Rick and Morty',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(left: queryData.size.width / 26),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search for characters',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          characterProvider
                              .searchCharacters(_searchController.text);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: queryData.size.width / 52,
                      top: queryData.size.height / 104),
                  child: IconButton(
                    onPressed: () {
                      var random = Random();
                      int randomNumber =
                          random.nextInt(characterProvider.characters.length);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailScreen(
                            character:
                                characterProvider.characters[randomNumber],
                          ),
                        ),
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    icon: Icon(Icons.account_box_rounded),
                    iconSize: queryData.size.width / 10,
                    color: Colors.blueGrey,
                  ),
                ),
              )
            ],
          ),
          Consumer<CharacterProvider>(
            builder: (context, characterProvider, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: characterProvider.characters.length,
                  itemBuilder: (context, index) {
                    final character = characterProvider.characters[index];
                    return ListTile(
                      leading: Image.network(character.image),
                      title: Text(character.name),
                      subtitle: Text(character.species),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetailScreen(
                              character: character,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    final characterProvider =
        Provider.of<CharacterProvider>(context, listen: false);
    characterProvider.searchCharacters("");

    super.initState();
  }
}
