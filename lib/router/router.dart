import 'package:flutter/material.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/screens/layout/main.dart';
import 'package:objective/screens/login/login-screen.dart';
import 'package:objective/screens/register/register-screen.dart';
import 'package:objective/screens/settingNewUser/set-name-screen.dart';
import 'package:objective/screens/splash/splash-creen.dart';

abstract class RoutesConstant {
  static final routes = <String, WidgetBuilder>{
    RoutingNameConstant.homeRoute: (BuildContext context) => new DashboardHomePage(),
    RoutingNameConstant.splashScreen: (BuildContext context) => new SplashScreen(),
    RoutingNameConstant.loginScreen: (BuildContext context) => new LoginScreen(),
    RoutingNameConstant.registerScreen: (BuildContext context) => new RegisterScreen(),
    RoutingNameConstant.settingNameScreen: (BuildContext context) => new SetNameScreen(),
  };
}
