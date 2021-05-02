import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class BaseTextInput extends StatelessWidget {
  final TextEditingController textCtrl;
  final Function onChanged;
  final String hint;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;

  BaseTextInput({
    Key key,
    this.textCtrl,
    this.onChanged,
    this.hint,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textCtrl,
      style: TextStyle(
        fontSize: 15,
        color: CommonStyle.primaryColor,
      ),
      decoration: new InputDecoration(
        hintText: hint,
        fillColor: Colors.grey[200].withOpacity(0.5),
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
          borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
        ),
        errorStyle: TextStyle(fontSize: 14.0),
        hintStyle: CommonStyle.defaultText(context, color: CommonStyle.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CommonStyle.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CommonStyle.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(Constant.borderRadius)),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
