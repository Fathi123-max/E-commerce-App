import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/view/pages/product_view/product_card_view.dart';
import 'package:e_commerce_app/view/pages/product_view/product_photos.dart';
import 'package:e_commerce_app/view/pages/search_view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  var isLoadind;
  @override
  void initState() {
    super.initState();
    isLoadind = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimationLimiter(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: AnimationConfiguration.staggeredList(
            position: 0,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    child: Row(
                      children: [
                        Image.asset("assets/images/onemart.png"),
                        const Text("One Mart")
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(width: .05.h),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const SearchPage();
                          },
                        ));
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Search  product   ...',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 190, 169, 169)),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(4.0.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppConst.appGreenColor,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                    child: const ProductPhotos(images: [
                      'https://images.pexels.com/photos/5872364/pexels-photo-5872364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      'https://images.pexels.com/photos/5632400/pexels-photo-5632400.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      'https://images.pexels.com/photos/5872364/pexels-photo-5872364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ], thumb: false),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'Catogries',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20.h,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10.w,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildCategoryItem(
                            'Clothing',
                            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                            context),
                        _buildCategoryItem(
                            'Shoes',
                            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=799&q=80',
                            context),
                        _buildCategoryItem(
                            'Accessories',
                            'https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60',
                            context),
                        _buildCategoryItem(
                            'Electronics',
                            'https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60',
                            context),
                        _buildCategoryItem(
                            'Home',
                            'https://plus.unsplash.com/premium_photo-1675896041816-4154315d12e3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60',
                            context),
                        _buildCategoryItem(
                            'Beauty',
                            'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60',
                            context),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'Friday Sale',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20.h,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10.w,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return const ProductWidget(
                          imageUrl:
                              'https://images.unsplash.com/photo-1572635196237-14b3f281503f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
                          price: 49.99,
                          brand: '',
                          name: 'Product 1',
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'Popular Products',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20.h,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10.w,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return const ProductWidget(
                          imageUrl:
                              'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                          price: 49.99,
                          brand: '',
                          name: 'Product 1',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'All Products',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductWidget(
                            imageUrl:
                                'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                            price: 49.99,
                            brand: '',
                            name: 'Product 1',
                          ),
                          ProductWidget(
                            imageUrl:
                                'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                            price: 39.99,
                            brand: '',
                            name: 'Product 2',
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget _buildCategoryItem(String title, String image, BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'CatogryPage');
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Positioned(
            top: 5.h,
            right: 5.w,
            left: 5.w,
            bottom: 20.h,
            child: Container(
              height: 200.h,
              width: 150.w,
              margin: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppConst.appGreenColor),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: AutoSizeText(title))
        ],
      ));
}



































/*





import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/presintation/pages/catogry_page.dart';
import 'package:e_commerce_app/presintation/pages/product_page.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: [
            'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106',
            'https://via.placeholder.com/150/FF0000',
            'https://via.placeholder.com/150/0000FF',
          ].map((url) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ));
                  },
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Text(
            'Featured Products',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColor.appwhiteColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106',
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.h.0),
                          Text(
                            'Product Description',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8.h.0),
                          Text(
                            '\$50',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 16.h.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 18.0),
                                  SizedBox(width: 4.0),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Free shipping',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('View All Products'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Text(
            'Popular Categories',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 4,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsPage(
                      categoryName: 'CategoryName',
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppColor.appwhiteColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3250.jpg?w=740&t=st=1684493847~exp=1684494447~hmac=11efcc12fe38d467d7b796bedb3e45d3c6d8b10ec562b50668d6fa7bd566e106',
                        height: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h.0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        'CategoryName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h.0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        '100 Products',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCategoryInfo(
                          context,
                          Icons.star,
                          '4.5',
                          'Rating',
                        ),
                        _buildCategoryInfo(
                          context,
                          Icons.shopping_cart,
                          '10k',
                          'Sold',
                        ),
                        _buildCategoryInfo(
                          context,
                          Icons.local_offer,
                          '20% OFF',
                          'Discount',
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h.0),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ));
  }

  Widget _buildCategoryInfo(
      BuildContext context, IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: MediaQuery.of(context).size.width * 0.06,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 8.h.0),
        Text(
          value,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.035,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
 */
