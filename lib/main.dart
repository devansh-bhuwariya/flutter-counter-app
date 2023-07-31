// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:counter/screen/SplashScreen.dart';
import 'package:counter/screen/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 1",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
