import 'package:flutter/material.dart';
import 'package:seeme_beta/screens/display_user_activity/user_activity_screen.dart';
import 'package:seeme_beta/screens/followed_shop/shop_followed.dart';
import 'package:seeme_beta/screens/help/help_screen.dart';
import 'package:seeme_beta/screens/invitation/friend_invitation.dart';
import 'package:seeme_beta/screens/settings/settings_screen.dart';
import 'package:seeme_beta/screens/statistics/user_statistics_screen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/seeme_origine.jpg"),
              ),
              Text(
                'SeeMe',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text('My activity',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          subtitle: Text(
            "Browse your activity",
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.local_activity),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserActivityScreen()));
          },
        ),
        ListTile(
          title: Text('My stats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          subtitle: Text(
            "Looks about your stats",
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.star),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserStatisticsScreen()));
          },
        ),
        ListTile(
          title: Text('Shop followed',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          subtitle: Text(
            "Shops you are following",
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.shop_two_rounded),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShopFollowed()));
          },
        ),
        ListTile(
          title: Text('Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          subtitle: Text(
            "Privacy, security, language, etc.",
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserSettingsScreen()));
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text('Invite a friend',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          subtitle: Text(
            "Invite your friends to join SeeMe",
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.person_add),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FriendInvitationScreen()));
          },
        ),
        ListTile(
          title: Text('Help',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              )),
          subtitle: Text(
            "Terms and privacy policy, contact us, etc.",
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.help),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpScreen()));
          },
        ),
      ],
    );
  }
}
