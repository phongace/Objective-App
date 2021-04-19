import 'package:flutter/material.dart';
import 'package:objective/models/user/user.dart';
import 'package:objective/providers/token-provider.dart';
import 'package:objective/providers/user-provider.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/widgets/background.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadNextScreen());
  }

  _loadNextScreen() async {
    User user = await Provider.of<UserProvider>(context, listen: false).getUser();
    bool isLogged = await Provider.of<TokenProvider>(context, listen: false).getTokenObj();
    bool isNewUser = user?.isNewUser;
    print('is logged: $isLogged');
    if (!isLogged || isNewUser == null) {
      await Future.delayed(const Duration(milliseconds: 1500));
      Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.loginScreen, (Route<dynamic> route) => false);
    } else {
      if (isNewUser) {
        Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.settingNameScreen, (Route<dynamic> route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.homeRoute, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Center(
          child: Image.asset(
            'images/logo.png',
            height: 160,
          ),
        ),
      ],
    );
  }
}
