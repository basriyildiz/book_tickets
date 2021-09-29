import 'package:flutter/material.dart';
import 'package:book_tickets_ui/ui/helper/content_extension.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(),
          title: Text("Isaac ASIMOV"),
          subtitle: Text("isaac_asimov@foundation.com"),
        ),
        Container(
          color: Colors.grey.shade100,
          child: setProfilePhoto(context),
        ),
        infoContainer(context, accountColumn(context)),
        infoContainer(context, settingsColumn(context)),
      ],
    );
  }

  Container infoContainer(BuildContext context, Widget column) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(context.dynamicHeight(.02)),
        child: column,
      ),
    );
  }

  Column settingsColumn(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Settings",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicHeight(.024)),
            )),
        SizedBox(height: context.dynamicHeight(.02)),
        infoColumn(context, "Theme Color", "Tap to change theme color"),
        SizedBox(height: context.dynamicHeight(.02)),
        infoColumn(context, "Language", "Tap to change language"),
        SizedBox(height: context.dynamicHeight(.02)),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Theme",
                style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicHeight(.02)),
              ),
              Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      isDarkTheme = value;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Column accountColumn(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Account",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicHeight(.024)),
            )),
        SizedBox(height: context.dynamicHeight(.02)),
        infoColumn(
          context,
          "Isaac Asimov",
          "Tap to change name",
        ),
        SizedBox(height: context.dynamicHeight(.01)),
        infoColumn(
          context,
          "Password",
          "Tap to change name",
        ),
        SizedBox(height: context.dynamicHeight(.01)),
        infoColumn(
          context,
          "+90 (532) *** ** 89",
          "Tap to change phone number",
        ),
        SizedBox(height: context.dynamicHeight(.01)),
        infoColumn(
          context,
          "isaac_asimov@foundation.com",
          "Tap to change email adress",
        ),
      ],
    );
  }

  InkWell setProfilePhoto(BuildContext context) {
    return InkWell(
      onTap: () {
        _setProfilePhoto();
      },
      child: Padding(
        padding: EdgeInsets.all(context.dynamicHeight(.02)),
        child: Row(
          children: [
            Icon(
              Icons.add_a_photo_rounded,
              color: Colors.blue.shade800,
            ),
            SizedBox(width: context.dynamicWidth(.05)),
            Text(
              "Set Profile Photo",
              style: TextStyle(
                color: Colors.blue.shade800,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container infoColumn(BuildContext context, String title, String subTitle) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    fontSize: context.dynamicHeight(.02)),
              ),
            ),
            SizedBox(height: context.dynamicHeight(.01)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setProfilePhoto() {}


}
