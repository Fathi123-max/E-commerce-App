import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/pages/splash_view/splash_screen_2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.white;
    final primarySwatch = MaterialColor(primaryColor.value, <int, Color>{
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor,
    });
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: primarySwatch,
              // Set the primary color to white
            ).copyWith(
              background: Colors.white, // Set the background color to white
              surface: Colors.white, // Set the surface color to white
            ),
          ),
          home: child,
        );
      },
      child: const SplashScreen2(),
    );
  }
}
