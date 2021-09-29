import 'package:book_tickets_ui/ui/helper/city_list.dart';
import 'package:flutter/material.dart';

List<String> tour0_1Time = [
  "09:30",
  "10:35",
  "11:00",
  "12:30",
  "14:45",
  "15.00",
  "16:30",
  "18:15",
  "20:30",
  "23:45",
];
List<String> tour0_2Time = [
  "09:45",
  "10:30",
  "11:20",
  "12:45",
  "14:45",
  "16:00",
  "18:15",
  "18:15",
  "20:30",
  "23:45",
];
List<String> tour0_1Price = [
  "190",
  "185",
  "205",
  "305",
  "160",
  "200",
  "210",
  "250",
  "185",
  "190",
];
List<String> tour0_2Price = [
  "200",
  "190",
  "205",
  "185",
  "190",
  "160",
  "250",
  "185",
  "305",
  "210",
];

tourFinder(String whereFrom, String toWhere, time, price) {
  var routeStart = cityList.indexOf(whereFrom);
  var routeEnd = cityList.indexOf(toWhere);

  if (routeStart == 0 && routeEnd == 1) {
    time = tour0_1Time;
    price = tour0_1Price;
  }
  if (routeStart == 0 && routeEnd == 2) {
    debugPrint("Adana - Istanbul");
  }
  if (routeStart == 1 && routeEnd == 0) {
    debugPrint("Kocaeli - Adana");
  }
}
