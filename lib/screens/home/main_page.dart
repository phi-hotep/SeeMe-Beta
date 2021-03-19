import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_item.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeme_beta/components/drawerScreen.dart';
import 'package:seeme_beta/screens/advertising/advertising_screen.dart';
import 'package:seeme_beta/screens/ambassador/ambassador_screen.dart';
import 'package:seeme_beta/screens/home/home_screen.dart';
import 'package:seeme_beta/screens/shop/shop_screen.dart';
import 'package:seeme_beta/state_changes/business_mode.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // Animation Controller
  AnimationController _animationController;

  List<Widget> _screens = [
    HomeScreen(),
    ShopScreen(),
    AdvertisingScreen(),
    AmbassadorScreen()
  ];

  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _sb = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 125));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

// Pour le IconAnimation
  _toggleAnimation1() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  // Pour le GestureDetector
  _toggleAnimationWithGesture() {
    _animationController.reverse();
  }

  // Cette fonction permet de changer de page en fontion de l'item tapé par l'utilisateur sur le bottomNavigationBar
  void _onTappedBusinessMode(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// De même que celle du haut à la différence qu'ici on force l'utilisateur à rester sur la page HomeScreen
  void _onTappedSimpleMode(int index) {
    setState(() {
      if (index != 0) {
        index = 0;
        _selectedIndex = index;
        _snackbar(); // Ici on informe l'utilisateur
      } else {
        _selectedIndex = index;
      }
    });
  }

  void _snackbar() {
    // On implémente le snackbar avec la fonction showSnackBar comme suit:
    _sb.currentState.showSnackBar(SnackBar(
      content: Text("Only for SeeMe Business mode!"),
      duration: const Duration(seconds: 1), // la durée du snackbar
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return Consumer<BusinessMode>(
      // Consumer nous permet d'acceder à la classe BusinessMode, donc aux données de cette classe
      builder: (context, _value, child) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double slide = rightSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            // Ici un stack des deux widgets
            children: [
              Scaffold(
                // 1er widget est la page de menu
                backgroundColor: Colors.white,
                body: DrawerScreen(),
              ),
              Transform(
                // Ici la 2e page qui subira une transformation vers la droite
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.center,

                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _toggleAnimationWithGesture();
                    });
                  },
                  child: Scaffold(
                      key:
                          _sb, //permettant d'utiliser le snackbar dans le scaffold
                      appBar: AppBar(
                        leading: IconButton(
                          onPressed: () => _toggleAnimation1(),
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: _animationController,
                          ),
                        ),
                      ),
                      bottomNavigationBar: FFNavigationBar(
                        selectedIndex: _selectedIndex,
                        items: [
                          FFNavigationBarItem(
                            iconData: Icons.home,
                            label: "Home",
                          ),
                          FFNavigationBarItem(
                            iconData: Icons.store_mall_directory_sharp,
                            label: "Shop",
                          ),
                          FFNavigationBarItem(
                            iconData: Icons.public,
                            label: "Adverts",
                          ),
                          FFNavigationBarItem(
                            iconData: Icons.group,
                            label: "Ambassador",
                          )
                        ],
                        theme: FFNavigationBarTheme(
                          barBackgroundColor: Colors.white,
                          selectedItemBorderColor: Colors.transparent,
                          selectedItemBackgroundColor: Colors.blue,
                          selectedItemIconColor: Colors.white,
                          selectedItemLabelColor: Colors.black,
                          showSelectedItemShadow: true,
                          barHeight: 60,
                        ),
                        onSelectTab: _value.isSwitchToBusinessMode
                            ? _onTappedBusinessMode
                            : _onTappedSimpleMode,
                      ),
                      body: IndexedStack(
                        index: _selectedIndex,
                        children: _screens,
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
