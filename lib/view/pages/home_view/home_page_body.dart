import 'package:e_commerce_app/view/pages/product_view/product_card_view.dart';
import 'package:e_commerce_app/view/pages/product_view/product_photos.dart';
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
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(width: .05.h),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search  product   ...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(4.0.h),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
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
                  SizedBox(
                    height: 250.h,
                    child: const ProductPhotos(images: [
                      'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
                      'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
                      'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg',
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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          "View All ->",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
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
                            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                            context),
                        _buildCategoryItem(
                            'Shoes',
                            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                            context),
                        _buildCategoryItem(
                            'Accessories',
                            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                            context),
                        _buildCategoryItem(
                            'Electronics',
                            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                            context),
                        _buildCategoryItem(
                            'Home',
                            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
                            context),
                        _buildCategoryItem(
                            'Beauty',
                            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
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
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          "View All ->",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
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
                              '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
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
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          "View All ->",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
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
                              '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
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
                                '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
                            price: 49.99,
                            brand: '',
                            name: 'Product 1',
                          ),
                          ProductWidget(
                            imageUrl:
                                '"https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg"',
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
    child: Container(
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Center(child: Column()),
      ),
    ),
  );
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
            'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2019/03/03/21/59/landscape-4032951_960_720.jpg',
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
