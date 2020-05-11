import 'package:flutter_screenutil/flutter_screenutil.dart';


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
num uFont(num fontSize) {
  return ScreenUtil().setSp(fontSize);
}