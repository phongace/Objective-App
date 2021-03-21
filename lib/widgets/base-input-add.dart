import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/styles/component.dart';

class TextInputAdd extends StatelessWidget {
  final TextEditingController textCtrl;
  final Function onChanged;
  final String hint;
  final FormFieldValidator<String> validator;

  const TextInputAdd({
    Key key,
    this.textCtrl,
    this.onChanged,
    this.hint,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        controller: textCtrl,
        style: TextStyle(
          fontSize: 15,
          color: CommonStyle.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: new InputDecoration(
          hintText: hint,
          fillColor: Colors.grey[200].withOpacity(0.5),
          filled: true,
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
        validator: validator,
        onChanged: (value) {
          this.onChanged(value);
        },
      ),
    );
  }
}
