import 'package:flutter/material.dart';

class ShopFollowed extends StatefulWidget {
  @override
  _ShopFollowedState createState() => _ShopFollowedState();
}

class _ShopFollowedState extends State<ShopFollowed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop followed"),
        centerTitle: true,
      ),
    );
  }
}
