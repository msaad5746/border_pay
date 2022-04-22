import 'package:flutter/material.dart';

class Utils{
  static GlobalKey<NavigatorState> mainKey = GlobalKey();
  static GlobalKey<NavigatorState> dashboardKey = GlobalKey();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static GlobalKey<FormState> loginPageFormKey = GlobalKey<FormState>();

  static GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  static GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  static GlobalKey<FormState> passportKey = GlobalKey<FormState>();
  static GlobalKey<FormState> travelerDetailsKey = GlobalKey<FormState>(debugLabel: 'travelerDetailsKey');
  static GlobalKey<FormState> forgotPassword = GlobalKey<FormState>();


}