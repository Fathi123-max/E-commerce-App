import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../constatnt/const_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isEmpty
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : AnimationLimiter(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10),
                itemCount: _items.length,
                itemBuilder: (BuildContext c, int i) {
                  return AnimationConfiguration.staggeredList(
                      position: i,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                          duration: const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          horizontalOffset: 30,
                          verticalOffset: 300.0,
                          child: Dismissible(
                            key: ValueKey(_items[i]),
                            onDismissed: (direction) {
                              setState(() {
                                _items.removeAt(i);
                              });
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: AppConst.appwhiteColor,
                              ),
                            ),
                            child: ListTile(
                              leading: Image.network(
                                'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                                height: 60,
                              ),
                              title: Text(_items[i]),
                              subtitle: const Text('\$50'),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _items.removeAt(i);
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          )));
                },
              ),
            ),
      bottomNavigationBar: _items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppConst.appwhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: \$150',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement checkout functionality
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
    );
  }
}
