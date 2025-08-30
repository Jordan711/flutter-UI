import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/pages/catalogue.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/table-living-room.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(32.0),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0.0, 0.0),
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineButtons(),

                  SizedBox(height: 20.0),

                  Row(
                    children: [
                      Icon(
                        Icons.add_box_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      Icon(
                        Icons.ac_unit_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
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
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),

                  Spacer(),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => Catalogue()),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 50, 50, 50),
                            Colors.black,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Explore Collections",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.0),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Login tapped!');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineButtons extends StatefulWidget {
  const LineButtons({super.key});

  @override
  State<LineButtons> createState() => _LineButtonsState();
}

class _LineButtonsState extends State<LineButtons> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (index) {
        return Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              height: 5,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: selected == index ? Colors.white : Colors.grey,
              ),
            ),
          ),
        );
      }),
    );
  }
}
