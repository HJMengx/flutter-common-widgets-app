
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'demos/home.dart';

import '../common/eventBus.dart';
import '../routers/application.dart';
// 使用
import 'todo.dart';

@todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  TextEditingController controller;
  String active =  'test';
  String data = '无';

  final List<DemoCategory> categories = DemoCategorys.toList();




  @override
  Widget build(BuildContext context) {
    print("categories: ${categories[0]}");
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行2个
          mainAxisSpacing: 0.0, //主轴(竖直)方向间距
          crossAxisSpacing: 0.0, //纵轴(水平)方向间距
          childAspectRatio: 0.8 //纵轴缩放比例
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListItemWidget(
          category: categories[index],
        );
      },
    );
  }

  void _onChanged(String value) {
    doSomething();
    setState(() {
      active = value;
      data = '90';
    });
  }
}


class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}


class ListItemWidget extends StatelessWidget {
  final DemoCategory category;

  ListItemWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.green,
        child: Container(
            decoration:  new BoxDecoration(
              color: Colors.white,
              border: Border(
                right: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
                bottom: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
              ),
            ),
            child: new RaisedButton(
                onPressed: () {
                  Application.router.navigateTo(context, "/category/${category.name}");
                },
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(
                      category.icon,
                    ),
                    Text(category.name),
                  ],
                )
            )
        )
    );
  }
}

