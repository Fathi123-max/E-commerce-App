import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constatnt/const_color.dart';

class ProductPhotoscat extends StatefulWidget {
  final List<String> images;

  const ProductPhotoscat(
      {super.key, required this.images, required this.thumb});
  final bool thumb;
  @override
  _ProductPhotoscatState createState() => _ProductPhotoscatState();
}

class _ProductPhotoscatState extends State<ProductPhotoscat> {
  late GlobalKey<CarouselSliderState> _sliderKey;

  @override
  void initState() {
    super.initState();
    _sliderKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> photos = widget.images
        .map((image) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
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
              child: Image.network(
                image,
                fit: BoxFit.fill,
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
                    height: 300.h,
                    autoPlay: true,
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
