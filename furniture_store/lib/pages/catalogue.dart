import 'package:flutter/material.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search section
            Row(
              children: [
                Icon(Icons.add_box_rounded, color: Colors.black, size: 40.0),
                Icon(Icons.ac_unit_rounded, color: Colors.black, size: 40.0),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search Anything",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Icon(Icons.shopping_bag, size: 40.0),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white, fontSize: 8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Icon(Icons.favorite_border_outlined, size: 40.0),
                SizedBox(height: 10.0),
              ],
            ),
            Divider(indent: 16.0, endIndent: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterButton(buttonText: "All Product"),
                      FilterButton(buttonText: "Living Room"),
                      FilterButton(buttonText: "Bedroom"),
                      FilterButton(buttonText: "Dining Room"),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Text(
              "DISCOVER NEW PRODUCT",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String buttonText;
  const FilterButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(buttonText, style: TextStyle(color: Colors.grey[100])),
      ),
    );
  }
}

class CatalogueItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String rating;
  final String price;
  const CatalogueItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
