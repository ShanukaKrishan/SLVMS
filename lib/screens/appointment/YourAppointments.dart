import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/MainAppBar.dart';
import 'components/YourAppointmentCard.dart';
import 'package:fyp/components/DefaultButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp/screens/appointment/BookAppointment.dart';

class Appointment extends StatefulWidget {
  static String routeName = '/appointmentScreen';

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<Widget> appointmentCards = [];
  bool value = true;

  Future cancelAppointment() async {
    http.Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    int id = (prefs.getInt('appointmentId') ?? '');
    String url = "https://vms-sl.azurewebsites.net/appointment/cancel/$id";

    response = await http.put(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Appointment Successfully Cancelled");
      print(json.decode(response.body));
    }
  }

  Future getAppointments() async {
    http.Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    String url = "https://vms-sl.azurewebsites.net/user/appointments";

    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.body != null) {
      List appointmentData = [];

      appointmentData = json.decode(response.body);
      appointmentCards.clear();

      print(appointmentData);
      for (int i = 0; i < appointmentData.length; i++) {
        appointmentCards.add(
          YourAppointmentCard(
            vaccineType: appointmentData[i]['vaccine'],
            batchNo: appointmentData[i]['batchNumber'],
            date: appointmentData[i]['date'],
            location: appointmentData[i]['vCenter'],
            status: appointmentData[i]['status'],
            id: appointmentData[i]['id'],
          ),
        );
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SafeArea(
          child: MainAppBar(),
        ),
      ),
      body: FutureBuilder(
          future: getAppointments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
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
                      Column(
                        children: appointmentCards,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        color: Colors.green,
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
                        press: () {
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              onConfirmBtnTap: () {
                                setState(() {
                                  cancelAppointment();
                                });
                                Navigator.pop(context);
                              });
                        },
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      DefaultButton(
                        text: "Book An Appointment",
                        press: () {
                          Navigator.pushNamed(
                              context, BookAppointment.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
