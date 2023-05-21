import 'package:e_commerce_app/view/pages/product_view/product_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _categories = [
    'All',
    'Electronics',
    'Clothing',
    'Beauty',
    'Home',
    'Sports',
    'Books'
  ];

  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
          position: 0,
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 30,
            verticalOffset: 300.0,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Categories:'),
                    DropdownButton<String>(
                      value: _selectedCategory,
                      items: _categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Row(
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
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
