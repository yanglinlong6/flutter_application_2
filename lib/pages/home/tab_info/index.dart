import 'package:flutter/material.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  State<TabInfo> createState() => _TabInfoState();
} 

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, 
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(2),
      child: const Text("TabInfo"),
    );
  }
}
