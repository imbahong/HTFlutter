import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


// 屏幕宽
var SCREEN_WIDTH = ScreenUtil.screenWidth * 0.5;

// 屏幕高
var SCREEN_HEIGHT =  ScreenUtil.screenHeight * 0.5;


// 设置适配宽度
 num sWidth(num width) {
   return ScreenUtil().setWidth(width);
 } 

 // 设置适配高度
 num sHeight(num height) {
   return ScreenUtil().setHeight(height);
 } 

// 适配字体utilFont
num sFont(num fontSize) {
  return ScreenUtil().setSp(fontSize);
}





// 获取本地图片
Widget getLocalImage(String imagePath,double size) {
  if (size == 0) {
    size = 44;
  }
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: size,
      maxHeight: size,
    ),
    child: Image.asset(imagePath)
  );
}

Widget getLocalImageWithImgSize(String imagePath,Size size) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: size.width,
      maxHeight: size.height,
    ),
    child: Image.asset(imagePath)
  );
}