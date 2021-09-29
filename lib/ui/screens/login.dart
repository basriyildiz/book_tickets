import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.red,
      centerTitle: true,
      elevation: 0,
      title: Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
  }
}
