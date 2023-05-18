import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracker/order_tracker.dart';

import 'add_truck.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({Key? key}) : super(key: key);

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(Icons.map_outlined),
          SizedBox(
            width: 20.w,
          )
        ],
        title: const Text(
          "Track Order",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 70.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your order code:",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  " #800715",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "3 items - ",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " \$270.79",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            OrderTracker(
              status: Status.delivered,
              activeColor: Colors.green,
              inActiveColor: Colors.grey[300],
              orderTitleAndDateList: orderList,
              shippedTitleAndDateList: shippedList,
              outOfDeliveryTitleAndDateList: outOfDeliveryList,
              deliveredTitleAndDateList: deliveredList,
            ),
            SizedBox(height: 24.0.h),
            ElevatedButton(
              onPressed: () {
                // navigate back to home screen
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddTruck(),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 13.sp),
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
