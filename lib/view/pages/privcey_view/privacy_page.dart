import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Column(
        children: [
          const Text('Privacy Policy'),
          const Text(
              '''
Effective date: [insert date]

We are committed to protecting your privacy. This privacy policy outlines how we collect, use, and store your personal information when you use our mobile e-commerce app'''),
          Text(
            '''How We Use Your Information''',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
          ),
          const Text(
              '''
Information We Collect
When you use our app, we may collect personal information, such as your name, email address, phone number, shipping address, and payment information.
We also collect certain non-personal information about youruse of our app, such as your device type, IP address, and browsing activity.'''),
          Text(
            '''How We Use Your Information''',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
          ),
          const Text(
              '''
We use the information we collect to provide and improve our services to you, such as order processing, customer support, and marketing.''')
        ],
      ),
    );
  }
}
