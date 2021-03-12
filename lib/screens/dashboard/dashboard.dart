import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/providers/user-provider.dart';
import 'package:objective/styles/component.dart';
import 'package:provider/provider.dart';

import '../../styles/component.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 25),
              buildSentence(Constant.TXT_TOPIC_SENTENCE),
              const SizedBox(height: 5),
              buildSentence(Constant.TXT_TOPIC_SENTENCE_2),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                    context,
                    'images/goal_ic.png',
                    Color(0xFFD5E0F2),
                    'Target',
                  ),
                  _buildButton(
                    context,
                    'images/financial_ic.png',
                    Color(0xFFFFFF9B),
                    'Financial',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                    context,
                    'images/appointment_ic.png',
                    Color(0xFFF6DBAC),
                    'Appointment',
                  ),
                  _buildButton(
                    context,
                    'images/statistics_ic.png',
                    Color(0xFFA4E572),
                    'Statistics',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String image, Color color, String name) {
    return Column(
      children: [
        Container(
          width: 155,
          height: 155,
          child: Image.asset(image),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: CommonStyle.boldText(context, textSize: 20),
        )
      ],
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
            Consumer<UserProvider>(
              builder: (_, model, __) {
                return Text(
                  'Hi, ${model.user?.name ?? 'You'}!',
                  style: CommonStyle.defaultText(context),
                );
              },
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
