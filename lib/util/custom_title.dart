import 'package:flutter/material.dart';

import '../constatnt/const_color.dart';

class CustomTitle extends StatelessWidget {
  final String titleText;
  final double fontSize;
  final LinearGradient gradient;

  const CustomTitle({
    Key? key,
    required this.titleText,
    this.fontSize = 28.0,
    this.gradient = const LinearGradient(
      colors: [Colors.pink, Colors.purple],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          titleText,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: AppConst.appwhiteColor,
          ),
        ),
      ),
    );
  }
}
