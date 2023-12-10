import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/login.dart';
import 'package:flutter_application_2/routes.dart';
import 'package:flutter_application_2/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return ScopedModel<FilterBarModel>(
      model: FilterBarModel(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        onGenerateRoute: router.generator,
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
