import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
   List swiperDataList=["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723734494&di=864f7b85f900f0b68e8bc08f1c078eed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201511%2F02%2F20151102140204_WUSwE.jpeg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723821634&di=e04d14690229411a560ccc6cf0e10f6a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F01%2F96%2F56N58PICVWw_1024.jpg"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeNavgaionBar(),
          Swiper(
            outer: false,
            itemBuilder: (c,i) {
              if(swiperDataList != null) {
                  
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}




// 导航栏按钮
class HTNavigationButtonItem extends StatefulWidget {
  @override
  _NavigationButtonItemState createState() => _NavigationButtonItemState();
}

class _NavigationButtonItemState extends State<HTNavigationButtonItem> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 44,
          maxWidth: 44,
        ),
        child: Stack(
          // fit: StackFit.loose,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: RaisedButton(
                color: cleanColor(),
                disabledColor: cleanColor(),
                onPressed: null,
                child: getImage('Assets/Home/Home_Scan.png'),
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
              // left:8,
              // right: 0,
              bottom: 6.5,
            )
          ],
        ));
  }
}

// 首页导航栏
class HomeNavgaionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width,
      height: 64,
      color: Colors.blueAccent,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          HTNavigationButtonItem(),
          searchBar(),
          HTNavigationButtonItem(),
        ],
      ),
    );
  }
}

// 搜索栏
Widget searchBar() {
  return Expanded(
    child: Container(
        color: null,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            decoration: // 修饰盒子
                BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
            height: 30,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.search, size: 20),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      '请输入你想搜索的内容',
                      style: TextStyle(
                          color: rgba(153, 153, 153, 1), fontSize: 13),
                    ))
              ],
            ),
          ),
        )),
  );
}

// Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 width: Screen.width - 44 * 2,
//                 height: 30,
//                 // color: Colors.black54,
//               ),

Widget getImage(String imagePath) {
  return Image.asset(
    imagePath,
//      width: 300.0,
//      height: 300.0,
    // matchTextDirection: false,
    width: 16,
    height: 16,
    fit: BoxFit.cover,
//      repeat: ImageRepeat.repeat,
//      filterQuality: FilterQuality.high,
//          color: Colors.black,
//          colorBlendMode: BlendMode.xor,
  );
}

// mark: 工具类

Color cleanColor() {
  return rgba(0, 0, 0, 0);
}

Color rgba(int r, int g, int b, int a) {
  return Color.fromARGB(a * 255, r, g, b);
}

class Screen {
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.size.width;
  }

  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.size.height;
  }

  static double get scale {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.devicePixelRatio;
  }

  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.textScaleFactor;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    return mediaQuery.padding.bottom;
  }
}
