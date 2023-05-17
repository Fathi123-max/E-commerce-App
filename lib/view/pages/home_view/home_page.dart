import 'dart:async';

import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/view/pages/auth_view/custom_login.dart';
import 'package:e_commerce_app/view/pages/cart_view/cart_page.dart';
import 'package:e_commerce_app/view/pages/home_view/home_page_body.dart';
import 'package:e_commerce_app/view/pages/more_view/more_page.dart';
import 'package:e_commerce_app/view/pages/profile_view/profile_page8.dart';
import 'package:e_commerce_app/view/pages/search_view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../catogry_view/catogrys_ product_page.dart';
import '../catogry_view/list_of_catogry_page.dart';

showSignInDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size size = MediaQuery.of(context).size;

      return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          width: size.width * .9.w,
          height: size.width * 1.39.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: const custom_login(),
        ),
      );
    },
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 2;
  bool checkLogin = false;
  ShapeBorder? bottomBarShape = RoundedRectangleBorder(
      side: BorderSide(color: AppConst.appGreenColor, width: 1.w),
      borderRadius: const BorderRadius.only(
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
    const CatogryNavigator(),
    ProfileNavigator(
      check: false,
    ),
    const HomeNavigator(),
    const CartNavigator(),
    MoreNavigator()
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      showSignInDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 150.w,
          leading: Row(
            children: [
              Image.asset("assets/images/onemart.png"),
              const Text("One Mart")
            ],
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: pages[selectedIndex],
        ),
        bottomNavigationBar: SnakeNavigationBar.color(
          // height: 8.h0,
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
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: 'Catogries'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'perofile'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Stack(children: [
                  const Icon(Icons.card_travel_rounded),
                  Positioned(
                      top: .5.h,
                      right: .5.h,
                      child: Container(
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: Center(
                          child: Text(
                            "1",
                            style:
                                TextStyle(fontSize: 5.sp, color: Colors.white),
                          ),
                        ),
                      ))
                ]),
                label: 'Cart'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: 'More'),
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
  const CatogryNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const ListOfCatogry();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

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
  const SearchNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const SearchPage();
        if (settings.name == 'CatogryPage') page = const CatogryPage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class CartNavigator extends StatelessWidget {
  const CartNavigator({super.key});

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
  ProfileNavigator({
    super.key,
    this.check,
  });
  bool? check;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const ProfilePage8();

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}

class MoreNavigator extends StatelessWidget {
  MoreNavigator({
    super.key,
    this.check,
  });
  bool? check;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const MorePage();

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
