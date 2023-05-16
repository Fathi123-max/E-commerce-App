import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Flutter code sample for [SliverAppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            primarySwatch: Colors.green,
          ),
          home: child,
        );
      },
      child: const SliverAppBarExample(),
    );
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _floating = false;
  bool _pinned = true;
  bool _snap = false;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].

  var color = AppConst.appwhiteColor;
  var color2 = AppConst.appwhiteColor;

  var colors = AppConst.appwhiteColor;

  var colorl = AppConst.appwhiteColor;
  var colorxl = AppConst.appwhiteColor;
  var colorm = AppConst.appwhiteColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            heroTag: null,
            child: Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.shopping_cart),
                ),
              ],
            )),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              backgroundColor: Colors.amber,
              floating: _floating,
              expandedHeight: size.height * 1.2,
              flexibleSpace: Stack(children: [
                Positioned.fill(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: size.height * .7,
                    child: const FlutterLogo()),
                Positioned(
                    bottom: size.height * .77,
                    right: size.width * .1,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(Icons.favorite),
                    )),
                Positioned(
                    bottom: size.height * .77,
                    left: size.width * .1,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(Icons.arrow_back),
                    )),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: size.height * .01,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          ListTile(
                            title: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    "Product Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  SizedBox(width: size.width * .29),
                                  Container(
                                    width: 50,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: AppConst.appGreenColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: size.width * .06,
                                          ),
                                          const Text(
                                            "4.8",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                            subtitle: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  "Product Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(width: size.width * .21),
                                const Text(
                                  "(23 Reviews)",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Select Size :"),
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * .05,
                                        ),
                                        categoryChip("S", () {
                                          setState(() {
                                            colors = AppConst.appGreenColor;

                                            colorl = AppConst.appwhiteColor;
                                            colorxl = AppConst.appwhiteColor;
                                            colorm = AppConst.appwhiteColor;
                                          });
                                        }, colors, Colors.black),
                                        SizedBox(
                                          width: size.width * .05,
                                        ),
                                        categoryChip("M", () {
                                          setState(() {
                                            colors = AppConst.appwhiteColor;

                                            colorl = AppConst.appwhiteColor;
                                            colorxl = AppConst.appwhiteColor;
                                            colorm = AppConst.appGreenColor;
                                          });
                                        }, colorm, Colors.black),
                                        SizedBox(
                                          width: size.width * .05,
                                        ),
                                        categoryChip("L", () {
                                          setState(() {
                                            colors = AppConst.appwhiteColor;

                                            colorl = AppConst.appGreenColor;
                                            colorxl = AppConst.appwhiteColor;
                                            colorm = AppConst.appwhiteColor;
                                          });
                                        }, colorl, Colors.black),
                                        SizedBox(
                                          width: size.width * .05,
                                        ),
                                        categoryChip("XL", () {
                                          setState(() {
                                            colors = AppConst.appwhiteColor;

                                            colorl = AppConst.appwhiteColor;
                                            colorxl = AppConst.appGreenColor;
                                            colorm = AppConst.appwhiteColor;
                                          });
                                        }, colorxl, Colors.black),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        height: 1.5,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Product Price"),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Text(
                                          "\$",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "59.99",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Product Properties"),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Brand",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 5),
                                              Text("MyBrand"),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Condition",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 5),
                                              Text("New"),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Quantity",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 5),
                                              Text("1 Available"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ]))
                        ],
                      ),
                    ))
              ]),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors
              .white70, // Changes the background color of the BottomAppBar
          elevation: 10, // Adds shadow to the BottomAppBar
          shape:
              const CircularNotchedRectangle(), // Makes the BottomAppBar circular and notched
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$5.00 ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                ),
                const Spacer(),
                OutlinedButton(
                    onPressed: () {}, child: const Text("Add to Cart"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//appbar
Widget categoryChip(String text, var onTap, Color color, Color ColotText) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(text, style: TextStyle(fontSize: 16.sp, color: ColotText)),
    ),
  );
}
