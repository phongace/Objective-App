import 'package:flutter/material.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/background.dart';
import 'package:objective/widgets/base-input.dart';
import 'package:objective/widgets/next-button.dart';

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
                _columnCenter(),
                Align(
                  alignment: Alignment.centerRight,
                  child: NextButton(
                    color: CommonStyle.whiteColor,
                    colorIcon: CommonStyle.primaryColor,
                    colorText: CommonStyle.primaryColor,
                    onPress: () {
                      print('dsadasd');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _columnCenter() {
    var size = MediaQuery.of(context).size;
    return Expanded(
        child: Column(
      children: [
        Container(height: size.height * 0.3),
        Text(
          'Nhập tên bạn muốn hiển thị',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(height: 15),
        BaseTextInput(
          hint: 'Tên người dùng',
          textCtrl: _usernameCtlr,
          icon: Icons.person,
          validator: (val) => val.isEmpty ? "Tên người dùng không được để trống!" : null,
        ),
      ],
    ));
  }
}
