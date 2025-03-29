import 'package:flutter/material.dart';
import 'package:schoolapp/loginpage.dart';
import 'package:schoolapp/preference_selection.dart';
import 'package:schoolapp/signuppage.dart';
import 'package:schoolapp/welcomescreen.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(builder:(context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
