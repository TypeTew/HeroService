import 'package:HeroServiceApp/screens/dashboard/dashboard.dart';
import 'package:HeroServiceApp/screens/lockscreen/lock_screen.dart';
import 'package:HeroServiceApp/screens/login/login_screen.dart';
import 'package:HeroServiceApp/screens/newsdetail/newsdetail_screen.dart';
import 'package:HeroServiceApp/screens/qrcode/qrcode_screen.dart';
import 'package:HeroServiceApp/screens/userprofile/userprofile_screen.dart';
import 'package:HeroServiceApp/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/lockscreen": (BuildContext context) => LockScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/userprofile": (BuildContext context) => UserProfileScreen(),
  "/newsdetail": (BuildContext context) => NewsDetailScreen(),
  "/qrcode": (BuildContext context) => QRCodeScreen(),
};
