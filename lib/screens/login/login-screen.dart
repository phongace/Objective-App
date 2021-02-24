import 'package:flutter/material.dart';
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
          Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomPadding: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            text: 'Login',
            onPress: () => login(context),
          ),
        ],
      ),
    );
  }

  void login(BuildContext context) async {}
}
