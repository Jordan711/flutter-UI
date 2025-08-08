import 'package:flutter/material.dart';
import 'package:pet_care_app/utils/global_colours.dart';

class Animals {
  final String animalType;
  final String imagePath;
  final String animalName;
  final double distance;
  final double price;
  final Color startColour;
  final Color endColour;

  Animals(this.imagePath, this.animalName, this.distance, this.price, this.startColour, this.endColour, this.animalType);

 static final dummyData = [
  Animals('images/bernese-mountain.png', "Dog", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, "DOG"),
  Animals('images/dog-puppy.png', "Dog", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, "DOG"),
  Animals('images/havanese-dog.png', "Dog", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, "DOG"),
  Animals('images/maltese-dog.png', "Dog", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, "DOG"),
  Animals('images/feral-cat.png', "Cat", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, "CAT"),
 ] ;
}