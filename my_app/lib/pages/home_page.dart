import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

   @override
   void initState() { 
     super.initState();
  
      getHomeBannerContent().then((value){
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
      body: FutureBuilder( // 异步显示框架，不用setState渲染
        future: getHomeBannerContent(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            var data  = json.decode(snapshot.data.toString());
            List<Map> swiperData = (data['data']['slides'] as List).cast();
            return Column(
                children: <Widget>[
                  SwiperDiy(swiperDateList:swiperData)
                ],
            );
          }else {
            return Center(
              child: Text('加载中'),
            );
          }
        }, 
      )
    );
  }
}



// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;
  SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          // 展示的cell
           return Image.network("${swiperDateList[index]['image']}");
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}