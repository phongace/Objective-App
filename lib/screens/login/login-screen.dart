import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/providers/token-provider.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/services/auth-service.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/background.dart';
import 'package:objective/widgets/base-input.dart';
import 'package:objective/widgets/rounded-button.dart';
import 'package:provider/provider.dart';

import '../../router/routing-name.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _emailCtlr = TextEditingController();
  var _passwordCtlr = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Login Now!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
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
                        Constant.TXT_NO_ACCOUNT,
                        style: CommonStyle.defaultText(
                          context,
                          color: CommonStyle.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        child: Text(
                          Constant.TXT_REGISTER.toUpperCase(),
                          style: CommonStyle.boldText(
                            context,
                            color: CommonStyle.whiteColor,
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(context, RoutingNameConstant.registerScreen),
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
            hint: 'Email',
            textCtrl: _emailCtlr,
            icon: Icons.person,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => val.isEmpty ? "Email không được để trống!" : null,
          ),
          const SizedBox(height: 24),
          BaseTextInput(
            hint: 'Password',
            icon: Icons.lock,
            textCtrl: _passwordCtlr,
            obscureText: true,
            validator: (val) => val.isEmpty ? "Password không được để trống!" : null,
          ),
          const SizedBox(height: 50),
          RoundedButton(
            text: Constant.TXT_LOGIN,
            onPress: () {
              _handleLogin().then((value) {
                if (value) {
                  Navigator.of(context).pushNamedAndRemoveUntil(RoutingNameConstant.homeRoute, (route) => false);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _handleLogin() async {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    Map map = new Map();
    map['email'] = _emailCtlr.text;
    map['password'] = _passwordCtlr.text;
    final response = await AuthService.login(map);
    // Navigator.of(context).pop();
    print(response);
    if (response.data == null) {
      return false;
    }
    Provider.of<TokenProvider>(context, listen: false).setTokenObj(jsonEncode(response.data));
    return true;
  }
}
