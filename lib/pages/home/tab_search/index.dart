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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('组织规则列表'),
          backgroundColor: const Color.fromARGB(255, 148, 199, 235),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
              itemCount: orgAptitudeList.length,
              itemBuilder: (context, index) {
                var stateStr = '';
                if (orgAptitudeList[index].status == 0) {
                  stateStr = '正常';
                } else {
                  stateStr = '停用';
                }
                return ListTile(
                  title: Text(
                      "${orgAptitudeList[index].orgName}--${orgAptitudeList[index].limitTime}--${orgAptitudeList[index].limitCount}--$stateStr"),
                  onLongPress: () => {
                    print("niaho"),
                    print(orgAptitudeList[index]),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAptitudeItem(
                              orgAptitudeModel: orgAptitudeList[index])),
                    )
                  },
                );
              }),
        ));
  }
}
