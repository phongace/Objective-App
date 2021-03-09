import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class RoundedButton extends StatelessWidget {
  final String text;

  final Function onPress;

  const RoundedButton({@required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constant.borderRadius),
        color: CommonStyle.whiteColor,
      ),
      child: TextButton(
        child: Text(
          text.toUpperCase(),
          style: CommonStyle.defaultText(context, color: CommonStyle.primaryColor),
        ),
        onPressed: onPress,
      ),
    );
  }
}
