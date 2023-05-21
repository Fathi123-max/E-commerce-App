import 'package:e_commerce_app/view/pages/catogry_view/photos_view.dart';
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
                child: const ProductPhotoscat(images: [
                  'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                  'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106',
                  'https://img.freepik.com/free-psd/circle-discount-sale-podium_35913-2513.jpg?w=740&t=st=1684493873~exp=1684494473~hmac=b2bd4a3f7d5608a5e97c3ef34fa046e94d1436ebd64d8f0ba02f044f79e89a9d',
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
                              'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                          price: 49.99,
                          brand: '',
                          name: 'Product 1',
                        ),
                      ),
                      Expanded(
                        child: ProductWidget(
                          imageUrl:
                              'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
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
