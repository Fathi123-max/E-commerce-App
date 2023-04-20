import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> _controllers = [
    'My Account',
    'Last Purchase Products',
  ];

  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              'Account Information',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 16.0),
                            const ListTile(
                              leading: Icon(Icons.person),
                              title: Text('Name'),
                              subtitle: Text('John Doe'),
                            ),
                            const SizedBox(height: 8.0),
                            const ListTile(
                              leading: Icon(Icons.email),
                              title: Text('Email'),
                              subtitle: Text('johndoe@example.com'),
                            ),
                            const SizedBox(height: 8.0),
                            const ListTile(
                              leading: Icon(Icons.phone),
                              title: Text('Phone'),
                              subtitle: Text('1234567890'),
                            ),
                            const SizedBox(height: 8.0),
                            const ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text('Address'),
                              subtitle: Text('123 Main St, New York, NY'),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              'My Orders',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 16.0),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    leading: Image.network(
                                      'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                                    ),
                                    title: const Text('Product Name'),
                                    subtitle:
                                        const Text('Order Date: 12-04-2022'),
                                    trailing: const Text('\$50'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              'Account and Purchases Controllers',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 16.0),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _controllers.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.arrow_right),
                                  title: Text(_controllers[index]),
                                  onTap: () {
                                    // TODO: Implement navigation to respective pages
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
