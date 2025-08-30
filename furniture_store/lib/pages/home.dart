import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/pages/catalogue.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/table-living-room.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.add_box_rounded, color: Colors.white, size: 40),
                  Icon(Icons.ac_unit_rounded, color: Colors.white, size: 40),
                ],
              ),
              Text(
                "Sustainably Crafted,\nBeautifully Designed",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Curated furniture collections made from sustainable materials by expert craftsmen",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              
              Spacer(),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => Catalogue()),
                  );
                },
                child: Center(
                  child: Text(
                    "Explore Collections",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 12.0),
              Center(
                child: RichText(text: TextSpan(children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "Login!",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Login tapped!');
                      }
                  )
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
