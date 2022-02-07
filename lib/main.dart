import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/login/login.dart';
import 'theme.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: LoginScreen(),
    );
  }
}
