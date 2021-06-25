import 'package:flutter/material.dart';

import 'word.dart';

import 'models/word_model.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<String> content = ['zhong', 'guo'];

  // List<String> someText =
  //     "The quick brown fox jumped over the lazy red dog some other text The quick brown fox jumped over the lazy red dog some other text"
  //         .split(" ");

  String word = '';

  bool hskOn = true;
  bool pinyinOn = true;

  void updateWord(newWord) {
    print(newWord);

    setState(() {
      word = newWord;
    });
  }

  void clearWord() {
    setState(() {
      word = '';
    });
  }

  void _toggleHSK() {
    setState(() {
      hskOn = !hskOn;
    });
  }

  void _togglePinyin() {
    setState(() {
      pinyinOn = !pinyinOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                children: [
                  Text(word),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              top: 8,
              right: 40,
              bottom: 8,
            ),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 10.0,
              runSpacing: 10.0,
              children: WORDS
                  .map((item) =>
                      ChineseWord(item, updateWord, clearWord, hskOn, pinyinOn))
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Transform.rotate(
                    angle: 45,
                    child: IconButton(
                      icon: Icon(Icons.play_arrow),
                      tooltip: 'Previous Page',
                      onPressed: () {},
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    tooltip: 'Next Page',
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    tooltip: 'Toggle HSK',
                    onPressed: _toggleHSK,
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    tooltip: 'Toggle Pinyin',
                    onPressed: _togglePinyin,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
