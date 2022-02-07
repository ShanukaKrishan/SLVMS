import 'package:flutter/material.dart';
import 'package:fyp/screens/onboarding/components/CardDetails.dart';
import 'package:fyp/screens/onboarding/components/welcome_text.dart';

class PersonalDetailsStep extends StatelessWidget {
  const PersonalDetailsStep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WelcomeText(),
        SizedBox(
          height: 20,
        ),
        Text(
          "Your personal details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Card(
          elevation: 5,
          color: Colors.grey.shade50,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                UserCardDetails(
                  category: "NIC",
                  detail: "00000V",
                ),
                UserCardDetails(
                  category: "Full Name",
                  detail: "Krishan shanuka",
                ),
                UserCardDetails(
                  category: "Date of Birth",
                  detail: "9/1/2010",
                ),
                UserCardDetails(
                  category: "Gender",
                  detail: "Male",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 23,
        ),
      ],
    );
  }
}
