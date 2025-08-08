import 'package:flutter/material.dart';
import 'package:pet_care_app/models/animals.dart';
import 'package:pet_care_app/pages/training_page.dart';
import 'package:pet_care_app/utils/global_colours.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double boxWidth = (screenWidth - 40 - 16) / 2;

    return Scaffold(
      backgroundColor: GlobalColours.lightOrange,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: ListView(
              children: [
                // Greeting section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi Bobson Liu",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text("Good Morning!"),
                      ],
                    ),
                    ClipOval(
                      child: Image.asset(
                        "images/dog.png",
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                // Search bar
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //Banner section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => TrainingPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double halfWidth =
                                (constraints.maxWidth - 16) / 2;
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Important for multiline alignment
                              children: [
                                SizedBox(
                                  width: halfWidth,
                                  child: Text(
                                    "Find Nearest Veterinarians For Your Pet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ), // Optional spacing between the texts
                                SizedBox(
                                  width: halfWidth,
                                  child: Text(
                                    "Find Nearest Veterinarians For Your Pet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),

                // Categories section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories", style: TextStyle(fontSize: 23.0)),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryToggleButton(
                      imagePath: "images/icons8-shiba-inu-100.png",
                      categoryName: "Dog",
                    ),
                    CategoryToggleButton(
                      imagePath: "images/icons8-cat-100.png",
                      categoryName: "Cat",
                    ),
                    CategoryToggleButton(
                      imagePath: "images/icons8-bird-48.png",
                      categoryName: "Bird",
                    ),
                    CategoryToggleButton(
                      imagePath: "images/icons8-fish-100.png",
                      categoryName: "Fish",
                    ),
                  ],
                ),
                SizedBox(height: 40.0),

                // Animals Section
                Wrap(
                  spacing: 20, 
                  runSpacing: 20, 
                  children: Animals.dummyData.where((animal) => animal.animalType == "DOG").map((animal) {
                    return SizedBox(
                      width: boxWidth - 30, 
                      child: AnimalBox(
                        imagePath: animal.imagePath,
                        animalName: animal.animalName,
                        distance: '${animal.distance.toString()} KM',
                        price: '\$ ${animal.price.toString()}',
                        startColour: GlobalColours.lightDarkOrange,
                        endColour: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryToggleButton extends StatefulWidget {
  final String imagePath;
  final String categoryName;
  const CategoryToggleButton({
    super.key,
    required this.imagePath,
    required this.categoryName,
  });

  @override
  State<CategoryToggleButton> createState() => _CategoryToggleButtonState();
}

class _CategoryToggleButtonState extends State<CategoryToggleButton> {
  late bool activeStatus;

  @override
  void initState() {
    activeStatus = false;
    super.initState();
  }

  void resetStatus() {
    activeStatus = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              activeStatus = true;
            });
          },
          child: Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: activeStatus
                  ? GlobalColours.yellowButton
                  : GlobalColours.darkLightOrange,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Image.asset(widget.imagePath)),
            ),
          ),
        ),
        Text(widget.categoryName, textAlign: TextAlign.center),
      ],
    );
  }
}

class AnimalBox extends StatelessWidget {
  final String imagePath;
  final String animalName;
  final String distance;
  final String price;
  final Color startColour;
  final Color endColour;

  const AnimalBox({
    super.key,
    required this.imagePath,
    required this.animalName,
    required this.distance,
    required this.price,
    required this.startColour,
    required this.endColour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 220.0,
        width: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [startColour, endColour],
            stops: [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: 150.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Row(children: [Text(animalName), Text(price)]),
            Text(distance),
          ],
        ),
      ),
    );
  }
}
