import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigatePushAndRemoveUntil(String routeName) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  BuildContext getContext() {
    return navigatorKey.currentState.overlay.context;
  }
}
