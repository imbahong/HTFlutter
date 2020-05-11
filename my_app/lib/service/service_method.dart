import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
import 'dart:convert';


// 总的首页网络请求

Future reloadHomeData() async {
    var dataDic = {
    "Banner":[],
    "TopModuls":[],
    "TopModulsNames":[],
  };

 return Future.wait ([
     getHomeBannerContent().then((value) {
        var data = json.decode(value.toString());
        dataDic['Banner'] = (data['Data']['Banner'] as List).cast();
      //  return dataDic;
     }),
     getHomeTopModuleContent().then((value){
        // var data = json.decode(value.toString());
        // dataDic['TopModuls'] = (data['Data']['BackgroundImage'] as List).cast();
        dataDic['TopModulsNames'] = [
          '新品上市',
          '限时秒杀',
          '超前预订',
          '热卖爆款',
          '精选店铺',
        ];


      dataDic['TopModuls'] = [
        'https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png',
        // 'https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png',
        // 'https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png',
        // 'https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png',
        // 'https://m.91jhg.com/app/img/icon/home/general/xinpinshoufa@3x.png'
      ];
     })
  ]).then((value) => dataDic);
}



// 获取首页banner内容
Future getHomeBannerContent() async {
  try {
    print('开始获取首页轮播图');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType =
    // ContentType.parse("application/x-www-form-urlencoded").toString();
    response = await dio.get(servicePath['homeBanner'],options: Options(responseType: ResponseType.plain));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Erro: =====> ${e}');
  }
}
 

 // 获取首页模块入口内容
Future getHomeTopModuleContent() async {
  try {
    print('开始获取首页顶部模块');
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['homeTopModule'],options: Options(responseType: ResponseType.plain),queryParameters: {'t' : 1});
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Erro: =====> ${e}');
  }
}
 