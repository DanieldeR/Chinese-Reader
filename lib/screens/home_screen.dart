import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String html =
        '''<h1>Test</h1><p>The quick brown fox jumped over the lazy red dog. The quick brown fox jumped over the lazy red dog</p>''';

    Future<String> loadHtml() async {
      // return await rootBundle.loadString('books/book.html');

      return Future.delayed(Duration(seconds: 2), () => html);
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: loadHtml(),
            builder: (ctx, snapshot) {
              return snapshot.hasData
                  ? htmlContent(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

Widget htmlContent(String html) {
  List<Widget> wList = [];

  return HtmlWidget(
    html,
    customWidgetBuilder: (element) {
      for (final word in element.text.split(' ')) {
        wList.add(Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 8,
          ),
          child: Text(word),
        ));
      }

      print(wList);

      return Wrap(
        children: wList,
      );
      //  Container(
      //   height: 400,
      //   child: ListView.builder(
      //     itemBuilder: (ctx, index) => Wrap(
      //       children: wList,
      //     ),
      //     itemCount: wList.length,
      //   ),
      // );
    },
  );
}
