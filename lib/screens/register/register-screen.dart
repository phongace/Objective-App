import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constant.dart';
import '../../router/routing-name.dart';
import '../../services/auth-service.dart';
import '../../styles/component.dart';
import '../../widgets/background.dart';
import '../../widgets/base-input.dart';
import '../../widgets/rounded-button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _usernameCtlr = TextEditingController();
  var _emailCtlr = TextEditingController();
  var _passwordCtlr = TextEditingController();
  var _rePasswordCtlr = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Transform.scale(
          scale: 0.45,
          child: InkWell(
            child: SvgPicture.asset(
              'images/icon/ic_back.svg',
              color: CommonStyle.primaryColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    Constant.TXT_CREATE_ACCOUNT,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 45),
                  _buildBody(),
                  const SizedBox(height: 15),
                  Text(
                    Constant.TXT_SOCIAL_MEDIA,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/facebook.png'),
                      const SizedBox(width: 25),
                      Image.asset('images/google.png'),
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
            hint: 'Tên người dùng',
            textCtrl: _usernameCtlr,
            icon: Icons.person,
            validator: (val) => val.isEmpty ? "Tên người dùng không được để trống!" : null,
          ),
          const SizedBox(height: 20),
          BaseTextInput(
            hint: 'Email',
            textCtrl: _emailCtlr,
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => val.isEmpty ? "Email không được để trống!" : null,
          ),
          const SizedBox(height: 20),
          BaseTextInput(
            hint: 'Mật khẩu',
            textCtrl: _passwordCtlr,
            icon: Icons.lock,
            obscureText: true,
            validator: (val) => val.isEmpty ? "Mật khẩu không được để trống!" : null,
          ),
          const SizedBox(height: 20),
          BaseTextInput(
            hint: 'Nhập lại mật khẩu',
            icon: Icons.lock,
            textCtrl: _rePasswordCtlr,
            obscureText: true,
            validator: (val) => val.isEmpty
                ? "Nhập lại mật khẩu không được để trống!"
                : val != _passwordCtlr.text
                    ? "Nhập lại mật khẩu chưa đúng!"
                    : null,
          ),
          const SizedBox(height: 40),
          RoundedButton(
            text: Constant.TXT_REGISTER,
            onPress: () {
              _handleRegister().then((value) {
                if (value) {
                  Navigator.of(context).pushNamedAndRemoveUntil(RoutingNameConstant.loginScreen, (route) => false);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _handleRegister() async {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    Map map = new Map();
    map['name'] = _usernameCtlr.text;
    map['email'] = _emailCtlr.text;
    map['password'] = _passwordCtlr.text;
    final response = await AuthService.register(map);
    // Navigator.of(context).pop();
    print(response);
    if (response.data == null) {
      return false;
    }
    return true;
  }
}
