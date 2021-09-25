import 'package:book_tickets_ui/helper/text.dart';
import 'package:book_tickets_ui/ui/chooseCity.dart';
import 'package:flutter/material.dart';
import 'package:book_tickets_ui/helper/content_extension.dart';

class BookTickets extends StatefulWidget {
  const BookTickets({Key? key}) : super(key: key);

  @override
  _BookTicketsState createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {
  int selectedVehicle = 1;
  int todayOrTomorrow = 0;
  @override
  Widget build(BuildContext context) {
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
        Container(
          width: context.dynamicWidth(.7),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent.shade400,
              ),
              onPressed: () {},
              child: Text("Find your Bus Ticket")),
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
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChooseCity(text: "Where From"),
                                    ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "WHERE FROM",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Select city or county",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey.shade200,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "TO WHERE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Select city or county",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: Icon(
                        Icons.change_circle_outlined,
                        size: context.dynamicHeight(0.04),
                        color: Colors.grey.shade700,
                      ))
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
                    flex: 25,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "WHERE FROM",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Select city or county",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
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

  Icon iconsDot() {
    return Icon(Icons.circle,
        size: context.dynamicHeight(.007), color: Colors.grey.shade400);
  }

  Container todayOrTommorrowButton(String text, int index) {
    int sayi = 0;
    if (index == 1) {
      sayi = 2;
    } else if (index == 2) {
      sayi = 1;
    }
    return Container(
      width: context.dynamicWidth(.18),
      height: context.dynamicHeight(.04),
      decoration: BoxDecoration(
        color: todayOrTomorrow == 0 || todayOrTomorrow == sayi
            ? Colors.transparent
            : Colors.red,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: todayOrTomorrow == 0 || todayOrTomorrow == sayi
                ? Colors.black
                : Colors.red,
            width: 1.5),
      ),
      child: Center(child: Text(text)),
    );
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
}
