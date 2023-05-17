import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/view/pages/auth_view/otp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool seex = false;

  String seey = "false";

  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: SizedBox(
        height: size.height,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            width: size.width,
            height: size.height,
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
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    const SizedBox(),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: component1(
                          Icons.person, 'Your full name', false, true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: component1(Icons.email_outlined,
                          'Enter your email', false, true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: component1(
                          Icons.phone_android, 'Enter your phone', false, true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: component1(
                          Icons.lock_outline, "Enter password ", true, true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: component1(Icons.lock_outline,
                          "Confirm your password", true, true),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: component2(
                            'Sign Up',
                            2.6,
                            () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Otp(),
                              ));
                              HapticFeedback.lightImpact();
                              Fluttertoast.showToast(
                                  msg: 'Login button pressed');
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Already have an account?',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 13.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Fluttertoast.showToast(
                                      msg: 'Forgotten password! button pressed',
                                    );
                                  },
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Login Now',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 13.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SingUpPage()));

                                    Fluttertoast.showToast(
                                      msg:
                                          'Create a new Account button pressed',
                                    );
                                  },
                              ),
                            ),
                          ],
                        )
                      ],
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
        width: size.width,
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
