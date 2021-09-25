import 'package:book_tickets_ui/ui/book_tickets.dart';
import 'package:book_tickets_ui/ui/my_tickets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedVehicle = 1;
  int todayOrTomorrow = 0;
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      BookTickets(),
      MyTickets(),
      BookTickets(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedItem,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
      ),
      appBar: appBar(),
      body: pages[selectedItem],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.red,
      centerTitle: true,
      elevation: 0,
      title: Text(
        _titleFinder(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  void _onItemTapped(index) {
    setState(() {
      selectedItem = index;
    });
  }

  String _titleFinder() {
    if (selectedItem == 0) {
      return "Tickets.com";
    } else if (selectedItem == 1) {
      return "My Tickets";
    } else {
      return "error: app bar title";
    }
  }
}
