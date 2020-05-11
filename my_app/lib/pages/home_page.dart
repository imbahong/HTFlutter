
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:my_app/tool/tool.dart';
import 'package:url_launcher/url_launcher.dart';


const tempPicPath = 'https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
 @override
 bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据';

  @override
  void initState() {
    super.initState();

    getHomeBannerContent().then((value) {
      setState(() {
        homePageContent = value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: FutureBuilder(
          // 异步显示框架，不用setState渲染
          future: reloadHomeData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // var data = json.decode(snapshot.data.toString());

              var data = snapshot.data;
              List<Map> banner = (data['Banner'] as List).cast();
              List topModuls = data['TopModuls'];

              // List<Map> topModulsNames = (data['TopModulsNames'] as List).cast();
              List<String> bannerPaths = [];
              for (var item in banner) {
                var path = item["ImgPath1"];
                bannerPaths.add('http://img.jihuigou.net/' + path);
              }

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SwiperDiy(swiperDateList: bannerPaths),
                    TopNavigator(navigatorList: topModuls),
                    AdBanner(adPicture: tempPicPath),
                    
                    LeaderPhone(leaderImage: tempPicPath,leaderPhone: '13067922737'),
                    Recommend(),
                    ],
                  
                )
              );
            } else {
              return Center(
                child: Text('加载中', style: TextStyle(fontSize: 12)),
              );
            }
          },
        ));
  }
}

// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;
  SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: SCREEN_WIDTH,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          // 展示的cell
          return Image.network("${swiperDateList[index]}",fit: BoxFit.fill,);
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ), 
    );
  }
}

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);  
  Widget _gridViewItemUI(item) {
    return InkWell(
      focusColor: Colors.red,
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item, width: sWidth(30)),
          Text('巴拉啦')
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeight(150),
      padding: EdgeInsets.all(3),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 横轴三个子widget
        childAspectRatio: 1.5, // 宽高比为1时,子widget
        mainAxisSpacing: 8,// 主轴间距
        crossAxisSpacing: 8,// 副轴间距
      ),
        children: creatGridItem(),
      ),
  
    );
  }

    List<Widget> creatGridItem() {
   return [
     _gridViewItemUI('https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png'),
     _gridViewItemUI('https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png'),
     _gridViewItemUI('https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png'),
      _gridViewItemUI('https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png'),
      _gridViewItemUI('https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png'),
   ];
 }
}

class AdBanner extends StatelessWidget {
  final String adPicture;

  const AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeight(40),
      width: SCREEN_WIDTH,
      child: Image.network(adPicture,fit: BoxFit.fill),
    );
  }
}

class LeaderPhone extends StatelessWidget {
  final String leaderImage; // 图片地址
  final String leaderPhone;

  const LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key); // 电话

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _laucherUrl,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _laucherUrl() async {
    // String url = 'tel:' + leaderPhone;

    String url = 'https://flutter.dev';

    if(await canLaunch(url)){
      await launch(url);
    }else {
      throw 'Url不能进行访问.异常';
    }
  }
}


// 商品推荐
class Recommend extends StatelessWidget {
  final List recomendList;

  const Recommend({Key key, this.recomendList}) : super(key: key);

  // 标题方法
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5,color: Colors.black12)
        ),
      ),
      child: Text('为你推荐',style: TextStyle(color: Colors.pink),)
    );
  }

  // 商品单独项写法
  Widget _item(num index) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: sHeight(330),
        width: SCREEN_WIDTH / 3,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1,color: Colors.black12)
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.network(tempPicPath),
            Text('￥3000'),
            Text('￥6000',style: TextStyle(
              decoration: TextDecoration.underline
            ),)
          ],
        ),
      ),
    );
  }

  // 横向列表方法
  Widget _recommendList() {
    return Container(
      height: sHeight(200),
      // margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context,index){
          return _item(index);
        }, 
      ),
    );
  }



  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeight(300),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}


// 楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;
  const FloorTitle({Key key, this.picture_address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Image.network(tempPicPath),      
    );
  }
}


// 楼层商品列表
class FloorConent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[
          _firstRow()
        ],
      ),
    );
  }


  Widget _firstRow() {
    return Row(
    children: <Widget>[
      _goodItem(),
      Column(

      )
    ], 
    );
  }

  Widget _goodItem() {
    return Container(
      width: sWidth(SCREEN_WIDTH / 2),
      child: InkWell(
        onTap: (){},
        child: Image.network(tempPicPath)
      ),
    );
  }
}