import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home_page.dart';
import 'ui/my_tickets.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.red,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/homePage": (context) => MyHomePage(),
        "/myTickets": (context) => MyTickets(),
      },
      home: MyHomePage(),
    );
  }
}