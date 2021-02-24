import 'package:flutter/material.dart';
import 'package:objective/styles/component.dart';

class DashboardHomePage extends StatefulWidget {
  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonStyle.bgColor,
      body: Column(
        children: [
          Row(
            children: [
              Text('hello world'),
            ],
          )
        ],
      ),
    );
  }
}
