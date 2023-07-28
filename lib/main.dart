// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:counter/SplashScreen.dart';
import 'package:counter/loginScreen.dart';
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

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences counter;
  static const String KEYCOUNT = 'counts';
  var count = 0;
  @override
  void initState() {
    super.initState();
    loadCount();
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "COUNTER....",
              style: TextStyle(
                  fontFamily: 'Riberthy',
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700]),
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () async {
                        var counter = await SharedPreferences.getInstance();

                        setState(() {
                          count++;
                          counter.setInt(KEYCOUNT, count);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  child: Text(
                    'RESET',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () async {
                    var counter = await SharedPreferences.getInstance();
                    setState(() {
                      count = 0;
                      counter.setInt(KEYCOUNT, count);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.red),
                ),
              ),
              SizedBox(
                height: 20,
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
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "COUNTER....",
              style: TextStyle(
                  fontFamily: 'Riberthy',
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700]),
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () async {
                        var counter = await SharedPreferences.getInstance();
                        if (count > 0) {
                          setState(() {
                            count--;
                            counter.setInt(KEYCOUNT, count);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () async {
                        var counter = await SharedPreferences.getInstance();
                        setState(() {
                          count++;
                          counter.setInt(KEYCOUNT, count);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  child: Text(
                    'RESET',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () async {
                    var counter = await SharedPreferences.getInstance();
                    setState(() {
                      count = 0;
                      counter.setInt(KEYCOUNT, count);
                      ;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.red),
                ),
              ),
              SizedBox(
                height: 20,
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
                  var counter = await SharedPreferences.getInstance();
                  counter.setInt(KEYCOUNT, 0);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      );
    }
  }

  void loadCount() async {
    counter = await SharedPreferences.getInstance();

    var getCount = counter.getInt(KEYCOUNT);
    count = getCount != null ? getCount : 0;
    setState(() {});
  }
}
