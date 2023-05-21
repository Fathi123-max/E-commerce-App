import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.network(
                  'https://img.freepik.com/free-psd/black-friday-super-sale-social-media-banner-template_106176-1471.jpg?w=740&t=st=1684493764~exp=1684494364~hmac=5fb1cbaba55557358065837d3370f60e931b7ab29cda27be8dc85a1105e9a95b',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: const Text('Product Name'),
                subtitle: const Text('Product Description'),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  onPressed: () {
                    // TODO: Remove item from favorites
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
