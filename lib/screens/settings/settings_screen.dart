import 'package:flutter/material.dart';

class UserSettingsScreen extends StatefulWidget {
  UserSettingsScreen({Key key}) : super(key: key);
  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
    );
  }
}
