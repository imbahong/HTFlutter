import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

// 获取首页椎体内容
Future getHomeBannerContent() async {
  try {
    print('开始获取首页数据');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
    ContentType.parse("application/x-www-form-urlencoded").toString();
    response = await dio.get(servicePath['homeBanner']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Erro: =====> ${e}');
  }
}
 