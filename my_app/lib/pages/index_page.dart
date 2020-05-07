import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('标题')),
      body: Center(
        child: Text('百姓'),
      ),
    );
  }
}