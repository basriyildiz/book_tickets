import 'package:book_tickets_ui/ui/helper/city_list.dart';
import 'package:book_tickets_ui/ui/screens/book_tickets.dart';
import 'package:book_tickets_ui/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:book_tickets_ui/ui/helper/content_extension.dart';

class ChooseCity extends StatelessWidget {
  late final String text;
  late final int whichFrom;

  ChooseCity({Key? key, required this.text, required this.whichFrom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(text),
      ),
      body: Column(
        children: [
          Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                child: ListView.builder(
                  itemCount: cityList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          whichForm(index),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          children: [
                            Container(
                              height: context.dynamicHeight(.08),
                              width: context.dynamicWidth(.08),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: context.dynamicWidth(.05)),
                            Text(cityList[index].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  MaterialPageRoute<dynamic> whichForm(index) {
    if (whichFrom == 1) {
      return MaterialPageRoute(
        builder: (context) => MyHomePage(
          whereFrom: cityList[index],
        ),
      );
    } else if (whichFrom == 2) {
      return MaterialPageRoute(
        builder: (context) => MyHomePage(
          toWhere: cityList[index],
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => MyHomePage(),
      );
    }
  }
}
