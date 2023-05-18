import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/view/pages/product_view/product_card_view.dart';
import 'package:e_commerce_app/view/pages/product_view/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_bottom_sheet.dart';

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
      child: const product_new(),
    );
  }
}

class product_new extends StatefulWidget {
  const product_new({super.key});

  @override
  State<product_new> createState() => _product_newState();
}

class _product_newState extends State<product_new> {
// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].

  var color = AppConst.appwhiteColor;

  var color2 = AppConst.appwhiteColor;
  var colorl = AppConst.appwhiteColor;
  var colorm = AppConst.appwhiteColor;
  var colors = AppConst.appwhiteColor;
  var colorxl = AppConst.appwhiteColor;
  int _selectedIndex = 0;
  bool _isContainerVisible = false;
  bool _floating = false;
  bool _pinned = true;
  bool _snap = false;

  List photos = [
    'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/12/20/03/46/city-3029160_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

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
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                    size: 25.h,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 15.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 8.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: _pinned,
              snap: _snap,
              backgroundColor: Colors.white,
              floating: _floating,
              expandedHeight: size.height * 2.7,
              flexibleSpace: Stack(children: [
                Positioned.fill(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: size.height * 2.15,
                  child: CarouselSlider(
                    items: photos.map((imageUrl) {
                      return Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: size.height * .6,
                      pageSnapping: true,
                      autoPlay: true,
                      viewportFraction: 1,
                      pauseAutoPlayInFiniteScroll: true,
                      pauseAutoPlayOnManualNavigate: true,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        // keep track of current index
                        setState(() {
                          _current = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Positioned(
                  bottom: _isContainerVisible
                      ? size.height * 2.32
                      : size.height * 2.27,
                  right: size.width * .40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: photos.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                    bottom: _isContainerVisible
                        ? size.height * 2.32
                        : size.height * 2.27,
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
                    bottom: _isContainerVisible
                        ? size.height * 2.32
                        : size.height * 2.27,
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
                    bottom: size.height * .05,
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
                                            BorderRadius.circular(20.r)),
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
                                          Text(
                                            "4.8",
                                            style: TextStyle(
                                                fontSize: 10.sp,
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
                          SizedBox(height: 15.h),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Size :",
                                      style:
                                          TextStyle(color: Colors.grey[500]!),
                                    ),
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
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Text(
                                      "Description :",
                                      style:
                                          TextStyle(color: Colors.grey[500]!),
                                    ),
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Text(
                                      "Lorem ipsum dolor sit amet. Suspendisse vel est quam. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam. Duis pretium metus non mi bibendum eleifend. Suspendisse vel est quam.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        height: 1.5,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Product Price :",
                                      style:
                                          TextStyle(color: Colors.grey[500]!),
                                    ),
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
                                    Text(
                                      'Color :',
                                      style: TextStyle(
                                        color: Colors.grey[500]!,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        categoryChip("Red", () {
                                          setState(() {
                                            _selectedIndex = 0;
                                            _isContainerVisible = true;
                                            color2 = AppConst.appGreenColor;
                                            color = AppConst.appwhiteColor;
                                          });
                                        }, color2, Colors.black),
                                        categoryChip("white", () {
                                          setState(() {
                                            _selectedIndex = 1;
                                            _isContainerVisible = true;
                                            color = AppConst.appGreenColor;
                                            color2 = AppConst.appwhiteColor;
                                          });
                                        }, color, Colors.black),
                                        const Spacer(),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: _isContainerVisible,
                                                child: Container(
                                                  height: 80.h,
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30.r)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              photos[
                                                                  _selectedIndex]),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Categories:",
                                        style:
                                            TextStyle(color: Colors.grey[500]!),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            categoryChip(
                                                'Smart Watch ',
                                                () {},
                                                AppConst.appGreenColor,
                                                Colors.white),
                                            SizedBox(width: 8.w),
                                            categoryChip(
                                                'Apple Watch',
                                                () {},
                                                AppConst.appGreenColor,
                                                Colors.white),
                                            SizedBox(width: 8.w),
                                            categoryChip(
                                                'Men\'s Watch',
                                                () {},
                                                AppConst.appGreenColor,
                                                Colors.white),
                                            SizedBox(width: 8.w),
                                            categoryChip(
                                                'Women\'s Watch',
                                                () {},
                                                AppConst.appGreenColor,
                                                Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Card(
                                        child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: ReviewWidget(),
                                    )),
                                    SizedBox(height: 8.h),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 100.h,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppConst.appGreenColor,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(30.0),
                                                topLeft: Radius.circular(30.0),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Have You Seen These Products?',
                                            style: TextStyle(
                                              color: AppConst.appwhiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50.h),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: ProductWidget(
                                                imageUrl:
                                                    'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                                                price: 39.99,
                                                brand: '',
                                                name: 'Product 1',
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            const Expanded(
                                              child: ProductWidget(
                                                imageUrl:
                                                    'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                                                price: 39.99,
                                                brand: '',
                                                name: 'Product 2',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: ProductWidget(
                                                imageUrl:
                                                    'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                                                price: 39.99,
                                                brand: '',
                                                name: 'Product 3',
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            const Expanded(
                                              child: ProductWidget(
                                                imageUrl:
                                                    'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                                                price: 39.99,
                                                brand: '',
                                                name: 'Product 4',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
              .white, // Changes the background color of the BottomAppBar to white
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
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.green)),
                  ),
                  onPressed: () {
                    setState(() {
                      showButtomSheet(context);
                    });
                  },
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.green),
                  ),
                )
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

// show bottom sheet when "Add to Cart" button is pressed
void showButtomSheet(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => ProductDetailsWidget(),
  );
}
