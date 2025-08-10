import 'package:flutter/material.dart';
import 'package:pet_care_app/models/veterinarians.dart';
import 'package:pet_care_app/utils/global_colours.dart';
import 'package:pet_care_app/utils/global_styling.dart';
import 'package:pet_care_app/widgets/training_page/help_button.dart';
import 'package:pet_care_app/widgets/training_page/veterinary_info_box.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                // Greeting section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Let's Train Your Pet!"),
                        Text("Beginner's Training", style: GlobalStyling.title),
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

                //How Can I Help?
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 28.0,
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: [
                        Text("How Can I Help?", style: GlobalStyling.title),
                        SizedBox(height: 10.0),
                        HelpButton(
                          helpText: "Not Available. Please check back later",
                          helpButtonLabel: "Donate",
                        ),
                        SizedBox(height: 10.0),
                        HelpButton(
                          helpText: "Not Available. Please check back later",
                          helpButtonLabel: "Volunteer",
                        ),
                        SizedBox(height: 10.0),
                        HelpButton(
                          helpText: "Not Available. Please check back later",
                          helpButtonLabel: "Adopt Pet",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // Nearby Veterinarian
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nearby Veterinary", style: GlobalStyling.title),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                SizedBox(height: 20.0),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: Veterinarians.dummyData.map((vet) {
                    return VeterinaryInfoBox(
                      imagePath: vet.imagePath,
                      name: vet.name,
                      position: vet.position,
                      price: "${vet.price}\$",
                      distance: "${vet.distance}km",
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
