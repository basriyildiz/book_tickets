import 'package:book_tickets_ui/helper/bus_tours.dart';
import 'package:book_tickets_ui/helper/city_list.dart';
import 'package:book_tickets_ui/ui/my_tickets.dart';
import 'package:flutter/material.dart';
import 'package:book_tickets_ui/helper/content_extension.dart';

import 'home_page.dart';

class SelectTicket extends StatefulWidget {
  var toWhere;
  var whereFrom;
  var date;

  SelectTicket({
    Key? key,
    required this.toWhere,
    required this.whereFrom,
    required this.date,
  }) : super(key: key);

  @override
  _SelectTicketState createState() => _SelectTicketState();
}

class _SelectTicketState extends State<SelectTicket> {
  List<String> time = [];
  List<String> price = [];

  @override
  void initState() {
    super.initState();
    tourFinder(widget.whereFrom, widget.toWhere);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Choose your Ticket",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          bar(context),
          Expanded(
            child: ListView.builder(
              itemCount: time.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: tickets(
                          context, widget.whereFrom, widget.toWhere, index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Align bar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: context.dynamicHeight(.05),
        width: context.dynamicWidth(.3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade800,
            ),
            onPressed: () {},
            icon: Icon(Icons.filter_alt),
            label: Text("Filter"),
          ),
        ),
      ),
    );
  }

  InkWell tickets(
      BuildContext context, String whereFrom, String toWhere, index) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Done, your tour is added to tickets")));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                whereFrom1: whereFrom,
                toWhere1: toWhere,
                showDate: widget.date,
                time: time[index],
                price: price[index],
              ),
            ));
      },
      splashColor: Colors.grey,
      child: Column(
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
                          Text(widget.date.toString() + "  "),
                          Text(
                            time[index].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ))),
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
                            Text(whereFrom,
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
                            Text(toWhere,
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
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          price[index].toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }

  tourFinder(String whereFrom, String toWhere) {
    var routeStart = cityList.indexOf(whereFrom);
    var routeEnd = cityList.indexOf(toWhere);

    if (routeStart == 0 && routeEnd == 1) {
      time = tour0_1Time;
      price = tour0_1Price;
    }
    if (routeStart == 0 && routeEnd == 2) {
      time = tour0_2Time;
      price = tour0_2Price;
    } else {
      time = tour0_1Time;
      price = tour0_1Price;
    }
  }
}
