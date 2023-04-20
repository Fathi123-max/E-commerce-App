import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/catogry_screen_widgets/catogry_screen_product.dart';

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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.green,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Men\'s Fashion'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.green,
                Colors.white,
              ],
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: [
                      Image.network(
                          'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                          fit: BoxFit.fill),
                      Image.network(
                          'https://cdn.pixabay.com/photo/2017/12/20/03/46/city-3029160_960_720.jpg',
                          fit: BoxFit.fill),
                      Image.network(
                          'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
                          fit: BoxFit.fill),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      pauseAutoPlayOnTouch: true,
                      height: 200,
                      viewportFraction: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'All Products',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Row(
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
        ),
      ),
    );
  }
}
