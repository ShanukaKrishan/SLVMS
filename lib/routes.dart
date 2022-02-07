import 'package:flutter/material.dart';
import 'package:fyp/screens/appointment/bookAppointment.dart';
import 'package:fyp/screens/information/infromation.dart';
import 'package:fyp/screens/login/login.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:fyp/screens/services/services.dart';
import 'screens/home/home.dart';
import 'screens/appointment/appointment.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  Home.routeName: (context) => Home(),
  Appointment.routeName: (context) => Appointment(),
  Services.routeName: (context) => Services(),
  Profile.routeName: (context) => Profile(),
  Information.routeName: (context) => Information(),
  BookAppointment.routeName: (context) => BookAppointment(),
};
