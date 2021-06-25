import 'package:flutter/material.dart';

import 'models/word_model.dart';

class ChineseWord extends StatelessWidget {
  final WordData word;
  final Function updateWord;
  final Function clearWord;
  final bool hskOn;
  final bool pinyinOn;

  ChineseWord(
    this.word,
    this.updateWord,
    this.clearWord,
    this.hskOn,
    this.pinyinOn,
  );

  //Getter for the HSK Underline color
  Color get hskColor {
    switch (word.hsk) {
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.blue;
        break;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        onEnter: (_) => updateWord(word.english),
        onExit: (_) => clearWord(),
        child: Column(
          children: [
            pinyinOn
                ? Container(child: Text(word.pinyin))
                : Container(child: Text('')),
            Container(
              //color: Colors.lightBlue,
              decoration: BoxDecoration(
                //color: Colors.lightBlue,
                border: Border(
                  bottom: hskOn
                      ? BorderSide(color: hskColor, width: 4)
                      : BorderSide(color: Colors.transparent, width: 4),
                ),
              ),
              child: Text(
                word.hanzi,
                style: TextStyle(
                  fontSize: 40,
                  //decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
