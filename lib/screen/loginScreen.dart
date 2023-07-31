// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_print, sort_child_properties_last, unused_import, file_names, use_build_context_synchronously

import 'dart:ui';

import 'package:counter/screen/SplashScreen.dart';
import 'package:counter/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:counter/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name = TextEditingController();

  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    shared();
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 520,
              width: 310,
            ),
            Container(
              width: 300,
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 1.5,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 45,
                    ),
                    minRadius: 30,
                    backgroundColor: Colors.grey[600],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                    ),
                    child: TextField(
                      controller: name,
                      enabled: true,
                      decoration: InputDecoration(
                        label: Text(
                          'Username/Email',
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 6, 62, 108),
                              fontWeight: FontWeight.w600),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 6, 62, 108),
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 6, 62, 108),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 6, 62, 108),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                    ),
                    child: TextField(
                      controller: password,
                      enabled: true,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 6, 62, 108),
                              fontWeight: FontWeight.w600),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 6, 62, 108),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 6, 62, 108),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      elevation: 20,
                      shadowColor: Colors.white,
                      side: BorderSide(
                          color: const Color.fromARGB(255, 6, 62, 108),
                          strokeAlign: 2,
                          width: 2),
                    ),
                    onPressed: () async {
                      //if successfully logged in(credentials are correct?)

                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Text('Log In'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Don\'t have an account? Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 125,
              bottom: 450,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.purple,
                minRadius: 30,
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 45,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

void shared() async {
  var sharedPref = await SharedPreferences.getInstance();
  sharedPref.setBool(SplashScreenState.KEYLOGIN, false);
}
