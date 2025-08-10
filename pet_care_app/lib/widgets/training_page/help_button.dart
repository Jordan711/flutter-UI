import 'package:flutter/material.dart';
import 'package:pet_care_app/utils/global_colours.dart';

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
