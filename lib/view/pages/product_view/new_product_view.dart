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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.shopping_cart),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
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
                    child: FlutterLogo()),
                Positioned(
                    bottom: size.height * .76,
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
                    bottom: size.height * .76,
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
                    bottom: 0,
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
                            title: Text(
                              "Product Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            subtitle: const Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Icon(Icons.star_border, size: 18),
                                Icon(Icons.star_border, size: 18),
                                SizedBox(width: 5),
                                Text(
                                  "4.0 (23 Reviews)",
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
                                    const Text("Product Description"),
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
                Spacer(),
                OutlinedButton(onPressed: () {}, child: Text("Add to Cart"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//appbar
