import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care_app/pages/dashboard.dart';
import 'package:pet_care_app/utils/global_colours.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: GlobalColours.yellow,
          child: Align(
            alignment: Alignment(0.0, -0.55),
            child: Image.asset("images/dog.png"),
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: GlobalColours.lightYellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Smarter Health Starts Here",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Care is your all-in-one companion for managing wellness with ease",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 93, 93, 93),
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (ctx) => Dashboard()));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      GlobalColours.yellowButton,
                    ),
                    padding: WidgetStateProperty.all(EdgeInsets.all(22)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pets, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        "Get Started",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 9, 9, 9),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
