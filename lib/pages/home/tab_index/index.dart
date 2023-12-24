// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/OrgMpdel.dart';
import 'package:flutter_application_2/utils/dio_http.dart';
import 'package:flutter_application_2/utils/store.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
  List<OrgMpdel> orgList = [];
  List<OrgMpdel> filteredOrgList = [];
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getOrgList(null);
  }

  Future<void> getOrgList(param) async {
    Store store = await Store.getInstance();
    var token = await store.getString(StoreKeys.token);
    print("token===" + token);
    const url = '/org/list';
    var params = {'index': 1, 'size': 100000, 'param': param};
    var res = await DioHttp.of(context).post(url, params, token);
    // var resMap = json.decode(res.toString());
    Map<String, dynamic> resMap = jsonDecode(res.toString());
    print("resMap===");
    var dataList = resMap['data']['data'];
    print("dataList===");
    print(dataList);
    dataList.forEach((item) {
      OrgMpdel orgModel = OrgMpdel(
          id: item['id'],
          createBy: item['createBy'],
          createDate: item['createDate'],
          updateBy: item['updateBy'],
          orgId: item['orgId'],
          orgName: item['orgName'],
          orgNickname: item['orgNickname'],
          linkman: item['linkman'],
          linkmanMobile: item['linkmanMobile'],
          address: item['address'],
          state: item['state']);
      print(orgModel);
      setState(() {
        orgList.add(orgModel);
        filteredOrgList = List.from(orgList);
      });
    });
    print('orgList===');
    print(orgList);
  }

  Future<void> _refreshData() async {
    getOrgList(null);
  }

  void filterList(String query) {
    setState(() {
      filteredOrgList = orgList
          .where((item) =>
              item.orgName.toLowerCase().contains(query.toLowerCase()))
          // .where((item) =>
          //     item.orgId.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: searchController,
                onChanged: (value) {
                  filterList(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              )
            : const Text('组织机构列表'),
        backgroundColor: const Color.fromARGB(255, 148, 199, 235),
        actions: <Widget>[
          IconButton(
            icon: Icon(isSearching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  filterList('');
                }
              });
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
            itemCount: filteredOrgList.length,
            itemBuilder: (context, index) {
              var stateStr = '';
              if (filteredOrgList[index].state == 1) {
                stateStr = '上线';
              } else {
                stateStr = '停用';
              }
              return ListTile(
                title: Text(
                    "${filteredOrgList[index].orgId}--${filteredOrgList[index].orgName}--$stateStr"),
              );
            }),
      ),
    );
  }
}
