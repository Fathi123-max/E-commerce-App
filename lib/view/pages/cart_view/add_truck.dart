import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_scdess_page.dart';

class AddTruck extends StatelessWidget {
  const AddTruck({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Track Order",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 60.0.h),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Track Your Order",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0.h),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: RoundedTextField(
                hintText: "NO , Order",
                onSubmitted: (value) {},
                textInputAction: TextInputAction.none,
                controller: TextEditingController(),
              ),
            ),
            SizedBox(height: 24.0.h),
            ElevatedButton(
              onPressed: () {
                // navigate back to home screen
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OrderSuccessPage(
                      deliveryDate: "25",
                      orderNumber: "201024021764",
                      paymentMethod: "visa",
                      shippingAddress: "25 Cairo"),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 13.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 120.w, vertical: 20.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: const Text("Track Order"),
            ),
          ],
        ));
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String value) onSubmitted;
  final TextEditingController? controller;

  const RoundedTextField({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.onSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
