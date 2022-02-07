import 'package:flutter/material.dart';
import 'package:fyp/screens/onboarding//components/welcome_text.dart';

class IdentityStep extends StatelessWidget {
  const IdentityStep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WelcomeText(),
        SizedBox(
          height: 30,
        ),
        TextField(
          onSubmitted: null,
          decoration: InputDecoration(
            hintText: "Enter your NIC",
            labelText: "National Identity",
          ),
        ),
        SizedBox(
          height: 150,
        ),
      ],
    );
  }
}
