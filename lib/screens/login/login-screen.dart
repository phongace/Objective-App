import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/background.dart';
import 'package:objective/widgets/base-input.dart';
import 'package:objective/widgets/rounded-button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _username = TextEditingController();
  var _password = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Login Now!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  _buildBody(),
                  const SizedBox(height: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constant.TXT_HAVE_ACCOUNT,
                        style: CommonStyle.defaultText(
                          context,
                          color: CommonStyle.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        Constant.TXT_LOGIN.toUpperCase(),
                        style: CommonStyle.boldText(
                          context,
                          color: CommonStyle.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BaseTextInput(
            hint: 'Username',
            textCtrl: _username,
            icon: Icons.person,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => val.isEmpty ? "Email không được để trống!" : null,
          ),
          const SizedBox(height: 24),
          BaseTextInput(
            hint: 'Password',
            icon: Icons.lock,
            textCtrl: _password,
            obscureText: true,
            validator: (val) => val.isEmpty ? "Password không được để trống!" : null,
          ),
          const SizedBox(height: 50),
          RoundedButton(
            text: Constant.TXT_LOGIN,
            onPress: () => login(context),
          ),
        ],
      ),
    );
  }

  void login(BuildContext context) async {}
}
