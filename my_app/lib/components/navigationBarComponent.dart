import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/tool/tool.dart';

class HTNavigationButtonItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final Function onclick;
  HTNavigationButtonItem({this.imgPath, this.title,this.onclick});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
            onTap: onclick,
            child: Container(
              width: 44,
              height: 44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  getLocalImage(imgPath, 22),
                  Container(
                    padding: EdgeInsets.only(top: 1),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 9, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          )
    );
  }
}
