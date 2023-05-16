import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0.r),
                          bottomLeft: Radius.circular(10.0.r),
                        ),
                        color: Colors.green,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _decrementCount();
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      )),
                  Container(
                    width: 50.w,
                    height: 30.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey),
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      '$_count',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                      width: 50.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0.r),
                          bottomRight: Radius.circular(10.0.r),
                        ),
                        color: Colors.green,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _incrementCount();
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                backgroundColor: AppConst.appGreenColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
              ),
              child:
                  const Text('Buy Now', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
              ),
              child: const Text('Add to Cart',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
