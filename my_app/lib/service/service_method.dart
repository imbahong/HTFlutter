import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/BannerModel.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
import 'dart:convert';

// 网络请求 全局设置
// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = BaseOptions(
    baseUrl: "http://api.jihuigou.net/v1/",
    connectTimeout: 15000,
    receiveTimeout: 15000,
    responseType: ResponseType.plain);

Dio dio = Dio(options);

// 总的首页网络请求

Future reloadHomeData() async {
  var dataDic = {
    "Banner": [],
    "TopModuls": [],
    "TopModulsNames": [],
  };

  return Future.wait([
      fetchHomeBannerData().then((value) {
      var data = json.decode(value.toString());
      dataDic['Banner'] = (data['Data']['Banner'] as List).map((e) => BannerModel.fromJson(e)).toList();
      //  return dataDic;
    }),
    
    fetchHomeTopModuls().then((value) {
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

Future fetchHomeBannerData() {
  return  getRequest('homeBanner');
}

Future fetchHomeTopModuls() {
  return  getRequestParams('homeTopModules',{'t': 1});
}


// get
Future getRequest(url) async {
  try {
    // 响应体
    Response response;
    response = await dio.get(servicePath[url]);
    if (response.statusCode == 200) {
      return response.data;
    }
  } catch (e) {
    print('接口报错Erro: =====>地址为: ${url} 错误信息: ${e} ');
  }
}

// get 有参数
Future getRequestParams(url, formData) async {
  try {
    // 响应体
    Response response;
    response = await dio.get(servicePath[url], queryParameters: formData);
    if (response.statusCode == 200) {
      return response.data;
    }
  } catch (e) {
    print('接口报错Erro: =====>地址为: ${url} 错误信息: ${e} ');
  }
}

Future postRequest(url) async{
    try {
      // 响应体
      Response response;
      response = await dio.post(servicePath[url]);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
       print('接口报错Erro: =====>地址为: ${url} 错误信息: ${e} ');
    }
 }

  Future postRequestParams(url,formData) async{
    try {
      // 响应体
      Response response;
      response = await dio.post(servicePath[url],queryParameters: formData);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
       print('接口报错Erro: =====>地址为: ${url} 错误信息: ${e} ');
    }
  }

//  Map formData
