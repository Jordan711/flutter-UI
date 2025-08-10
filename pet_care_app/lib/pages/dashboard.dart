import 'package:flutter/material.dart';
import 'package:pet_care_app/models/animals.dart';
import 'package:pet_care_app/pages/training_page.dart';
import 'package:pet_care_app/utils/global_colours.dart';
import 'package:pet_care_app/utils/global_styling.dart';

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
          margin: EdgeInsets.all(40.0),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi Bobson Liu", style: GlobalStyling.title),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: halfWidth,
                                  child: Text(
                                    "Find Nearest Veterinarians For Your Pet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ), // Optional spacing between the texts
                                SizedBox(
                                  width: halfWidth,
                                  child: Center(
                                    child: Image.asset(
                                      "images/veterinarian-pets.png",
                                      filterQuality: FilterQuality.high,
                                    ),
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
                    Text("Categories", style: GlobalStyling.title),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                //TODO Implement filter
                SizedBox(height: 10.0),
                AnimalSection(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimalSection extends StatefulWidget {
  const AnimalSection({super.key});

  @override
  State<AnimalSection> createState() => _AnimalSectionState();
}

class _AnimalSectionState extends State<AnimalSection> {
  Animal currFilter = Animal.dog;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double boxWidth = (screenWidth - 40 - 16) / 2;

    void setCurrFilter(Animal newFilter) {
      setState(() {
        currFilter = newFilter;
      });
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryToggleButton(
              imagePath: "images/icons8-shiba-inu-100.png",
              categoryName: Animal.dog,
              changeSelected: setCurrFilter,
              currSelected: currFilter,
            ),
            CategoryToggleButton(
              imagePath: "images/icons8-cat-100.png",
              categoryName: Animal.cat,
              changeSelected: setCurrFilter,
              currSelected: currFilter,
            ),
            CategoryToggleButton(
              imagePath: "images/icons8-bird-48.png",
              categoryName: Animal.bird,
              changeSelected: setCurrFilter,
              currSelected: currFilter,
            ),
            CategoryToggleButton(
              imagePath: "images/icons8-fish-100.png",
              categoryName: Animal.fish,
              changeSelected: setCurrFilter,
              currSelected: currFilter,
            ),
          ],
        ),
        SizedBox(height: 25.0),

        // Animals Section
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: Animals.dummyData
              .where((animal) => animal.animalType == currFilter)
              .map((animal) {
                return SizedBox(
                  width: boxWidth - 30,
                  child: AnimalBox(
                    imagePath: animal.imagePath,
                    animalName: animal.animalName,
                    distance: '${animal.distance.toString()} km away',
                    price: '\$${animal.price.toString()}',
                    startColour: animal.startColour,
                    endColour: animal.endColour,
                  ),
                );
              })
              .toList(),
        ),
      ],
    );
  }
}

class CategoryToggleButton extends StatefulWidget {
  final String imagePath;
  final Animal categoryName;
  final Function changeSelected;
  final Animal currSelected;
  const CategoryToggleButton({
    super.key,
    required this.imagePath,
    required this.categoryName,
    required this.changeSelected,
    required this.currSelected,
  });

  @override
  State<CategoryToggleButton> createState() => _CategoryToggleButtonState();
}

class _CategoryToggleButtonState extends State<CategoryToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.changeSelected(widget.categoryName);
            });
          },
          child: Container(
            height: 75.0,
            width: 75.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: widget.categoryName == widget.currSelected
                  ? GlobalColours.yellowButton
                  : GlobalColours.darkLightOrange,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Image.asset(widget.imagePath)),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          widget.categoryName.label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
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
        height: 230.0,
        width: 180.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [startColour, endColour],
                  stops: [0.0, 0.8],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    height: 150.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        animalName,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        distance,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
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
