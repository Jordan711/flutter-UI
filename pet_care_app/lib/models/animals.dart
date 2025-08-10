import 'package:flutter/material.dart';
import 'package:pet_care_app/utils/global_colours.dart';

enum Animal {
  dog,
  cat,
  bird,
  fish,
}

extension AnimalExtension on Animal {
  String get label {
    switch (this) {
      case Animal.dog:
        return "Dog";
      case Animal.cat:
        return "Cat";
      case Animal.bird:
        return "Bird";
      case Animal.fish:
        return "Fish";
    }
  }
}

class Animals {
  final Animal animalType;
  final String imagePath;
  final String animalName;
  final double distance;
  final double price;
  final Color startColour;
  final Color endColour;

  Animals(this.imagePath, this.animalName, this.distance, this.price, this.startColour, this.endColour, this.animalType);

 static final dummyData = [
  Animals('images/bernese-mountain.png', "Milly", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.dog),
  Animals('images/dog-puppy.png', "Billy", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.dog),
  Animals('images/havanese-dog.png', "Jojo", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.dog),
  Animals('images/maltese-dog.png', "Miku", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.dog),
  Animals('images/feral-cat.png', "Donut", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.cat),
  Animals('images/fried-fish.png', "Freckles", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.fish),
  Animals('images/goldfish.png', "Goldy", 4.0, 40.0, GlobalColours.lightDarkOrange, Colors.white, Animal.fish),
 ] ;
}