import 'package:flutter/material.dart';
import 'package:fyp/screens/appointment/BookAppointment.dart';
import 'package:fyp/screens/information/Infromation.dart';
import 'package:fyp/screens/login/Login.dart';
import 'package:fyp/screens/profile/Profile.dart';
import 'package:fyp/screens/services/Services.dart';
import 'screens/home/Home.dart';
import 'screens/appointment/YourAppointments.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  Home.routeName: (context) => Home(),
  Appointment.routeName: (context) => Appointment(),
  Services.routeName: (context) => Services(),
  Profile.routeName: (context) => Profile(),
  Information.routeName: (context) => Information(),
  BookAppointment.routeName: (context) => BookAppointment(),
};
