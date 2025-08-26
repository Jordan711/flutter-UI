import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        children: [
          ElevatedButton(onPressed: () {}, child: Icon(Icons.shop)),
          ElevatedButton(onPressed: () {}, child: Text("Buy Now")),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {Navigator.of(context).pop();}, child: Icon(Icons.arrow_back),),
                Text("PRODUCT DETAILS"),
                GestureDetector(onTap: () {}, child: Icon(Icons.favorite_border_rounded),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
