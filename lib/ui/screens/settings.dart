import 'package:book_tickets_ui/main.dart';
import 'package:book_tickets_ui/ui/helper/theme_color_list.dart';
import 'package:book_tickets_ui/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:book_tickets_ui/ui/helper/content_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;
  int selectedItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDarkTheme();
  }

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
          color: isDarkTheme ? null : Colors.grey.shade100,
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
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicHeight(.024)),
            )),
        SizedBox(height: context.dynamicHeight(.02)),
        infoColumn(context, "Theme Color", "Tap to change theme color",
            _setThemeColor),
        SizedBox(height: context.dynamicHeight(.02)),
        infoColumn(
            context, "Language", "Tap to change language", _setThemeColor),
        SizedBox(height: context.dynamicHeight(.02)),
        darkTheme(context),
      ],
    );
  }

  Container darkTheme(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDarkTheme ? Colors.white12 : Colors.white,
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
                color: isDarkTheme
                    ? Colors.white.withOpacity(.6)
                    : Colors.black.withOpacity(.8),
                fontWeight: FontWeight.bold,
                fontSize: context.dynamicHeight(.02)),
          ),
          Switch(
              inactiveTrackColor: Colors.black,
              activeTrackColor: Theme.of(context).primaryColor,
              value: isDarkTheme,
              onChanged: (value) {
                setState(() {
                  isDarkTheme = value;
                  _setDarkTheme();
                });
              }),
        ],
      ),
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
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicHeight(.024)),
            )),
        SizedBox(height: context.dynamicHeight(.02)),
        infoColumn(
            context, "Isaac Asimov", "Tap to change name", _setThemeColor),
        SizedBox(height: context.dynamicHeight(.01)),
        infoColumn(
          context,
          "Password",
          "Tap to change name",
          _setThemeColor,
        ),
        SizedBox(height: context.dynamicHeight(.01)),
        infoColumn(
          context,
          "+90 (532) *** ** 89",
          "Tap to change phone number",
          _setThemeColor,
        ),
        SizedBox(height: context.dynamicHeight(.01)),
        infoColumn(
          context,
          "isaac_asimov@foundation.com",
          "Tap to change email adress",
          _setThemeColor,
        ),
      ],
    );
  }

  InkWell setProfilePhoto(BuildContext context) {
    return InkWell(
      onTap: () {
        _setThemeColor();
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

  InkWell infoColumn(
      BuildContext context, String title, String subTitle, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.white12 : Colors.white,
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
                      color: isDarkTheme
                          ? Colors.white.withOpacity(.6)
                          : Colors.black.withOpacity(.8),
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
      ),
    );
  }

  void _setProfilePhoto() {}

  void _setDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDarkTheme);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
  }

  void _getDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isDark") != null) {
      setState(() {
        isDarkTheme = prefs.getBool("isDark")!;
      });
    }
  }

  void _setThemeColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Choose theme color")),
          contentPadding: EdgeInsets.all(0),
          scrollable: true,
          content: Column(
            children: [
              row(context, 0),
              row(context, 2),
              row(context, 4),
              row(context, 6),
            ],
          ),
        );
      },
    );
  }

  Row row(BuildContext context, int c1) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                debugPrint("Selected");
                setState(() {
                  selectedItem = c1;
                  _dataSave();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Done, your color applied")));
                isDarkTheme = false;
                _setDarkTheme();

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors[c1],
                ),
                child: Text(""),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                debugPrint("Seçilid");
                setState(() {
                  selectedItem = c1 + 1;
                  _dataSave();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Done, your color applied")));

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors[c1 + 1],
                ),
                child: Text(""),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _dataSave() async {
    int colorNo = selectedItem;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("ItemNo", colorNo);
  }
}
