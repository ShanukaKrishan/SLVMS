import 'package:flutter/material.dart';
import 'sign_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  static String routeName = '/loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 10),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Text(
                  "Health Promotion Bureau",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Vaccine Management System",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                SignForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
