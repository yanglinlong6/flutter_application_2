import 'package:flutter/material.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(10),
      child: const Text("TabSearch"),
    );
  }
}
