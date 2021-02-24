import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class BaseTextInput extends StatelessWidget {
  final TextEditingController textCtrl;
  final Function(String) onChangeText;
  final String hint;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final IconData icon;

  const BaseTextInput({
    Key key,
    this.textCtrl,
    this.onChangeText,
    this.hint,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textCtrl,
        style: TextStyle(
          fontSize: 15,
          color: CommonStyle.primaryColor,
        ),
        decoration: new InputDecoration(
          hintText: hint,
          fillColor: Colors.grey[300].withOpacity(0.5),
          prefixIcon: Icon(
            icon,
            color: CommonStyle.whiteColor,
            size: 22,
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
          isDense: true,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          errorStyle: TextStyle(fontSize: 14.0),
          hintStyle: CommonStyle.defaultText(context, color: CommonStyle.whiteColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfffafafa)),
            borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfffafafa)),
            borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
          ),
        ),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: (value) => onChangeText(value),
      ),
    );
  }
}
