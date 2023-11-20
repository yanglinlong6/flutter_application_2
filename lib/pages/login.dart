// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home/home_page.dart';
import 'package:flutter_application_2/scoped_model/auth.dart';
import 'package:flutter_application_2/utils/common_toast.dart';
import 'package:flutter_application_2/utils/dio_http.dart';
import 'package:flutter_application_2/utils/store.dart';
import 'package:flutter_application_2/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  void _loginHandle() async {
    var userName = usernameController.text;
    var passWord = passwordController.text;
    if (stringIsNullOrEmpty(userName) || stringIsNullOrEmpty(passWord)) {
      CommonToast.showToast('用户名或密码不能为空!');
      return;
    }
    const url = '/login';
    var params = {'username': userName, 'password': passWord};
    var res = await DioHttp.of(context).post(url, params);
    // var resMap = json.decode(res.toString());
    Map<String, dynamic> resMap = jsonDecode(res.toString());
    print("resMap===");
    print(resMap);

    String status = resMap['code'];
    String description = resMap['message'] ?? '内部错误';
    CommonToast.showToast(description);
    if (int.parse(status) == 0) {
      String token = resMap['data'];
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);

      // ScopedModelHelper().getModel<AuthModel>(context).login(token, context);
      ScopedModelDescendant<AuthModel>(
          builder: (context, child, model) => model.login(token, context));
      Timer(const Duration(microseconds: 100), () {
        // Navigator.of(context).pushNamed("/");
        // Navigator.of(context).pop();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const HomePage(); //返回的是需要跳转单页面
          },
        ));
      });
    }
  }

  bool _showPassworld = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('登录'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(30),
          child: ListView(
            children: [
              TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: '用户名', hintText: '请输入用户名')),
              const SizedBox(height: 20),
              TextField(
                  controller: passwordController,
                  obscureText: !_showPassworld,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      suffixIcon: IconButton(
                        icon: Icon(_showPassworld
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _showPassworld = !_showPassworld;
                          });
                        },
                      ))),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      _loginHandle();
                    },
                    child: const Text('登录',
                        style: TextStyle(color: Colors.white))),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
