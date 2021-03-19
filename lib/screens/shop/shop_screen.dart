import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen({Key key}) : super(key: key);
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with AutomaticKeepAliveClientMixin {
  /*Ici on a utilisé le with AutomaticKeepAliveClientMixin pour pouvoir maintenir l'état 
  de la page exactement comme l'utilisateur l'a laissé quand il a navigué sur une 
  autre page. Pour fonctionner il a besoin de "bool get wantKeepAlive => true;" 
  et dans la méthode build de "super.build(context);"  
  En réalité dans la mise à jour (13 mars 2021) effectuée dans main_page.dart on a utilisé le 
  widget IndexedStack, donc le 'AutomaticKeepAliveClientMixin' n'a
  plus d'importance */
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  bool val1 = false;

  void change1(bool s) {
    setState(() {
      val1 = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Switch(
          value: val1,
          onChanged: change1,
          activeColor: Colors.red,
        ),
      ),
    );
  }
}
