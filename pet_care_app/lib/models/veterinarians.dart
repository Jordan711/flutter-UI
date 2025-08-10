class Veterinarians {
  final String imagePath;
  final String name;
  final String position;

  final double price;
  final double distance;

  Veterinarians({
    required this.imagePath,
    required this.name,
    required this.position,
    required this.price,
    required this.distance,
  });

  static final dummyData = [
    Veterinarians(
      imagePath: "images/icons8-doctor-94.png",
      name: "Dr. Kevin Julio",
      position: "Veterinary Doctor",
      price: 220.0,
      distance: 44.3,
    ),
    Veterinarians(
      imagePath: "images/icons8-doctor-94(1).png",
      name: "Dr. Jacob Jones",
      position: "Veterinary Resident",
      price: 212.0,
      distance: 5.4,
    ),
    Veterinarians(
      imagePath: "images/icons8-doctor-94(2).png",
      name: "Dr. Billy Hendricks",
      position: "Veterinary Professional",
      price: 123.0,
      distance: 44.4,
    ),

    Veterinarians(
      imagePath: "images/icons8-doctor-94(3).png",
      name: "Dr. Dmitri Chen",
      position: "Veterinary Master",
      price: 53.0,
      distance: 7.4,
    ),
  ];
}
