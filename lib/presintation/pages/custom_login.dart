import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/presintation/pages/home_page.dart';
import 'package:e_commerce_app/presintation/pages/siginup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class custom_login extends StatefulWidget {
  const custom_login({Key? key}) : super(key: key);

  @override
  _custom_loginState createState() => _custom_loginState();
}

class _custom_loginState extends State<custom_login>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  bool seex = false;

  String seey = "false";

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SizedBox(
        height: size.height,
        child: Container(
          alignment: Alignment.center,
          child: Opacity(
            opacity: _opacity.value,
            child: Transform.scale(
              scale: _transform.value,
              child: Container(
                width: size.width * .9,
                height: size.width * 1.1,
                decoration: BoxDecoration(
                  color: AppConst.appwhiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 90,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                    const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: component1(Icons.email_outlined,
                          'Enter Email Or Phone Number', false, true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                          visible: seex,
                          child: component1(
                              Icons.lock_outline, seey, true, false)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: component2(
                            'LOGIN',
                            2.6,
                            () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                              HapticFeedback.lightImpact();
                              Fluttertoast.showToast(
                                  msg: 'Login button pressed');
                            },
                          ),
                        ),
                        SizedBox(width: size.width / 25),
                        Container(
                          width: size.width / 3.5,
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: 'Forgotten password!',
                              style: const TextStyle(color: Colors.blueAccent),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Fluttertoast.showToast(
                                    msg: 'Forgotten password! button pressed',
                                  );
                                },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(),
                    RichText(
                      text: TextSpan(
                        text: 'Create a new Account',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SingUpPage()));

                            Fluttertoast.showToast(
                              msg: 'Create a new Account button pressed',
                            );
                          },
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType:
            isEmail ? TextInputType.emailAddress : TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
        onSubmitted: (value) {
          if (isEmail) {
            if (isValidEmail(value)) {
              setState(() {
                seex = true;
                seey = "Password";
              });
            } else {
              // Do something with invalid email
            }
          } else {}
          if (isValidPhoneNumber(value)) {
            setState(() {
              seey = "Enter OTP";
              seex = true;
            });
          } else {
            // Do something with invalid phone number
          }
        },
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^([0-9]{10,})$').hasMatch(phoneNumber);
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style: const TextStyle(
              color: AppConst.appwhiteColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
