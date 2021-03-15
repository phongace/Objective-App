import 'package:flutter/material.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/screens/settingNewUser/first-intro-screen.dart';
import 'package:objective/services/user-service.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/background.dart';
import 'package:objective/widgets/base-input.dart';
import 'package:objective/widgets/next-button.dart';

class SetNameScreen extends StatefulWidget {
  @override
  _SetNameScreenState createState() => _SetNameScreenState();
}

class _SetNameScreenState extends State<SetNameScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  var _usernameCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      _handleUpdate().then((value) {
                        if (value) {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return FirstIntroScreen(
                                  transitionAnimation: animation,
                                );
                              },
                              transitionDuration: Duration(seconds: 1),
                            ),
                          );
                        }
                      });
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
          Form(
            key: formKey,
            child: BaseTextInput(
              hint: 'Tên người dùng',
              textCtrl: _usernameCtlr,
              icon: Icons.person,
              validator: (val) => val.isEmpty ? "Tên người dùng không được để trống!" : null,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _handleUpdate() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    Map map = new Map();
    map['name'] = _usernameCtlr.text;
    final response = await UserService.updateName(map);
    print(response);
    if (response == null) {
      return false;
    }
    return true;
  }
}
