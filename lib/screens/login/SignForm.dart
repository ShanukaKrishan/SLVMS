import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/components/DefaultButton.dart';
import 'package:fyp/mainHomePage.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  const SignForm({
    Key key,
  }) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  login(String userName, String password) async {
    print(userName);
    var url = Uri.parse("https://vms-sl.azurewebsites.net/auth/login");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {"userName": userName, "password": password};
    var body = json.encode(data);
    print(url);
    var jsonResponse;
    try {
      var res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        print("Response Status: ${res.statusCode}");
        if (res.statusCode == 403) {
          print(json.decode(res.body));
        }

        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });

          sharedPreferences.setString("token", jsonResponse['token']);
          sharedPreferences.setString("name", jsonResponse['userName']);

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => HomePage()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
      if (res.statusCode == 503) {
        print("Server under maintenance, Please check after a while ");
      } else if (res.statusCode == 401) {
        print(json.decode(res.body));
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              suffixIcon: Icon(Icons.mail),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.lock,
              ),
              hintText: "Enter your password",
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: 50,
          ),
          DefaultButton(
            press: () {
              setState(() {
                _isLoading = true;
              });

              login(_emailController.text, _passwordController.text);
            },
            text: "Login",
          ),
        ],
      ),
    );
  }
}
