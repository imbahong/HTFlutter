import 'package:flutter/material.dart';
import 'package:my_app/tool/tool.dart';



class HTNavigationButtonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
         child: Stack(
          // fit: StackFit.loose,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: RaisedButton(
                color: Colors.transparent,
                disabledColor: Colors.transparent,
                onPressed: null,
                child: getLocalImage('Assets/Home/Home_Scan.png'),
                padding: EdgeInsets.only(bottom: 18.5),
              ),
              // bottom: 0,
              left: 0,
              width: 44,
              height: 44,
            ),
            Positioned(
              child: Text(
                '二维码',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 9, color: Colors.white),
              ),
              bottom: 6.5,
            )
          ],
        )
    );
  }
}

