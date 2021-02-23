import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            const Color(0xffffffff),
            const Color(0xff237CCB),
          ],
        ),
      ),
    );
  }
}
