import 'package:flutter/material.dart';
import 'package:objective/screens/add/add-target.dart';
import 'package:objective/styles/component.dart';

class CustomAppbar extends StatefulWidget {
  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TabBar(
            controller: _tabController,
            labelColor: CommonStyle.primaryColor,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 6.0,
            indicatorPadding: const EdgeInsets.only(top: 1.0),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(),
              gradient: LinearGradient(
                colors: [
                  CommonStyle.primaryColor,
                  Colors.purple,
                ],
              ),
            ),
            tabs: [
              Container(
                height: 40,
                width: 80,
                alignment: Alignment.center,
                color: Colors.white,
                child: Text('Target'),
              ),
              Container(
                height: 40,
                width: 80,
                alignment: Alignment.center,
                color: Colors.white,
                child: Text('Financial'),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                color: Colors.white,
                child: Text('Appointment'),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: TabBarView(
              controller: _tabController,
              children: [
                AddTargetScreen(),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
