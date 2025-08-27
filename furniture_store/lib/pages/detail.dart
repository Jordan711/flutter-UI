import 'package:flutter/material.dart';
import 'package:furniture_store/models/product.dart';

class DetailsPage extends StatelessWidget {
  final Product productInfo;
  const DetailsPage({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {},
                customBorder: CircleBorder(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(Icons.shopping_bag_outlined, size: 32.0),
                    ),

                    Positioned(
                      right: 16.0,
                      bottom: 12.0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 24.0),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: Text("Buy Now", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Text("PRODUCT DETAILS"),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.favorite_border_rounded),
                ),
              ],
            ),
            Image.asset(productInfo.imagePath),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  Expanded(child: Text(productInfo.name)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text(productInfo.rating),
                          ],
                        ),
                        Text("56 Reviews"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("Available Colours"),
                  Wrap(
                    spacing: 10.0,
                    children: productInfo.colors.map((color) {
                      return Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            Divider(),

            Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text("Description"),
                children: [
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(productInfo.description),
                  ),
                ],
              ),
            ),

            Divider(),

            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, 
              ),
              child: ExpansionTile(
                title: Text("Material Details"),
                children: [
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 12.0,
                      children: productInfo.materials.map((material) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(material),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
