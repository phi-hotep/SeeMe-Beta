import 'package:flutter/material.dart';

class UserStatisticsScreen extends StatefulWidget {
  @override
  _UserStatisticsScreenState createState() => _UserStatisticsScreenState();
}

class _UserStatisticsScreenState extends State<UserStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        centerTitle: true,
      ),
    );
  }
}
