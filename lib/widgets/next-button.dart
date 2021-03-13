import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class NextButton extends StatefulWidget {
  final Color color;
  final Function onPress;
  final Color colorIcon;
  final Color colorText;

  const NextButton({
    Key key,
    this.color,
    this.colorIcon,
    this.colorText,
    @required this.onPress,
  }) : super(key: key);

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.25,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constant.borderRadius),
        color: widget.color ?? CommonStyle.primaryColor,
      ),
      child: TextButton(
        onPressed: widget.onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 2),
            Text(
              'Next',
              style: TextStyle(
                color: widget.colorText ?? CommonStyle.whiteColor,
                fontSize: 18,
              ),
            ),
            SvgPicture.asset(
              'images/icon/ic_next.svg',
              color: widget.colorIcon ?? CommonStyle.whiteColor,
              width: 14,
            ),
          ],
        ),
      ),
    );
  }
}
