import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: new FaIcon(
        FontAwesomeIcons.chevronLeft,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
