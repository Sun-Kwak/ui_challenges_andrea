import 'package:flutter/material.dart';
import 'twitter_embed_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var screenSize = MediaQuery.of(context).size;
      print('화면 너비: ${screenSize.width}');
      print('화면 높이: ${screenSize.height}');
    });
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: TwitterEmbedCard()),
        ),
      ),
    );
  }
}
