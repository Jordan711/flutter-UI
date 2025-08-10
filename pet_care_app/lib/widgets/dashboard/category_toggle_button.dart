import 'package:flutter/material.dart';
import 'package:pet_care_app/models/animals.dart';
import 'package:pet_care_app/utils/global_colours.dart';


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
