// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, constant_identifier_names, use_build_context_synchronously, file_names, empty_statements, prefer_if_null_operators

import 'package:counter/providers/CountProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:counter/screen/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences counter;
  static const String KEYCOUNT = 'counts';

  @override
  void initState() {
    super.initState();
    loadCount(context);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final count = Provider.of<CountProvider>(context, listen: true);
    if (count.count == 0) {
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
              Consumer<CountProvider>(builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700]),
                );
              }),
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
                        count.increment();
                        counter.setInt(KEYCOUNT, count.count);
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
                    count.reset();
                    counter.setInt(KEYCOUNT, count.count);
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
              Consumer<CountProvider>(builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700]),
                );
              }),
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
                        if (count.count > 0) {
                          count.decrement();
                          counter.setInt(KEYCOUNT, count.count);
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
                        count.increment();
                        counter.setInt(KEYCOUNT, count.count);
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
                    count.reset();
                    counter.setInt(KEYCOUNT, count.count);
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

  void loadCount(BuildContext context) async {
    counter = await SharedPreferences.getInstance();
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    var getCount = counter.getInt(KEYCOUNT);

    if (getCount != null) {
      countProvider.setCount(getCount);
    } else {
      countProvider.setCount(0);
    }
  }
}
