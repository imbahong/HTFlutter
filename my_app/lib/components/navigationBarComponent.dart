import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/tool/tool.dart';

class HTNavigationButtonItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final Function onclick;
  HTNavigationButtonItem({this.imgPath, this.title, this.onclick});

  double itemWidth = 44;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
            onTap: onclick,
            child: Container(
              width: itemWidth,
              height: itemWidth,
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
            )));
  }
}

// 搜索框
class HTSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(bottom: 10),
     child:  Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(14),
       ),
       padding:  EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.search),
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            ),
            Container(
              width: sWidth(230),
              child: TextField(
                autofocus: true,
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // labelText: "用户名",
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  hintText: "请输入您想搜索的内容",
                  // prefixText: "请输入搜索内容",
                  // prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Expanded(child: 
    //  ConstrainedBox(
    //   constraints: BoxConstraints(maxHeight: 30),
    //   child:
    // )
    // )