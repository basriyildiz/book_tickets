import 'package:book_tickets_ui/helper/city_list.dart';
import 'package:flutter/material.dart';
import 'package:book_tickets_ui/helper/content_extension.dart';

class ChooseCity extends StatelessWidget {
  late final String text;
  ChooseCity({Key? key, required this.text}) : super(key: key);

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
                    return Container(
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
                            )),
                          ),
                          SizedBox(width: context.dynamicWidth(.05)),
                          Text(cityList[index] + (index + 1).toString(),
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
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
}
