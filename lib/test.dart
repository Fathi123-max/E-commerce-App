import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/presintation/pages/review.dart';
import 'package:e_commerce_app/presintation/widgets/catogry_screen_widgets/catogry_screen_product.dart';
import 'package:e_commerce_app/presintation/widgets/counter_for_product_page.dart';
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
  Widget categoryChip(String title, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ActionChip(
        label: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        onPressed: onPressed,
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
    bool x3 = false;
    var x2 = x3;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Product Page"),
          ),
          extendBody: true,
          body: SingleChildScrollView(
            child: Container(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 350,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: CarouselSlider(
                        items: photos,
                        options: CarouselOptions(
                          clipBehavior: Clip.antiAlias,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          aspectRatio: 16 / 9,
                          pauseAutoPlayOnTouch: true,
                          height: 350,
                          viewportFraction: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(children: photos),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Product Name',
                          style: Theme.of(context).textTheme.headline6,
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
                              ),
                            ),
                            Text(
                              '50\$',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 16),
                        Text(
                          'Product code :   25154',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce faucibus volutpat neque, sit amet cursus magna efficitur sit amet. Nullam blandit bibendum ipsum in tincidunt. Nunc condimentum auctor mi, eget facilisis ante tempor eu. Integer hendrerit sem sed turpis commodo, in consectetur nisi hendrerit. Morbi varius sagittis ipsum sit amet ultrices. Nulla ornare est sit amet venenatis sollicitudin. Etiam elementum nisi nisl, ac mattis leo aliquam eget. Vivamus vitae libero id lectus placerat auctor ut et arcu. Sed vel quam ut lacus ullamcorper rhoncus. Donec scelerisque purus sed est maximus, eu fringilla justo dictum. Duis ac elit vel elit sodales vulputate ut eget justo. Suspendisse eleifend augue eget nisi fringilla blandit.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Visibility(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: x2,
                              child: SizedBox(
                                height: 120,
                                width: 100,
                                child: Image.network(
                                    fit: BoxFit.fill,
                                    'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg'),
                              ),
                            ),
                          ],
                        )),
                        const Text("Color :"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 50,
                                child: categoryChip("Red", () {
                                  setState(() {
                                    x2 = true;
                                  });
                                })),
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
                  Text(
                    'Categories :',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        categoryChip(
                          'Smart Watch',
                          () {
                            // TODO: Implement smart watch category filtering
                          },
                        ),
                        const SizedBox(width: 8),
                        categoryChip(
                          'Apple Watch',
                          () {
                            // TODO: Implement apple watch category filtering
                          },
                        ),
                        const SizedBox(width: 8),
                        categoryChip(
                          'Men\'s Watch',
                          () {
                            // TODO: Implement men's watch category filtering
                          },
                        ),
                        const SizedBox(width: 8),
                        categoryChip(
                          'Women\'s Watch',
                          () {
                            // TODO: Implement women's watch category filtering
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                      width: 100,
                      child: TabBar(
                          tabs: [Text("Product detailes"), Text("Review")])),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 380,
                      child: TabBarView(
                          children: [description, const ReviewWidget()])),
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
                                topRight: Radius.circular(30.0)),
                          ),
                        ),
                        child: const Text(
                          'Have You Seen This Products ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          ProductWidget(
                            imageUrl:
                                '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                          ProductWidget(
                            imageUrl:
                                '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ProductWidget(
                            imageUrl:
                                '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                          ProductWidget(
                            imageUrl:
                                '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




//! tap view
