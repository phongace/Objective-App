import 'package:flutter/material.dart';
import 'package:objective/widgets/background.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // _loadNextScreen() {}

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
