import 'package:flutter/material.dart';

class FriendInvitationScreen extends StatefulWidget {
  @override
  _FriendInvitationScreenState createState() => _FriendInvitationScreenState();
}

class _FriendInvitationScreenState extends State<FriendInvitationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend invitation"),
        centerTitle: true,
      ),
    );
  }
}
