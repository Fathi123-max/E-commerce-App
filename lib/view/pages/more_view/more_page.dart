import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  List<String> titles = [
    "Address",
    "Settings",
    "Terms and condition",
    "Privacy policy",
    "Return and Refund Policy",
    "About us",
    "Sign Out",
  ];

  List<IconData> iconList = [
    Icons.place,
    Icons.settings,
    Icons.book,
    Icons.privacy_tip,
    Icons.refresh_outlined,
    Icons.group,
    Icons.exit_to_app
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
          position: 0,
          delay: Duration(milliseconds: 100),
          child: SlideAnimation(
            duration: Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 30,
            verticalOffset: 300.0,
            child: Column(
              children: [
                Container(
                  height: 219.3.h,
                ),
                Container(
                  height: 345.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0.r),
                      topRight: Radius.circular(30.0.r),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(iconList[index]),
                        title: Text(titles[index]),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
