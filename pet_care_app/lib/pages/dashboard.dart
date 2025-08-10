import 'package:flutter/material.dart';
import 'package:pet_care_app/pages/training_page.dart';
import 'package:pet_care_app/utils/global_colours.dart';
import 'package:pet_care_app/utils/global_styling.dart';
import 'package:pet_care_app/widgets/dashboard/animal_section.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColours.lightOrange,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(40.0),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi Bobson Liu", style: GlobalStyling.title),
                        Text("Good Morning!"),
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
                SizedBox(height: 20.0),

                // Search bar
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //Banner section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => TrainingPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double halfWidth =
                                (constraints.maxWidth - 16) / 2;
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: halfWidth,
                                  child: Text(
                                    "Find Nearest Veterinarian For Your Pet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ), // Optional spacing between the texts
                                SizedBox(
                                  width: halfWidth,
                                  child: Center(
                                    child: Image.asset(
                                      "images/veterinarian-pets.png",
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),

                // Categories section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories", style: GlobalStyling.title),
                    TextButton(onPressed: () {}, child: Text("See All")),
                  ],
                ),
                SizedBox(height: 10.0),
                AnimalSection(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
