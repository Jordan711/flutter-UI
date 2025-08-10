
import 'package:flutter/material.dart';
import 'package:pet_care_app/models/animals.dart';

import 'animal_box.dart';
import 'category_toggle_button.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          children:
              Animals.dummyData
                      .where((animal) => animal.animalType == currFilter)
                      .isNotEmpty
              ? Animals.dummyData
                    .where((animal) => animal.animalType == currFilter)
                    .map((animal) {
                      return SizedBox(
                        width: boxWidth - 30,
                        child: AnimalBox(
                          imagePath: animal.imagePath,
                          animalName: animal.animalName,
                          distance: '${animal.distance.toString()} km away',
                          price: '\$${animal.price.round().toString()}',
                          startColour: animal.startColour,
                          endColour: animal.endColour,
                        ),
                      );
                    })
                    .toList()
              : [Center(child: Text("No results found"))],
        ),
      ],
    );
  }
}
