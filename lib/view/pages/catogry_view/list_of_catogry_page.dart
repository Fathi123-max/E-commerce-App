import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../constatnt/const_color.dart';

class ListOfCatogry extends StatelessWidget {
  const ListOfCatogry({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(w / 30),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: 20,
          itemBuilder: (BuildContext c, int i) {
            return AnimationConfiguration.staggeredList(
              position: i,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: Container(
                  margin: EdgeInsets.only(bottom: w / 20),
                  height: w / 3,
                  decoration: BoxDecoration(
                    color: AppConst.appwhiteColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: _buildCategoryItem(context, 'Clothing',
                      'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'CatogryPage');
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: AppConst.appwhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
