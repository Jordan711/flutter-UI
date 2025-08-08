import 'package:flutter/material.dart';
import 'package:pet_care_app/utils/global_colours.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColours.lightOrange,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 40.0, right: 40.0),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                        Text("Beginner's Training"),
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
                        Text("How Can I Help?"),
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
            
                // Nearby Vetinarian
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nearby Veterinary", style: TextStyle(fontSize: 23.0)),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                VeterinaryInfoBox(
                  imagePath: "images/icons8-doctor-94.png",
                  name: "Dr. Kevin Julio",
                  position: "Veterinary Doctor",
                  price: "\$140",
                  distance: "1.4 KM",
                  startColour: GlobalColours.nearWhite,
                  endColour: GlobalColours.lightGreenYellow,
                ),
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
  final Color startColour;
  final Color endColour;

  const VeterinaryInfoBox({
    super.key,
    required this.imagePath,
    required this.name,
    required this.position,
    required this.price,
    required this.distance,
    required this.startColour,
    required this.endColour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColour, endColour],
          stops: [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Row(
          /*

Row(
  children: [
    Spacer(flex: 1),
    Icon(Icons.star),
    Spacer(flex: 2), // More space
    Icon(Icons.favorite),
    Spacer(flex: 1),
  ],
)
          */
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 100.0, child: Image.asset(imagePath)),
            SizedBox(width: 50.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(position),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.attach_money_rounded),
                    Text(price),

                    Icon(Icons.location_pin),
                    Text(distance),
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
            Text(helpButtonLabel),
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
