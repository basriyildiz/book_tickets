import 'package:book_tickets_ui/ui/screens/book_tickets.dart';
import 'package:book_tickets_ui/ui/screens/my_tickets.dart';
import 'package:book_tickets_ui/ui/screens/settings.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final whereFrom;
  final toWhere;
  String? showDate;
  String? whereFrom1;
  String? toWhere1;
  String? price;
  String? time;

  MyHomePage({
    Key? key,
    String? this.whereFrom,
    String? this.toWhere,
    this.whereFrom1,
    this.toWhere1,
    this.showDate,
    this.time,
    this.price,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedVehicle = 1;
  int todayOrTomorrow = 0;
  int selectedItem = 0;
  bool isSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.toWhere1 != null && isSelected == false) {
      setState(() {
        selectedItem = 1;
        isSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("check : " + widget.toWhere1.toString());
    List pages = [
      BookTickets(
        whereFrom: widget.whereFrom == null ? null : widget.whereFrom,
        toWhere: widget.toWhere == null ? null : widget.toWhere,
      ),
      isSelected
          ? MyTickets(
              whereFrom: widget.whereFrom1,
              toWhere: widget.toWhere1,
              showDate: widget.showDate,
              time: widget.time,
              price: widget.price,
            )
          : MyTickets(),
      SettingsPage(),
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
        selectedItemColor: Theme.of(context).primaryColor,
      ),
      appBar: appBar(),
      body: pages[selectedItem],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
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
      isSelected = false;
    });
  }

  String _titleFinder() {
    if (selectedItem == 0) {
      return "Tickets.com";
    } else if (selectedItem == 1) {
      return "My Tickets";
    } else {
      return "Settings";
    }
  }
}
