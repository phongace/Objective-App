import 'package:flutter/material.dart';
import 'package:objective/widgets/background.dart';
import 'package:objective/widgets/base-input.dart';

class SetNameScreen extends StatefulWidget {
  @override
  _SetNameScreenState createState() => _SetNameScreenState();
}

class _SetNameScreenState extends State<SetNameScreen> {
  var _usernameCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          BaseTextInput(
            hint: 'Tên người dùng',
            textCtrl: _usernameCtlr,
            icon: Icons.person,
            textInputAction: TextInputAction.next,
            validator: (val) => val.isEmpty ? "Tên người dùng không được để trống!" : null,
          ),
        ],
      ),
    );
  }
}
