import 'package:flutter/material.dart';
import 'package:rick_and_morty/provider.dart';
import 'package:rick_and_morty/view/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharacterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        home: CharacterSearchScreen(),
      ),
    );
  }
}
