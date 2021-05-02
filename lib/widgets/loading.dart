import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:objective/styles/component.dart';

class LoadingWidget extends StatelessWidget {
  final double padding;

  const LoadingWidget({Key key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      child: Padding(
        padding: EdgeInsets.only(bottom: padding ?? ''),
        child: SpinKitFoldingCube(
          color: CommonStyle.primaryColor,
        ),
      ),
    );
  }
}
