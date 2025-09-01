import 'package:flutter/material.dart';
import 'package:furniture_store/models/product.dart';
import 'package:furniture_store/pages/detail.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  SizedBox(width: 10.0),
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
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width - 50.0,
                      ),
                      child: FilterComponent(),
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
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: Product.dummyData.map((item) {
                  return CatalogueItem(productInfo: item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  String currSelected = "Living Room";
  @override
  Widget build(BuildContext context) {
    void setCurrFilter(String newFilter) {
      setState(() {
        currSelected = newFilter;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterButton(buttonText: "All Product", selected: currSelected, changeSelected: setCurrFilter,),
        SizedBox(width: 12.0),
        FilterButton(buttonText: "Living Room", selected: currSelected, changeSelected: setCurrFilter),
        SizedBox(width: 12.0),
        FilterButton(buttonText: "Bedroom", selected: currSelected, changeSelected: setCurrFilter),
        SizedBox(width: 12.0),
        FilterButton(buttonText: "Dining Room", selected: currSelected, changeSelected: setCurrFilter),
      ],
    );
  }
}

class FilterButton extends StatefulWidget {
  final String buttonText;
  final String selected;
  final Function changeSelected;
  const FilterButton({
    super.key,
    required this.buttonText,
    required this.selected, required this.changeSelected,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  void updateSelected(String selectedNew) {
    setState(() {
      widget.changeSelected(selectedNew);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buttonText == widget.selected) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            widget.buttonText,
            style: TextStyle(color: Colors.grey[100]),
          ),
        ),
      );
    } else {
      return InkWell(onTap: () {
        updateSelected(widget.buttonText);
      }, child: Text(widget.buttonText, style: TextStyle(color: Colors.black)));
    }
  }
}

class CatalogueItem extends StatelessWidget {
  final Product productInfo;

  const CatalogueItem({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image.asset(productInfo.imagePath),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              DetailsPage(productInfo: productInfo),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productInfo.name),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(productInfo.rating),
                ],
              ),
            ],
          ),
          Text(productInfo.price),
        ],
      ),
    );
  }
}
