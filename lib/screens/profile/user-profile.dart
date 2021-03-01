import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:objective/providers/token-provider.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/styles/component.dart';
import 'package:objective/utils/dialog-builder.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: CommonStyle.whiteColor,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          'images/icon/ic_logout.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Logout',
                        style: CommonStyle.defaultText(context),
                      )
                    ],
                  ),
                ),
                // onTap: () {
                //   DialogBuilder.buildConfirmDialog(
                //     context: context,
                //     message: 'Do you really want to log out',
                //     // imageSvg: 'images/ic_logout_circle.svg',
                //   ).then((value) {
                //     Provider.of<TokenProvider>(context, listen: false).removeToken();
                //   });
                // },
                onTap: () {
                  Provider.of<TokenProvider>(context, listen: false).removeToken();
                  Navigator.pushNamedAndRemoveUntil(context, RoutingNameConstant.loginScreen, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
