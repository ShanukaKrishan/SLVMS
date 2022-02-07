import 'package:flutter/material.dart';
import 'package:fyp/screens/onboarding/components/welcome_text.dart';

class RegistrationStep extends StatelessWidget {
  const RegistrationStep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WelcomeText(),
        SizedBox(
          height: 15,
        ),
        Form(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "username",
                  suffixIcon: Icon(Icons.person_rounded),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                  suffixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  labelText: "Confirm password",
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  labelText: "Phone number",
                  suffixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
