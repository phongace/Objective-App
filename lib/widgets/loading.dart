import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:objective/styles/component.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      child: SpinKitFoldingCube(
        color: CommonStyle.primaryColor,
      ),
    );
  }
}
