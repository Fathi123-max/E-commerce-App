// create a new widget for product details in bottom sheet
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  int _quantity = 1;
  double _totalPrice = 5.0;

  @override
  Widget build(BuildContext context) {
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
                                    'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg'))),
                      )),
                      Column(
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
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    height: 30.h,
                    width: 100.w,
                    child: Center(
                        child: Text(
                      "b 500.0 OOF",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Available Sizes: S, M, L",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) {
                              _quantity--;
                              _totalPrice -= 5.0;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(width: 10),
                      Text("$_quantity"),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                            _totalPrice += 5.0;
                          });
                        },
                        icon: const Icon(Icons.add),
                        padding: EdgeInsets.zero,
                      ),
                      const Spacer(),
                      Text(
                        "\$$_totalPrice",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.grey, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "4.0 (235 ratings)",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
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
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.orange,
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
                      child: const Text(
                        "Add another",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.orange,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // buy now
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Buy now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
