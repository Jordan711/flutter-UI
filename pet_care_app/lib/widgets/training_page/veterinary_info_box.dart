import 'package:flutter/material.dart';
import 'package:pet_care_app/utils/global_colours.dart';

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
              width: MediaQuery.of(context).size.width * 0.25,
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
