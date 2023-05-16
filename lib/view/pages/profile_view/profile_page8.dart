import 'dart:async';

import 'package:e_commerce_app/constatnt/const_color.dart';
import 'package:e_commerce_app/view/pages/auth_view/custom_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

showSignInDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Size size = MediaQuery.of(context).size;

      return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          width: size.width * .9.w,
          height: size.width * 1.1.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: const custom_login(),
        ),
      );
    },
  );
}

class ProfilePage8 extends StatefulWidget {
  const ProfilePage8({super.key});

  @override
  _ProfilePage8State createState() => _ProfilePage8State();
}

class _ProfilePage8State extends State<ProfilePage8> {
  final List<String> orderHistory = ['Order 1', 'Order 2', 'Order 3'];
  int selectedIndex = 0;

  final List<String> tabs = ['Profile', 'Addresses', 'Payment'];
  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () {
      showSignInDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
        position: 0,
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
          duration: const Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          horizontalOffset: 30,
          verticalOffset: 300.0,
          child: DefaultTabController(
            length: tabs.length,
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: TabBar(
                  indicatorColor: Colors.green,
                  labelColor: Colors.black,
                  tabs: tabs.map((String tab) {
                    return Tab(
                      text: tab,
                    );
                  }).toList(),
                ),
              ),
              body: TabBarView(
                children: [
                  _buildProfile(),
                  _buildAddresses(),
                  _buildPayment(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/03/11/12/15/raindrops-3216609_960_720.jpg'),
                ),
                SizedBox(height: 16.h),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                const Text(
                  'johndoe@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Order History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: orderHistory.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Colors.blue
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      orderHistory[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: index == selectedIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: index == selectedIndex
                            ? AppConst.appwhiteColor
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1234567890',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '01/01/2023',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Status',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Delivered',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddresses() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Saved Addresses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildAddressCard(
            name: 'Home',
            address1: '123 Main St.',
            address2: '',
            city: 'Anytown',
            state: 'CA',
            zip: '12345',
          ),
          _buildAddressCard(
            name: 'Work',
            address1: '456 Elm St.',
            address2: '',
            city: 'Othertown',
            state: 'CA',
            zip: '67890',
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the Add Address page
              },
              child: const Text('Add Address'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard({
    required String name,
    required String address1,
    required String city,
    required String state,
    required String zip,
    String address2 = '',
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(address1),
          if (address2.isNotEmpty) SizedBox(height: 8.h),
          if (address2.isNotEmpty) Text(address2),
          SizedBox(height: 8.h),
          Text('$city, $state $zip'),
        ],
      ),
    );
  }

  Widget _buildPayment() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Methods',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          _buildPaymentMethod(
            icon: Icons.credit_card,
            title: 'Credit/Debit Card',
            subtitle: 'Visa **34',
          ),
          SizedBox(height: 16.h),
          _buildPaymentMethod(
            icon: Icons.payment,
            title: 'PayPal',
            subtitle: 'johndoe@example.com',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.grey[400],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}
