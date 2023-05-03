import 'dart:async';

import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/presintation/pages/cart_page.dart';
import 'package:e_commerce_app/presintation/pages/search_page.dart';
import 'package:e_commerce_app/presintation/widgets/home_screen_widgets/home_page_body.dart';
import 'package:e_commerce_app/test2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../../list_of_catogry_page.dart';
import 'catogrys_ product_page.dart';
import 'custom_login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 2;

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ));
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
  EdgeInsets padding = EdgeInsets.zero;

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.rectangle;

  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;

  Color selectedColor = AppConst.appGreenColor;
  Color unselectedColor = AppConst.appMainColor200;

  Color? containerColor;
  List<Widget> pages = [
    SearchNavigator(),
    CatogryNavigator(),
    HomeNavigator(),
    CartNavigator(),
    ProfileNavigator(),
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      showSignInDialog(context);
    });
  }

  showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;

        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Container(
            width: size.width * .9,
            height: size.width * 1.1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: const custom_login(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: pages[selectedIndex],
        ),
        bottomNavigationBar: SnakeNavigationBar.color(
          // height: 80,
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,
          padding: padding,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: selectedColor,
          selectedItemColor:
              snakeShape == SnakeShape.circle ? selectedColor : null,
          unselectedItemColor: unselectedColor,
          shadowColor: Colors.grey,

          ///configuration for SnakeNavigationBar.gradient
          // snakeViewGradient: selectedGradient,
          // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
          // unselectedItemGradient: unselectedGradient,

          showUnselectedLabels: showUnselectedLabels,
          showSelectedLabels: showSelectedLabels,

          currentIndex: _selectedItemPosition,
          onTap: (index) {
            setState(() {
              _selectedItemPosition = index;
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: 'Catogries'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel_rounded), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'perofile')
          ],
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

/* BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) => _onItemTapped(value),
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ), */

class CatogryNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = ListOfCatogry();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const HomePageBody();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class SearchNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = SearchPage();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class CartNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const CartPage();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class ProfileNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = ProfilePage8();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
