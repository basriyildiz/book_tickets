import 'package:flutter/material.dart';
import 'package:book_tickets_ui/ui/helper/content_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTickets extends StatefulWidget {
  final whereFrom;
  final price;
  final showDate;
  final time;
  final toWhere;

  MyTickets(
      {Key? key,
      String? this.whereFrom,
      String? this.toWhere,
      String? this.showDate,
      String? this.time,
      String? this.price})
      : super(key: key);

  @override
  _MyTicketsState createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  List<String> ticketWhereFrom = [];
  List<String> ticketToWhere = [];
  List<String> ticketShowDate = [];
  List<String> ticketTime = [];
  List<String> ticketPrice = [];
  bool isDarkTheme = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 1)).then((value) {
      return setState(() {
        if (widget.whereFrom != null) {
          debugPrint("save work");
          _dataSave();
        }
      });
    });
    _getDarkTheme();
    _dataRead();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: ticketWhereFrom.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: isDarkTheme ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: isDarkTheme
                        ? Colors.grey.shade100.withOpacity(.001)
                        : Colors.grey.withOpacity(.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: tickets(context, index),
              ),
            ),
          );
        },
      ),
    );
  }

  Column tickets(BuildContext context, index) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ticketShowDate[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 12,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Where From",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: context.dynamicHeight(.016)),
                          ),
                          Text(ticketWhereFrom[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: context.dynamicHeight(.03))),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            ">>>>>",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "To Where",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: context.dynamicHeight(.016)),
                          ),
                          Text(ticketToWhere[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: context.dynamicHeight(.03))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
                flex: 3,
                child: Container(
                    width: context.dynamicWidth(.1),
                    height: context.dynamicHeight(.1),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkTheme
                              ? Colors.transparent
                              : Colors.grey.withOpacity(.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        ticketTime[index],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )))
          ],
        )
      ],
    );
  }

  _dataSave() async {
    ticketWhereFrom.add(widget.whereFrom);
    ticketShowDate.add(widget.showDate);
    ticketTime.add(widget.time);
    ticketPrice.add(widget.price);
    ticketToWhere.add(widget.toWhere);
    debugPrint(ticketTime.toString());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("whereFrom", ticketWhereFrom);
    await prefs.setStringList("toWhere", ticketToWhere);
    await prefs.setStringList("price", ticketPrice);
    await prefs.setStringList("date", ticketShowDate);
    await prefs.setStringList("time", ticketTime);
  }

  _dataRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList("whereFrom") != null) {
      debugPrint("Where from not null data read code is working");
      ticketWhereFrom = prefs.getStringList("whereFrom")!;
      ticketToWhere = prefs.getStringList("toWhere")!;
      ticketPrice = prefs.getStringList("price")!;
      ticketShowDate = prefs.getStringList("date")!;
      ticketTime = prefs.getStringList("time")!;
      debugPrint("Data read works");
      debugPrint(prefs.getStringList("time").toString());
    }
  }

  _dataClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void _getDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isDark") != null) {
      setState(() {
        isDarkTheme = prefs.getBool("isDark")!;
      });
    }
  }
}
