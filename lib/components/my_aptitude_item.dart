// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Text("城市==" + widget.orgAptitudeModel.city),
          Text("组织机构==" + widget.orgAptitudeModel.orgName),
          Text("时间==" + widget.orgAptitudeModel.limitTime),
          Text("状态==" + (widget.orgAptitudeModel.status == 0 ? "正常" : "停用")),
          GestureDetector(
            onTap: () {
              // 在这里执行按钮被点击时的操作
              print('Button clicked!');

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Dialog Title'),
                    content: Text('修改成功'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // 在这里执行按钮被点击时的操作
                          print('Button clicked!');
                          Navigator.of(context).pop(); // 关闭弹框
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '修改规则状态',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
