// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import, file_names, use_key_in_widget_constructors, prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:counter/loginScreen.dart';
import 'package:counter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = 'Login';
  @override
  void initState() {
    super.initState();

    destination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "COUNTER.....,",
                style: TextStyle(
                    fontFamily: "Riberthy",
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void destination() async {
    var sharedPref = await SharedPreferences.getInstance();

    sharedPref.getBool(KEYLOGIN);

    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
      print(isLoggedIn);
    });
  }
}
