import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Shoppingpage extends StatefulWidget {
  const Shoppingpage({super.key});
  @override
  State<Shoppingpage> createState() => _ShoppingpageState();
}

class _ShoppingpageState extends State<Shoppingpage> {
  final List<String> items = List.generate(20, (i) => 'Item $i');
  Widget buildGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return const ProductCard(
          title: 'Mac Book Pro',
          imageUrl: 'https://picsum.photos/250?image=9',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('titleshopping')),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar', 'EG'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[buildGrid(), buildGrid(), buildGrid()],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                tr("hotOffer"),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/offer.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Special Offer ${index + 1}: Get discount on product!",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ProductCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('Item Added To The Cart'),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
