import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:objective/plugin/locator.dart';
import 'package:objective/plugin/navigator.dart';
import 'package:objective/providers/token-provider.dart';
import 'package:objective/providers/user-provider.dart';
import 'package:objective/router/router.dart';
import 'package:objective/screens/splash/splash-creen.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TokenProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: RoutesConstant.routes,
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
    );
  }
}
