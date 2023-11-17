import 'package:flutter/material.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(10),
      child: const Text("TabProfile"),
    );
  }
}
