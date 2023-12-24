import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home/tab_index/index.dart';
import 'package:flutter_application_2/pages/home/tab_search/index.dart';

// tab内容区
List<Widget> tabViewList = [
  const TabIndex(),
  const TabSearch(),
  // const TabInfo(),
  // const TabProfile(),
];

// bottomNavigatorItem

List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: '组织列表', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: '规则列表', icon: Icon(Icons.search)),
  // const BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info)),
  // const BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle)),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
