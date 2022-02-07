import 'package:flutter/material.dart';
import 'package:fyp/components/MainAppBar.dart';
import 'package:fyp/components/default_button.dart';
import 'package:fyp/screens/onboarding/components/CustomAppBar.dart';

class Profile extends StatelessWidget {
  static String routeName = '/profileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SafeArea(
          child: MainAppBar(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Your Account Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(
                thickness: 1.2,
                color: Color.fromRGBO(132, 135, 142, 1),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Krishan",
                  labelText: "Username",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Shanukakrishan@yahoo.com",
                  labelText: "Email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "83838383",
                  labelText: "Phone number",
                ),
              ),
              SizedBox(
                height: 13,
              ),
              DefaultButton(
                text: "Update Details",
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "Your Login Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(
                thickness: 1.2,
                color: Color.fromRGBO(132, 135, 142, 1),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your current password",
                  labelText: "Current Password",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your new password",
                  labelText: "New Password",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Confirm your new password",
                  labelText: "Confirm Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                text: "Update Password",
              ),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                color: Colors.red,
                text: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
