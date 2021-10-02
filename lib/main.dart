import 'package:book_tickets_ui/ui/helper/theme_color_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/screens/home_page.dart';
import 'ui/screens/my_tickets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int itemNo = 0;
  var _isDark = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _dataRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _light = ThemeData.light().copyWith(
      primaryColor: colors[itemNo],
    );
    ThemeData _dark = ThemeData.dark().copyWith(
      primaryColor: Colors.blueGrey,
    );
    return MaterialApp(
      darkTheme: _dark,
      theme: _light,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/homePage": (context) => MyHomePage(),
        "/myTickets": (context) => MyTickets(),
      },
      home: MyHomePage(),
    );
  }

  void _dataRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("ItemNo") != null) {
      setState(() {
        int? colorNo = prefs.getInt("ItemNo");
        itemNo = colorNo!;
      });
    }
    if (prefs.getBool("isDark") != null) {
      setState(() {
        _isDark = prefs.getBool("isDark")!;
      });
    }
  }
}
