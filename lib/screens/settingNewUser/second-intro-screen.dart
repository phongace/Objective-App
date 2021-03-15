import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/screens/settingNewUser/third-intro-screen.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/widgets/next-button.dart';

class SecondIntroScreen extends StatelessWidget {
  final Animation<double> transitionAnimation2;

  const SecondIntroScreen({Key key, this.transitionAnimation2}) : super(key: key);
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
          animation: transitionAnimation2,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ).animate(transitionAnimation2),
              child: child,
            );
          },
          child: Column(
            children: [
              _buildInfo(),
              Align(
                alignment: Alignment.centerRight,
                child: NextButton(
                  onPress: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ThirdIntroScreen(transitionAnimation3: animation);
                        },
                        transitionDuration: Duration(seconds: 1),
                      ),
                    );
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
            'images/goal.png',
            height: 140,
          ),
          const SizedBox(height: 70),
          Text(
            'Target management',
            style: TextStyle(
              color: Color(0XFF237CCB),
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'We provide tools to help you effectively',
            style: TextStyle(
              color: Color(0XFF237CCB),
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'achieve your goals',
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
