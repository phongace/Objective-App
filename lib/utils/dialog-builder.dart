import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/styles/component.dart';

abstract class DialogBuilder {
  static Future<bool> buildConfirmDialog({BuildContext context, String message, String imageSvg}) async {
    Widget cancelButton = FlatButton(
      child: Text(
        'Cancel',
        style: CommonStyle.defaultText(context),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(false);
      },
    );

    Widget okButton = FlatButton(
      child: Text(
        'Confirm',
        style: CommonStyle.defaultText(context),
      ),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop(true);
      },
    );

    Widget _content = Container(
      padding: const EdgeInsets.only(top: 40, bottom: 20, left: 60, right: 60),
      child: Column(
        children: [
          SizedBox(
            height: 46,
            width: 46,
            child: SvgPicture.asset(
              imageSvg,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            message ?? '',
            style: CommonStyle.defaultText(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    AlertDialog alert = AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(minHeight: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _content,
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFDDDEDF),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: okButton,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDDDEDF), width: 0.5),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        )),
                    child: cancelButton,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

    bool result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => alert,
    );
    return result;
  }
}
