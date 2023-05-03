import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/presintation/pages/review.dart';
import 'package:e_commerce_app/presintation/widgets/catogry_screen_widgets/catogry_screen_product.dart';
import 'package:e_commerce_app/presintation/widgets/counter_for_product_page.dart';
import 'package:e_commerce_app/test3.dart';
import 'package:flutter/material.dart';

class ProductPage8 extends StatefulWidget {
  @override
  State<ProductPage8> createState() => _ProductPage8State();
}

class _ProductPage8State extends State<ProductPage8>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final description = Text(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget quam in elit finibus semper. Integer tristique dolor eget neque vehicula suscipit. Sed id tellus sed mauris accumsan rutrum. Vestibulum in nisl eros. Integer blandit orci eu ipsum maximus, id posuere lacus elementum. Nunc lacinia, mauris ac aliquam ultrices, nibh nibh gravida risus, quis tincidunt libero purus ac nisl. Proin at mollis magna, ut porttitor lorem. Sed nec odio eget lacus posuere dictum vel quis elit. Fusce vestibulum laoreet augue in gravida. Nullam varius malesuada nibh sit amet pellentesque.',
    style: TextStyle(
      color: Colors.grey[700],
      fontSize: 14,
      height: 1.5,
    ),
  );
  List<Widget> photos = [
    Image.network(
        'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
        fit: BoxFit.fill),
    Image.network(
        'https://cdn.pixabay.com/photo/2017/12/20/03/46/city-3029160_960_720.jpg',
        fit: BoxFit.fill),
    Image.network(
        'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
        fit: BoxFit.fill),
  ];
  Widget categoryChip(String text, Function onTap, Color color) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  var x = 0;
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
    var x2 = false;
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Page"),
        ),
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 360,
                  child: ProductPhotos(
                    images: [
                      'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
                      'https://cdn.pixabay.com/photo/2017/12/20/03/46/city-3029160_960_720.jpg',
                      'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                    ],
                    thumb: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Product Name',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Price : ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[800],
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            '50\$',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColor.appwhiteColor,
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      Text(
                        'Product code :   25154',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce faucibus volutpat neque, sit amet cursus magna efficitur sit amet. Nullam blandit bibendum ipsum in tincidunt. Nunc condimentum auctor mi, eget facilisis ante tempor eu. Integer hendrerit sem sed turpis commodo, in consectetur nisi hendrerit. Morbi varius sagittis ipsum sit amet ultrices. Nulla ornare est sit amet venenatis sollicitudin. Etiam elementum nisi nisl, ac mattis leo aliquam eget. Vivamus vitae libero id lectus placerat auctor ut et arcu. Sed vel quam ut lacus ullamcorper rhoncus. Donec scelerisque purus sed est maximus, eu fringilla justo dictum. Duis ac elit vel elit sodales vulputate ut eget justo. Suspendisse eleifend augue eget nisi fringilla blandit.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: x2 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 500),
                            child: SizedBox(
                              height: 120,
                              width: 100,
                              child: Image.network(
                                "https://cfb.rabbitloader.xyz/g7rhhzcb/rls.t-ww-a28/wp-content/uploads/Free-Pictures.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Color :',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            child: categoryChip("Red", () {
                              setState(() {
                                x2 = true;
                              });
                            }, AppColor.appwhiteColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CounterWidget()
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Categories :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        categoryChip('Smart Watch', () {}, Colors.grey),
                        const SizedBox(width: 8),
                        categoryChip('Apple Watch', () {}, Colors.grey),
                        const SizedBox(width: 8),
                        categoryChip('Men\'s Watch', () {}, Colors.grey),
                        const SizedBox(width: 8),
                        categoryChip('Women\'s Watch', () {}, Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 450,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.appwhiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 40,
                          child: TabBar(
                            tabs: [
                              Text("Product Details"),
                              Text("Review"),
                            ],
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 2.0,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TabBarView(
                                children: [
                                  description,
                                  const ReviewWidget(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Have You Seen These Products?',
                        style: TextStyle(
                          color: AppColor.appwhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                            price: 39.99,
                            brand: '',
                            name: 'Product 1',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                            price: 39.99,
                            brand: '',
                            name: 'Product 3',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                            price: 39.99,
                            brand: '',
                            name: 'Product 4',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    ));
  }
}




//! tap view
