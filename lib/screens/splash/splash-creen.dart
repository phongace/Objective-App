import 'package:flutter/material.dart';
import 'package:objective/providers/token-provider.dart';
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
    bool isLogged = await Provider.of<TokenProvider>(context, listen: false).getTokenObj();
    print('is logged: ' + isLogged.toString());
    if (!isLogged) {
      await Future.delayed(const Duration(milliseconds: 1500));
      Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.loginScreen, (Route<dynamic> route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.homeRoute, (Route<dynamic> route) => false);
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
