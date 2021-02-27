import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonStyle.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 30),
            buildSentence(Constant.TXT_TOPIC_SENTENCE),
            const SizedBox(height: 5),
            buildSentence(Constant.TXT_TOPIC_SENTENCE_2),
          ],
        ),
      ),
    );
  }

  Align buildSentence(String topic) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        topic,
        style: CommonStyle.boldText(context, textSize: 32),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: CommonStyle.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset('images/bot.png'),
            ),
            const SizedBox(width: 8),
            Text(
              'Hi, Phong!',
              style: CommonStyle.defaultText(context),
            ),
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: CommonStyle.whiteColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(FontAwesomeIcons.bell),
          ),
        ),
      ],
    );
  }
}
