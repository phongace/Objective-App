import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class AddButton extends StatefulWidget {
  final Color color;
  final Function onPress;
  final Color colorText;
  final String text;

  const AddButton({
    Key key,
    this.color,
    this.colorText,
    this.text,
    @required this.onPress,
  }) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> with SingleTickerProviderStateMixin {
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
          width: size.width * 0.27,
          height: size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.borderRadius),
            color: widget.color ?? CommonStyle.primaryColor,
          ),
          child: Center(
            child: Text(
              widget.text ?? 'Create',
              style: TextStyle(
                color: widget.colorText ?? CommonStyle.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
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
