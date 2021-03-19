import 'package:flutter/material.dart';

class AmbassadorScreen extends StatefulWidget {
  AmbassadorScreen({Key key}) : super(key: key);
  @override
  _AmbassadorScreenState createState() => _AmbassadorScreenState();
}

class _AmbassadorScreenState extends State<AmbassadorScreen>
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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.redAccent,
      child: Text("Ambassador"),
    );
  }
}
