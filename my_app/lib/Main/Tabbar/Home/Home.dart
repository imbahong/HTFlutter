import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

// 轮播图组件
import 'package:flutter_swiper/flutter_swiper.dart';

// 加载网络图片组件
import 'package:cached_network_image/cached_network_image.dart';

// 更改状态栏
import 'package:flutter/services.dart';
import 'package:my_app/models/BannerModel.dart';

// 下拉刷新
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 风格组件
import 'package:flutter/cupertino.dart';


// 网络请求框架
import 'package:dio/dio.dart';
import 'dart:convert';

  // 网络请求 全局设置
 // 或者通过传递一个 `options`来创建dio实例
  BaseOptions options = BaseOptions(
      baseUrl: "http://api.jihuigou.net/v1/",
      connectTimeout: 15000,
      receiveTimeout: 15000,
  );
  
  Dio dio = Dio(options);






 




class Home extends StatelessWidget {
  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    //白色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rgba(245, 245, 245, 1),
      body: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: Screen.width, maxHeight: Screen.height),
          child: Stack(
            children: <Widget>[
              MainList(),
              // HomeNavgaionBar()
            ],
          )),
    );
  }
}

class HomeSwipper extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeSwipper> {
  @override
  Widget build(BuildContext context) {
    List swiperDataList = [
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723734494&di=864f7b85f900f0b68e8bc08f1c078eed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201511%2F02%2F20151102140204_WUSwE.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723821634&di=e04d14690229411a560ccc6cf0e10f6a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F01%2F96%2F56N58PICVWw_1024.jpg"
    ];

    return ConstrainedBox(
        child: Swiper(
          outer: false,
          autoplay: true,
          autoplayDelay: 15000,
          duration: 500,
          itemBuilder: (c, i) {
            if (swiperDataList != null) {
              return CachedNetworkImage(
                imageUrl: "${swiperDataList[i]}",
                // placeholder: (context, url) =>
                //      CircularProgressIndicator(),

                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              );
            }
          },
          pagination: SwiperPagination(margin: EdgeInsets.all(5.0)),
          itemCount: swiperDataList == null ? 0 : swiperDataList.length,
        ),
        constraints: BoxConstraints.loose(Size(375, 478)));
  }
}

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {

    //  print('我打印了');  

    Response response = await dio.get("Product/GetHome_AdverList");
    
        // List<BannerModel> = List<BannerModel>.from(re)

        // BannerModel model = BannerModel.fromJson(list);



      // List responseJson = json.decode(.toString());

      List<BannerModel> bannerRowModels = response.data["Data"]["Banner"].map((m) => BannerModel.fromJson(m)).toList();

  //  List<Bna> dataStr = response.data["Data"]["Banner"];
  //  List<BannerModel> bannerData =  json.decode(dataStr);

      print(bannerRowModels);

    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch

      
    // await Future.delayed(Duration(milliseconds: 1000));

     

    // if failed,use loadFailed(),if no data return,use LoadNodata()



    // items.add((items.length + 1).toString());
    if (mounted) setState(() {
      
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("上拉加载");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("加载失败！点击重试！");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("松手,加载更多!");
              } else {
                body = Text("没有更多数据了!");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: CustomScrollView(
            slivers: <Widget>[
              // 如果不是Sliver家族的widget，需要使用sliverToBoxAdapter做层包裹
              SliverToBoxAdapter(child: HomeSwipper()),

              // 当列表项高度固定时，使用SliverFixedExtendlist 比sliver List具有更高的性能
              SliverFixedExtentList(
                  delegate:
                      SliverChildBuilderDelegate(_buildListItem, childCount: 3),
                  itemExtent: 48.0)
            ],
          )),
    );

    // return
  }
}

// 列表项
Widget _buildListItem(BuildContext context, int index) {
  Widget divider1 = Divider(
    color: Colors.blue,
    thickness: 10,
  );
  Widget divider2 = Divider(color: Colors.green);

  return ListTile(title: Text('list tile index $index'));
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
          SearchBar(),
          HTNavigationButtonItem(),
        ],
      ),
    );
  }
}

// 搜索栏
Widget SearchBar() {
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

// 获取导航栏图片
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
