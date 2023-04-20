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
                  'https://cdn.pixabay.com/photo/2023/03/31/15/04/cloud-7890229_960_720.jpg',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('Product Name'),
                subtitle: Text('Product Description'),
                trailing: IconButton(
                  icon: Icon(Icons.favorite),
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
