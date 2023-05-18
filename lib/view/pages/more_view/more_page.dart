import 'package:e_commerce_app/view/pages/privcey_view/privacy_page.dart';
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
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 30,
            verticalOffset: 300.0,
            child: Column(
              children: [
                Container(
                  height: 268.h,
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
                        onTap: () async {
                          await showdialog(context);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const PrivacyPage();
                            },
                          ));
                        },
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

Future<dynamic> showdialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: 150.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 120.h,
                child: const Center(
                    child: Text('Are You Sure You Want To Sign Out')),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 30.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 30.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
