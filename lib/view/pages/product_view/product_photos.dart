import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constatnt/const_color.dart';

class ProductPhotos extends StatefulWidget {
  final List<String> images;

  const ProductPhotos({super.key, required this.images, required this.thumb});
  final bool thumb;
  @override
  _ProductPhotosState createState() => _ProductPhotosState();
}

class _ProductPhotosState extends State<ProductPhotos> {
  late GlobalKey<CarouselSliderState> _sliderKey;

  @override
  void initState() {
    super.initState();
    _sliderKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> photos = widget.images
        .map((image) => Padding(
              padding: EdgeInsets.all(15.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ))
        .toList();

    List<Widget> thumbnails = widget.images
        .map((image) => GestureDetector(
              onTap: () {
                int index = widget.images.indexOf(image);
                _sliderKey.currentState!.carouselController
                    .animateToPage(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
              ),
            ))
        .toList();

    return Container(
      color: AppConst.appwhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CarouselSlider(
                  key: _sliderKey,
                  items: photos,
                  options: CarouselOptions(
                    height: 200.h,
                    clipBehavior: Clip.antiAlias,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 16 / 9,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 1,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          widget.thumb
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: thumbnails,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
