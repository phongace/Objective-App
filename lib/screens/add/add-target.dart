import 'package:flutter/material.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/base-input-add.dart';

class AddTargetScreen extends StatefulWidget {
  @override
  _AddTargetScreenState createState() => _AddTargetScreenState();
}

class _AddTargetScreenState extends State<AddTargetScreen> {
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonStyle.whiteColor,
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextInputAdd(
              hint: 'Title',
            ),
          ],
        ),
      ),
    );
  }
}
