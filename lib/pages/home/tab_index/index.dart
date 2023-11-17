import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

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
      child: Column(children: [
        const Text("nihaonia"),
        BrnIconButton(
          name: '文字在左',
          direction: Direction.left,
          padding: 4,
          iconWidget: const Icon(Icons.radio_button_on),
          onTap: () => {Navigator.of(context).pushNamed('/')},
        ),
        GFButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          text: "primary",
          shape: GFButtonShape.pills,
        ),
      ]),
    );
  }
}
