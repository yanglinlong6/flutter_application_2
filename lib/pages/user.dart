import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.amber,
      child: Column(
        children: [
          GFButton(
            onPressed: () {},
            text: "primary",
          ),
        ],
      ),
    );
  }
}
