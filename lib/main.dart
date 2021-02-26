import 'package:flutter/material.dart';
import 'package:objective/providers/token-provider.dart';
import 'package:objective/router/router.dart';
import 'package:objective/screens/splash/splash-creen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => TokenProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: RoutesConstant.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
    );
  }
}
