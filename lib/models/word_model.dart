import 'package:flutter/foundation.dart';

class WordData {
  final String english;
  final String pinyin;
  final int hsk;
  final String hanzi;

  const WordData({
    @required this.english,
    @required this.pinyin,
    @required this.hsk,
    @required this.hanzi,
  });
}
