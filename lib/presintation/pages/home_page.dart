import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/list_of_catogry_page.dart';
import 'package:e_commerce_app/presintation/pages/cart_page.dart';
import 'package:e_commerce_app/presintation/pages/search_page.dart';
import 'package:e_commerce_app/presintation/widgets/home_screen_widgets/home_page_body.dart';
import 'package:e_commerce_app/test2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

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

  Color selectedColor = AppColor.appGreenColor;
  Color unselectedColor = AppColor.appMainColor200;

  Color? containerColor;

  List<Widget> pages = [
    SearchPage(),
    ListOfCatogry(),
    HomePageBody(),
    CartPage(),
    ProfilePage8()
  ];
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
