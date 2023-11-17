import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_application_2/not_found.dart';
import 'package:flutter_application_2/pages/home/home_page.dart';

class Routes {
  // 定义路由名称
  static String home = '/';

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomePage();
  });

  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const NotFoundPage();
  });

  // 编写路由处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
