import 'package:flutter/material.dart';
import 'package:seeme_beta/components/custom_theme.dart';
import 'package:seeme_beta/screens/advertising/advertising_screen.dart';
import 'package:seeme_beta/screens/ambassador/ambassador_screen.dart';
import 'package:seeme_beta/screens/home/home_screen.dart';
import 'package:seeme_beta/screens/home/main_page.dart';
import 'package:provider/provider.dart';
import 'package:seeme_beta/screens/shop/shop_screen.dart';
import 'package:seeme_beta/state_changes/business_mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Ce widget est la racine de l'application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Ici on fait la liste de toutes les classes de données qui implémenteront la classe ChangeNotifier.
      // On doit les mettre à la tête de notre hiérarchie de l'application
      providers: [
        ChangeNotifierProvider(create: (_) => BusinessMode()),
      ],
      child: Consumer<BusinessMode>(
        builder: (context, _value, child) => MaterialApp(
          title: 'SeeMe',
          theme:
              _value.isSwitchToBusinessMode // Ici le theme change en fonction
                  ? customThemeBusinessUser // du mode de l'application activée
                  : customThemeSingleUser, // par l'utilisateur
          debugShowCheckedModeBanner: false,
          home: MainPage(), // Ici c'est la page par défaut de l'application
          routes: {
            // Ici on fait la liste de toutes les pages de l'application
            '/HomeScreen': (context) => HomeScreen(),
            '/ShopScreen': (context) => ShopScreen(),
            '/AdvertisingScreen': (context) => AdvertisingScreen(),
            '/AmbassadorScreen': (context) => AmbassadorScreen()
          },
        ),
      ),
    );
  }
}
