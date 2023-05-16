import 'package:e_commerce_app/view/pages/product_view/product_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../product_view/product_card_view.dart';

class CatogryPage extends StatefulWidget {
  const CatogryPage({Key? key}) : super(key: key);

  @override
  State<CatogryPage> createState() => _CatogryPageState();
}

class _CatogryPageState extends State<CatogryPage> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'image': 'assets/images/product1.jpg',
      'price': 50.0,
    },
    {
      'name': 'Product 2',
      'image': 'assets/images/product2.jpg',
      'price': 70.0,
    },
    {
      'name': 'Product 3',
      'image': 'assets/images/product3.jpg',
      'price': 80.0,
    },
    {
      'name': 'Product 4',
      'image': 'assets/images/product4.jpg',
      'price': 60.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.h,
                child: const ProductPhotos(images: [
                  'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
                  'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                  'https://cdn.pixabay.com/photo/2017/12/20/03/46/city-3029160_960_720.jpg',
                ], thumb: false),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'All Products',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.only(left: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return const Row(
                    children: [
                      Expanded(
                        child: ProductWidget(
                          imageUrl:
                              '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                          price: 49.99,
                          brand: '',
                          name: 'Product 1',
                        ),
                      ),
                      Expanded(
                        child: ProductWidget(
                          imageUrl:
                              '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                          price: 39.99,
                          brand: '',
                          name: 'Product 2',
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}