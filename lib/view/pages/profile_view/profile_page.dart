import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> _controllers = [
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
                            SizedBox(height: 16.h),
                            Text(
                              'Account Information',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 16.h),
                            const ListTile(
                              leading: Icon(Icons.person),
                              title: Text('Name'),
                              subtitle: Text('John Doe'),
                            ),
                            SizedBox(height: 8.h),
                            const ListTile(
                              leading: Icon(Icons.email),
                              title: Text('Email'),
                              subtitle: Text('johndoe@example.com'),
                            ),
                            SizedBox(height: 8.h),
                            const ListTile(
                              leading: Icon(Icons.phone),
                              title: Text('Phone'),
                              subtitle: Text('1234567890'),
                            ),
                            SizedBox(height: 8.h),
                            const ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text('Address'),
                              subtitle: Text('123 Main St, New York, NY'),
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h),
                            Text(
                              'My Orders',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 16.h),
                            ListView.builder(
                              padding: const EdgeInsets.only(left: 10),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    leading: Image.network(
                                      'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                                    ),
                                    title: const Text('Product Name'),
                                    subtitle:
                                        const Text('Order Date: 12-04-2022'),
                                    trailing: const Text('\$50'),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h),
                            Text(
                              'Account and Purchases Controllers',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 16.h),
                            ListView.builder(
                              padding: const EdgeInsets.only(left: 10),
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
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
