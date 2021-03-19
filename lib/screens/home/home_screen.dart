import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:seeme_beta/state_changes/business_mode.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
  bool _switchValue = false;

  Future _businessModeConfirmation() async {
    return showDialog(
        context: context,
        barrierDismissible:
            false, // l'utilisateur doit impérativement taper le bouton, si c'est 'true'
        // l'utilisateur n'importe où sur l'ecran et annuler la boite de dialogue.
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("SeeMe Business mode"),
            content: Text('This passage will cost you 500 points'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Continue")),
            ],
            elevation: 10.0,
            backgroundColor: Colors.white,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<BusinessMode>(
      // Consumer nous permet d'acceder à la classe BusinessMode, donc aux données de cette classe
      builder: (context, x, child) => Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Text("Home"),
              SizedBox(height: 80),
              LiteRollingSwitch(
                  // Ici le bouton switch pour passer en mode business
                  value: _switchValue,
                  textOn: "Business",
                  textOff: "Simple",
                  colorOn: Colors.green,
                  colorOff: Colors.blue,
                  iconOn: Icons.business,
                  iconOff: Icons.person,
                  textSize: 16,
                  animationDuration: const Duration(milliseconds: 150),
                  onChanged: (bool state) {
                    x.isSwitchToBusinessMode =
                        state; // Ici on envoie la nouvelle
                    //valeur à la classe de données BusinessMode
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
