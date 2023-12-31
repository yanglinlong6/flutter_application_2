import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/my_aptitude_item.dart';
import 'package:flutter_application_2/model/OrgAptitudeModel.dart';
import 'package:flutter_application_2/utils/dio_http.dart';
import 'package:flutter_application_2/utils/store.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  List<OrgAptitudeModel> orgAptitudeList = [];
  List<OrgAptitudeModel> filteredOrgAptitudeList = [];
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
    const url = '/org/aptitude/list';
    var params = {'index': 1, 'size': 100000, 'param': param};
    var res = await DioHttp.of(context).post(url, params, token);
    // var resMap = json.decode(res.toString());
    Map<String, dynamic> resMap = jsonDecode(res.toString());
    print("resMap===");
    var dataList = resMap['data']['data'];
    print("dataList===");
    print(dataList);
    dataList.forEach((item) {
      OrgAptitudeModel orgApitude = OrgAptitudeModel(
          id: item['id'],
          createBy: item['createBy'],
          createDate: item['createDate'],
          updateBy: item['updateBy'],
          updateDate: item['updateDate'],
          orgId: item['orgId'],
          orgName: item['orgName'],
          province: item['province'],
          city: item['city'],
          week: item['week'],
          limitTime: item['limitTime'],
          limitCount: item['limitCount'],
          singleIncome: 0,
          wechat: item['wechat'],
          api: item['api'],
          weight: item['weight'],
          amountRate: 0,
          loanAmount: item['loanAmount'],
          channel: item['channel'],
          status: item['status'],
          useLegacyFlag: item['useLegacyFlag']);

      print(orgApitude);
      setState(() {
        orgAptitudeList.add(orgApitude);
        filteredOrgAptitudeList = List.from(orgAptitudeList);
      });
    });
    print('orgAptitudeList===');
    print(orgAptitudeList);
  }

  Future<void> _refreshData() async {
    getOrgList(null);
  }

  Future<void> _changeStatus(int id, int status) async {
    Store store = await Store.getInstance();
    var token = await store.getString(StoreKeys.token);
    print("token===" + token);
    const url = '/org/aptitude/changeStatus';
    var params = {'id': id, 'status': status};
    var res = await DioHttp.of(context).post(url, params, token);
    // var resMap = json.decode(res.toString());
    print("res===" + res.toString());
    getOrgList(null);
  }

  void filterList(String query) {
    setState(() {
      filteredOrgAptitudeList = orgAptitudeList
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
              : const Text('组织规则列表'),
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
              itemCount: filteredOrgAptitudeList.length,
              itemBuilder: (context, index) {
                var stateStr = '';
                if (filteredOrgAptitudeList[index].status == 0) {
                  stateStr = '正常';
                } else {
                  stateStr = '停用';
                }
                return ListTile(
                  title: Text(
                      "${filteredOrgAptitudeList[index].orgName}--${filteredOrgAptitudeList[index].limitTime}--${filteredOrgAptitudeList[index].limitCount}--$stateStr"),
                  onLongPress: () => {
                    print("niaho"),
                    print(filteredOrgAptitudeList[index]),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAptitudeItem(
                              orgAptitudeModel:
                                  filteredOrgAptitudeList[index])),
                    )
                  },
                );
              }),
        ));
  }
}
