// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/OrgAptitudeModel.dart';
import 'package:flutter_application_2/utils/dio_http.dart';
import 'package:flutter_application_2/utils/store.dart';

class MyAptitudeItem extends StatefulWidget {
  final OrgAptitudeModel orgAptitudeModel;

  const MyAptitudeItem({
    Key? key,
    required this.orgAptitudeModel,
  }) : super(key: key);

  @override
  State<MyAptitudeItem> createState() => _MyAptitudeItemState();
}

class _MyAptitudeItemState extends State<MyAptitudeItem> {
  int myStatus = 0;

  @override
  void initState() {
    super.initState();
    myStatus = widget.orgAptitudeModel.status;
  }

  Future<void> _changeStatus(int id, int status) async {
    Store store = await Store.getInstance();
    var token = await store.getString(StoreKeys.token);
    print("token===" + token);
    const url = '/org/aptitude/changeStatus';
    var params = {'id': id, 'status': status};
    print('params:' + params.toString());
    var res = await DioHttp.of(context).post(url, params, token);
    // var resMap = json.decode(res.toString());
    print("res===" + res.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑状态'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 200.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  "城市==" + widget.orgAptitudeModel.city),
              Text(
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  "组织机构==" + widget.orgAptitudeModel.orgName),
              Text(
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  "时间==" + widget.orgAptitudeModel.limitTime),
              Text(
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  "状态==" + (myStatus == 0 ? "正常" : "停用")),
              GestureDetector(
                onTap: () {
                  // 在这里执行按钮被点击时的操作
                  print('Button clicked! start _changeStatus');
                  _changeStatus(
                      widget.orgAptitudeModel.id, myStatus == 0 ? -1 : 0);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('修改状态'),
                        content: const Text('修改成功'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // 在这里执行按钮被点击时的操作
                              print('Button clicked!' +
                                  widget.orgAptitudeModel.id.toString() +
                                  widget.orgAptitudeModel.status.toString() +
                                  widget.orgAptitudeModel.city.toString());
                              setState(() {
                                if (myStatus == 0) {
                                  myStatus = -1;
                                } else {
                                  myStatus = 0;
                                }
                                print('myStatus===' + myStatus.toString());
                                print('orgAptitudeModel===' +
                                    widget.orgAptitudeModel.toString());
                              });

                              Navigator.of(context).pop(); // 关闭弹框
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    '修改规则状态',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
