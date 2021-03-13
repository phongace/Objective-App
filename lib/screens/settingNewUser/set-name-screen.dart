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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              children: [
                BaseTextInput(
                  hint: 'Tên người dùng',
                  textCtrl: _usernameCtlr,
                  icon: Icons.person,
                  validator: (val) => val.isEmpty ? "Tên người dùng không được để trống!" : null,
                ),
                const SizedBox(height: 100),
                Text(
                  'dasdsdsad',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
