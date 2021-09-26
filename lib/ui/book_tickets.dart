import 'package:book_tickets_ui/helper/bus_tours.dart';
import 'package:book_tickets_ui/helper/text.dart';
import 'package:book_tickets_ui/ui/choose_city.dart';
import 'package:book_tickets_ui/ui/select_ticket..dart';
import 'package:flutter/material.dart';
import 'package:book_tickets_ui/helper/content_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookTickets extends StatefulWidget {
  final whereFrom;
  final toWhere;

  const BookTickets({
    Key? key,
    String? this.whereFrom,
    String? this.toWhere,
  }) : super(key: key);

  @override
  _BookTicketsState createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {
  int selectedVehicle = 1;
  int todayOrTomorrow = 0;
  String? whereFromComed;
  String? toWhereComed;

  bool isDataClear = false;
  DateTime? selectedDate;
  String? showDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        showDate = selectedDate!.day.toString() +
            "/" +
            selectedDate!.month.toString() +
            "/" +
            selectedDate!.year.toString();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1)).then((value) => setState(() {
          _dataRead();
          _dataReadToWhere();
          _dataReadDate();
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.whereFrom != null && isDataClear == false) {
      whereFromComed = widget.whereFrom;
      _dataSave(whereFromComed!, 1);

      debugPrint("çalıştı");
    }
    if (widget.toWhere != null && isDataClear == false) {
      toWhereComed = widget.toWhere;
      _dataSave(toWhereComed!, 2);

      debugPrint("çalıştı 2");
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: context.dynamicHeight(.26),
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                child: annoucment(context),
              ),
              Positioned(
                right: context.dynamicWidth(.1),
                width: context.dynamicWidth(.8),
                bottom: context.dynamicHeight(.03),
                child: chooseVehicle(context),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: context.dynamicHeight(.35),
          child: formChoose(),
        ),
        SizedBox(
          height: context.dynamicHeight(.02),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(.05)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 12,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent.shade400,
                      ),
                      onPressed: () {
                        if (whereFromComed != null &&
                            toWhereComed != null &&
                            showDate != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectTicket(
                                  toWhere: toWhereComed,
                                  whereFrom: whereFromComed,
                                  date: showDate,
                                ),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please complete form")));
                        }
                      },
                      child: Text("Find your Bus Ticket")),
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          _dataClear();
                          toWhereComed = null;
                          whereFromComed = null;
                          isDataClear = true;
                          showDate = null;
                        });
                      },
                      child: Icon(Icons.delete)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  formChoose() {
    if (selectedVehicle == 1) {
      return busForm();
    } else if (selectedVehicle == 2) {
      return flightForm();
    } else {
      return feryyForm();
    }
  }

  Column busForm() => Column(
        children: [
          Expanded(
            flex: 12,
            child: Container(
              width: context.dynamicWidth(.9),
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
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Colors.grey.shade400,
                                size: context.dynamicHeight(.03),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  iconsDot(),
                                  iconsDot(),
                                  iconsDot(),
                                  iconsDot(),
                                  iconsDot(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Colors.grey.shade400,
                                size: context.dynamicHeight(.03),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(child: SizedBox()),
                  Expanded(
                      flex: 20,
                      child: Column(
                        children: [
                          Expanded(
                            child: formButton("WHERE FROM",
                                "Select city or county", whereFromComed, 1),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey.shade200,
                          ),
                          Expanded(
                            child: formButton("TO WHERE",
                                "Select city or county", toWhereComed, 2),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Expanded(
            flex: 6,
            child: Container(
              width: context.dynamicWidth(.9),
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
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.grey.shade400,
                        size: context.dynamicHeight(.03),
                      )),
                  Expanded(child: SizedBox()),
                  Expanded(
                    flex: 20,
                    child: Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _selectDate(context)
                                  .then((value) => _dataDateSave());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Date",
                                    style: showDate == null
                                        ? TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )
                                        : TextStyle(color: Colors.grey),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        showDate == null
                                            ? "Choose Date"
                                            : showDate.toString(),
                                        style: showDate == null
                                            ? TextStyle(color: Colors.grey)
                                            : TextStyle(
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: context
                                                    .dynamicHeight(.03)))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  InkWell formButton(String header, String body, afterComeData, int formNo) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChooseCity(
                text: header,
                whichFrom: formNo,
              ),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: afterComeData == null
                  ? TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  : TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text(afterComeData == null ? body : afterComeData,
                style: afterComeData == null
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: context.dynamicHeight(.03))),
          ),
        ],
      ),
    );
  }

  Icon iconsDot() {
    return Icon(Icons.circle,
        size: context.dynamicHeight(.007), color: Colors.grey.shade400);
  }

  Column flightForm() => Column(
        children: [Text("412423")],
      );
  Column feryyForm() => Column(
        children: [Text("214123")],
      );

  Container chooseVehicle(BuildContext context) {
    return Container(
      height: context.dynamicHeight(.06),
      // width: MediaQuery.of(context).size.width - 50,
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
      child: Row(
        children: [
          chooseVehicleButtons(
              context, 1, "Bus", Icons.directions_bus_filled_rounded),
          chooseVehicleButtons(context, 2, "Flight", Icons.flight_rounded),
          chooseVehicleButtons(
              context, 3, "Ferry", Icons.directions_boat_rounded),
        ],
      ),
    );
  }

  Expanded chooseVehicleButtons(
      BuildContext context, int selected, String text, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedVehicle = selected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: selectedVehicle == selected ? Colors.red : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.all(3),
          width: context.dynamicWidth(.8) / 3 - 6,
          height: context.dynamicHeight(.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: context.dynamicHeight(.025),
                color: selectedVehicle == selected
                    ? Colors.white
                    : Colors.grey.shade800,
              ),
              Text(
                text,
                style: TextStyle(
                  color: selectedVehicle == selected
                      ? Colors.white
                      : Colors.grey.shade800,
                  fontSize: context.dynamicHeight(0.02),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container annoucment(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.dynamicHeight(.2),
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicHeight(.04)),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      annoucmentCovid,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.dynamicHeight(.02),
                        color: Colors.white.withOpacity(.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.announcement_rounded,
                      color: Colors.white,
                      size: context.dynamicHeight(.05),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Please click for detail page",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.white),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  _dataSave(String data, int whichForm) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (whichForm == 1) {
      await prefs.setString("WhereFrom", data);
    } else if (whichForm == 2) {
      await prefs.setString("ToWhere", data);
    } else {}
  }

  _dataRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    whereFromComed = prefs.getString("WhereFrom");
    debugPrint("data read");
  }

  _dataReadToWhere() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    toWhereComed = prefs.getString("ToWhere");
    debugPrint("data read to where");
  }

  _dataReadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showDate = prefs.getString("Date");
    debugPrint("data read datee");
  }

  _dataClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  _dataDateSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Date", showDate!);
  }
}
