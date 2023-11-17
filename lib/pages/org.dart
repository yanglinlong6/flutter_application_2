import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class Org extends StatefulWidget {
  const Org({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrgState createState() => _OrgState();
}

class _OrgState extends State<Org> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Center(
        child: BrnIconButton(
            name: '文字在下',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
            direction: Direction.bottom,
            padding: 4,
            iconHeight: 30,
            iconWidth: 30,
            iconWidget: const Icon(Icons.arrow_upward),
            onTap: () {
              BrnToast.show('按钮被点击', context);
            }),
      ),
    );
  }
}
