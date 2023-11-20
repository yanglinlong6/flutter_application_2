import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/not_found.dart';
import 'package:flutter_application_2/pages/home/home_page.dart';
import 'package:flutter_application_2/pages/login.dart';

class Routes {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomePage();
  });

  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const LoginPage();
  });

  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const NotFoundPage();
  });

  // 编写路由处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
