import 'package:flutter/material.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("John Doe"),
          accountEmail: Text("john.doe@example.com"),
          currentAccountPicture: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        ListTile(
          title: const Text("Home"),
          leading: const Icon(Icons.home),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Categories"),
          leading: const Icon(Icons.category),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Profile"),
          leading: const Icon(Icons.person),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Settings"),
          leading: const Icon(Icons.settings),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Logout"),
          leading: const Icon(Icons.logout),
          onTap: () {},
        ),
      ],
    );
  }
}
