import 'package:flutter/material.dart';
import 'package:pet_care_app/models/veterinarians.dart';
import 'package:pet_care_app/utils/global_colours.dart';
import 'package:pet_care_app/utils/global_styling.dart';

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

class VeterinaryInfoBox extends StatelessWidget {
  final String imagePath;
  final String name;
  final String position;
  final String price;
  final String distance;

  const VeterinaryInfoBox({
    super.key,
    required this.imagePath,
    required this.name,
    required this.position,
    required this.price,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, GlobalColours.lightGreenYellow],
          stops: [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.0,
              child: Image.asset(imagePath, fit: BoxFit.fill),
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                ),
                Text(position),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 203, 169, 156),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.attach_money_rounded,
                          color: const Color.fromARGB(255, 75, 48, 39),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 20.0),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 203, 169, 156),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.location_pin,
                          color: const Color.fromARGB(255, 75, 48, 39),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      distance,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HelpButton extends StatelessWidget {
  final String helpButtonLabel;
  final String helpText;
  const HelpButton({
    super.key,
    required this.helpText,
    required this.helpButtonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(helpText)));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: GlobalColours.lightGreenYellow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Text(
                helpButtonLabel,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: GlobalColours.yellowButton,
              ),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
