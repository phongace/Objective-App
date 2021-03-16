import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class NextButton extends StatefulWidget {
  final Color color;
  final Function onPress;
  final Color colorIcon;
  final Color colorText;
  final String text;

  const NextButton({
    Key key,
    this.color,
    this.colorIcon,
    this.colorText,
    this.text,
    @required this.onPress,
  }) : super(key: key);

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> with SingleTickerProviderStateMixin {
  AnimationController _animation;
  double _scale;

  @override
  void initState() {
    _animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.5,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _scale = 1 + _animation.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onPress,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: size.width * 0.25,
          height: size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.borderRadius),
            color: widget.color ?? CommonStyle.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 2),
              Text(
                widget.text ?? 'Next',
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
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    _animation.forward();
  }

  _onTapUp(TapUpDetails details) {
    _animation.reverse();
  }
}
