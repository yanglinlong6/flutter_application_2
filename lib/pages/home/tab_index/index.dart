import 'package:flutter/material.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(10),
      child: const Text("TabIndex"),
    );
  }
}
