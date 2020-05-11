
import 'package:flutter/material.dart';
import 'package:my_app/pages/index_page.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: IndexPage(),
    theme: ThemeData(
      highlightColor: Color.fromRGBO(0, 0, 0, 0),
      splashColor: Color.fromRGBO(0, 0, 0, 0)
    ),
  ));
}