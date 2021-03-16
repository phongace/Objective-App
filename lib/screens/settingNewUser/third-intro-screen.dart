import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/next-button.dart';

class ThirdIntroScreen extends StatelessWidget {
  final Animation<double> transitionAnimation3;

  const ThirdIntroScreen({Key key, this.transitionAnimation3}) : super(key: key);
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
      backgroundColor: CommonStyle.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: AnimatedBuilder(
          animation: transitionAnimation3,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ).animate(transitionAnimation3),
              child: child,
            );
          },
          child: Column(
            children: [
              _buildInfo(),
              Align(
                alignment: Alignment.centerRight,
                child: NextButton(
                  text: 'Start',
                  onPress: () {
                    Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.homeRoute, (route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/receipt.png',
            height: 140,
          ),
          const SizedBox(height: 70),
          Text(
            'Financial management',
            style: TextStyle(
              color: Color(0XFF237CCB),
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'And manage your finances',
            style: TextStyle(
              color: Color(0XFF237CCB),
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'more effectively',
            style: TextStyle(
              color: Color(0XFF237CCB),
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
