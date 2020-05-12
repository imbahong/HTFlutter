import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_hander.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print('error ===> 界面是空的了');
        return Text('路径出错了');
      }
    );

    router.define(detailsPage, handler: detailsHandler);
    
    // 后续路由
  }
}