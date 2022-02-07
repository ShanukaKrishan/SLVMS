import 'package:flutter/material.dart';
import 'package:fyp/components/MainAppBar.dart';
import 'package:fyp/components/VaccineDetailsCard.dart';
import 'package:fyp/components/default_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp/screens/appointment/bookAppointment.dart';

class Appointment extends StatefulWidget {
  static String routeName = '/appointmentScreen';

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                " Your Appointments",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 600,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 3,
                    color: Color.fromRGBO(132, 135, 142, 1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/bottle.png"),
                            color: Color.fromRGBO(132, 135, 142, 1),
                            height: 30,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Pfizer",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/injection2.png"),
                            color: Color.fromRGBO(132, 135, 142, 1),
                            height: 30,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Batch 00001",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/calendar2.png"),
                            color: Color.fromRGBO(132, 135, 142, 1),
                            height: 30,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "DD/MM/YYYY",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/hospital.png"),
                            color: Color.fromRGBO(132, 135, 142, 1),
                            height: 30,
                            width: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Army camp",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                color: Color.fromRGBO(59, 240, 132, 1),
                text: "Add to calendar",
                press: () {},
              ),
              SizedBox(
                height: 10,
              ),
              DefaultButton(
                color: Color.fromRGBO(68, 198, 252, 1),
                text: "Get directions",
                press: () {},
              ),
              SizedBox(
                height: 10,
              ),
              DefaultButton(
                color: Color.fromRGBO(251, 70, 70, 1),
                text: "Cancel appointment",
                press: () {},
              ),
              SizedBox(
                height: 70,
              ),
              DefaultButton(
                text: "Book An Appointment",
                press: () {
                  Navigator.pushNamed(context, BookAppointment.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
