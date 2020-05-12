import 'package:flutter/material.dart';






class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
        leading: RaisedButton(onPressed:(){
          Navigator.pop(context);
        }),
      ),
    );
  }
}