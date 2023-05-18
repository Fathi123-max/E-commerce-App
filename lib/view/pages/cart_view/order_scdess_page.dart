import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderNumber;
  final String shippingAddress;
  final String paymentMethod;
  final String deliveryDate;

  OrderSuccessPage({
    required this.orderNumber,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 115.h,
              width: 100.w,
              child: Lottie.network(
                  'https://assets9.lottiefiles.com/private_files/lf30_zjkforca.json'),
            ),
            SizedBox(height: 15.0.h),
            Text(
              "Order Successfully!",
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "Your order is successful, Please check ",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                "order process in here",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 15.0.h),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.r)),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          "Order Code:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0.sp,
                          ),
                        ),
                        trailing: Text(
                          orderNumber,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Recipient",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    trailing: Text(
                      "Ahmed Fathi",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    trailing: Text(
                      "+201024021764",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Address",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    trailing: Text(shippingAddress),
                  ),
                  ListTile(
                    title: Text(
                      "Order Total",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    trailing: Text(
                      "\$450",
                      style: TextStyle(
                          fontSize: 15.sp, color: AppConst.appRedColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0.h),
            ElevatedButton(
              onPressed: () {
                // navigate back to home screen
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 14.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 120.w, vertical: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: const Text("Track Order"),
            ),
          ],
        ),
      ),
    );
  }
}
