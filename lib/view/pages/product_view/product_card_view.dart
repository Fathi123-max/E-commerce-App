import 'package:e_commerce_app/view/pages/product_view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constatnt/const_color.dart';

class ProductWidget extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String brand;
  final double price;

  const ProductWidget(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.brand,
      required this.price});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProductPage8()));
      },
      child: Stack(
        children: [
          Container(
            width: size.width * .443,
            height: size.height * .27,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2018/04/17/23/10/nature-3329096_960_720.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${widget.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '\$${widget.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.red,
              ),
              child: Text(
                'NEW',
                style:
                    TextStyle(color: AppConst.appwhiteColor, fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
