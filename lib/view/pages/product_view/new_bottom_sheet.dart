// create a new widget for product details in bottom sheet
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constatnt/const_color.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  int _quantity = 1;
  double _totalPrice = 5.0;

  var color = AppConst.appwhiteColor;

  var color2 = AppConst.appwhiteColor;
  var colorl = AppConst.appwhiteColor;
  var colorm = AppConst.appwhiteColor;
  var colors = AppConst.appwhiteColor;
  var colorxl = AppConst.appwhiteColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0.r),
          topRight: Radius.circular(30.0.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10.h,
            ),
            // product image and details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106'))),
                      )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0.h),
                            child: const AutoSizeText(
                              "Product Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.orange, size: 20),
                                const Text("4.5"),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        height: 30.h,
                        width: 100.w,
                        child: const Center(
                            child: Text(
                          "b 500.0 OOF",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const Text(
                        "\$1500 ",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      const Text(
                        "\$1500 ",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        "Available Sizes:",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Quantity"),
                      SizedBox(
                        width: 15.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_quantity > 1) {
                              _quantity--;
                              _totalPrice -= 5.0;
                            }
                          });
                        },
                        child: Container(
                            height: 25.h,
                            width: 25.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      Colors.black, // set the border color here
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.r)),
                            child: const Icon(Icons.remove)),
                      ),
                      const SizedBox(width: 10),
                      Text("$_quantity"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _quantity++;
                            _totalPrice += 5.0;
                          });
                        },
                        child: Container(
                            height: 25.h,
                            width: 25.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      Colors.black, // set the border color here
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.r)),
                            child: const Icon(Icons.add)),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Price:  \$$_totalPrice",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0.r),
                      color: Colors.blue,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // add another product
                        setState(() {
                          _quantity = 1;
                          _totalPrice = 5.0;
                        });
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: size.width * .33,
                        child: Center(
                          child: Text(
                            "Add  Product",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0.r),
                      color: Colors.green,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // buy now
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: size.width * .33,
                        child: Center(
                          child: Text(
                            "Buy now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
