import 'package:e_commerce_app/view/pages/product_view/counter_for_product_page.dart';
import 'package:e_commerce_app/view/pages/product_view/product_photos.dart';
import 'package:e_commerce_app/view/pages/product_view/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constatnt/const_color.dart';
import 'product_card_view.dart';

class ProductPage8 extends StatefulWidget {
  const ProductPage8({super.key});

  @override
  State<ProductPage8> createState() => _ProductPage8State();
}

class _ProductPage8State extends State<ProductPage8>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var x2 = false;

  String photourl =
      "https://cfb.rabbitloader.xyz/g7rhhzcb/rls.t-ww-a28/wp-content/uploads/Free-Pictures.jpg";

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
      fontSize: 14.sp,
      height: 1.5.h,
    ),
  );
  int _selectedIndex = 0;
  bool _isContainerVisible = false;

  List photos = [
    'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106',
    'https://img.freepik.com/free-psd/circle-discount-sale-podium_35913-2513.jpg?w=740&t=st=1684493873~exp=1684494473~hmac=b2bd4a3f7d5608a5e97c3ef34fa046e94d1436ebd64d8f0ba02f044f79e89a9d',
    'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
  ];

  var color = AppConst.appwhiteColor;
  var color2 = AppConst.appwhiteColor;

  var colors = AppConst.appwhiteColor;

  var colorl = AppConst.appwhiteColor;
  var colorxl = AppConst.appwhiteColor;
  var colorm = AppConst.appwhiteColor;
  Widget categoryChip(String text, var onTap, Color color, Color ColotText) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(text, style: TextStyle(fontSize: 16.sp, color: ColotText)),
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
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 360.h,
                  child: const ProductPhotos(
                    images: [
                      'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                      'https://img.freepik.com/free-psd/circle-discount-sale-podium_35913-2513.jpg?w=740&t=st=1684493873~exp=1684494473~hmac=b2bd4a3f7d5608a5e97c3ef34fa046e94d1436ebd64d8f0ba02f044f79e89a9d',
                      'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106',
                    ],
                    thumb: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'Price : ',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[800],
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            '50\$',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppConst.appwhiteColor,
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Product code :   25154',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce faucibus volutpat neque, sit amet cursus magna efficitur sit amet. Nullam blandit bibendum ipsum in tincidunt. Nunc condimentum auctor mi, eget facilisis ante tempor eu. Integer hendrerit sem sed turpis commodo, in consectetur nisi hendrerit. Morbi varius sagittis ipsum sit amet ultrices. Nulla ornare est sit amet venenatis sollicitudin. Etiam elementum nisi nisl, ac mattis leo aliquam eget. Vivamus vitae libero id lectus placerat auctor ut et arcu. Sed vel quam ut lacus ullamcorper rhoncus. Donec scelerisque purus sed est maximus, eu fringilla justo dictum. Duis ac elit vel elit sodales vulputate ut eget justo. Suspendisse eleifend augue eget nisi fringilla blandit.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: _isContainerVisible,
                                child: Container(
                                  height: 120.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              photos[_selectedIndex]),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ]),
                      ),
                      Text(
                        'Color :',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          categoryChip("Red", () {
                            setState(() {
                              _selectedIndex = 0;
                              _isContainerVisible = true;
                              color2 = AppConst.appGreenColor;
                              color = AppConst.appwhiteColor;
                            });
                          }, color2, Colors.black),
                          categoryChip("white", () {
                            setState(() {
                              _selectedIndex = 1;
                              _isContainerVisible = true;
                              color = AppConst.appGreenColor;
                              color2 = AppConst.appwhiteColor;
                            });
                          }, color, Colors.black),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Size :',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          categoryChip("S", () {
                            setState(() {
                              colors = AppConst.appGreenColor;

                              colorl = AppConst.appwhiteColor;
                              colorxl = AppConst.appwhiteColor;
                              colorm = AppConst.appwhiteColor;
                            });
                          }, colors, Colors.black),
                          categoryChip("M", () {
                            setState(() {
                              colors = AppConst.appwhiteColor;

                              colorl = AppConst.appwhiteColor;
                              colorxl = AppConst.appwhiteColor;
                              colorm = AppConst.appGreenColor;
                            });
                          }, colorm, Colors.black),
                          categoryChip("L", () {
                            setState(() {
                              colors = AppConst.appwhiteColor;

                              colorl = AppConst.appGreenColor;
                              colorxl = AppConst.appwhiteColor;
                              colorm = AppConst.appwhiteColor;
                            });
                          }, colorl, Colors.black),
                          categoryChip("XL", () {
                            setState(() {
                              colors = AppConst.appwhiteColor;

                              colorl = AppConst.appwhiteColor;
                              colorxl = AppConst.appGreenColor;
                              colorm = AppConst.appwhiteColor;
                            });
                          }, colorxl, Colors.black),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      const CounterWidget()
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categories :',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        categoryChip('Smart Watch ', () {},
                            AppConst.appGreenColor, Colors.white),
                        SizedBox(width: 8.w),
                        categoryChip('Apple Watch', () {},
                            AppConst.appGreenColor, Colors.white),
                        SizedBox(width: 8.w),
                        categoryChip('Men\'s Watch', () {},
                            AppConst.appGreenColor, Colors.white),
                        SizedBox(width: 8.w),
                        categoryChip('Women\'s Watch', () {},
                            AppConst.appGreenColor, Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.all(15.h),
                  child: SizedBox(
                    height: 450.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppConst.appwhiteColor,
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
                          SizedBox(
                            height: 40.h,
                            child: TabBar(
                              tabs: const [
                                Text("Product Details"),
                                Text("Review"),
                              ],
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorWeight: 2.0,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
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
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConst.appGreenColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Have You Seen These Products?',
                        style: TextStyle(
                          color: AppConst.appwhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                            price: 39.99,
                            brand: '',
                            name: 'Product 1',
                          ),
                        ),
                        SizedBox(width: 8.w),
                        const Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                            price: 39.99,
                            brand: '',
                            name: 'Product 3',
                          ),
                        ),
                        SizedBox(width: 8.w),
                        const Expanded(
                          child: ProductWidget(
                            imageUrl:
                                'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
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
