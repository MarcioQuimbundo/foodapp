import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/src/constant/colors.dart';
import 'package:foodapp/src/constant/images.dart';
import 'package:foodapp/src/ui/card_more_widget.dart';
import 'package:foodapp/src/ui/card_widget.dart';
import 'package:foodapp/src/ui/home_page_custom_shape.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String _selectedLocation = "Istanbul, TR";

  List<String> _location = ["Newyork, NY", "Dubai", "Istanbul, TR"];

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: AppColors.orangeColor,
        child: Icon(Icons.work),
        onPressed: () => null,
      ),
      bottomNavigationBar:
          BottomNavigationBar(fixedColor: AppColors.orangeColor, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("Home"),
        ),
      ]),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: Platform.isIOS ? 250 : 150,
                    width: _media.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.orangeColor,
                          AppColors.orangeLightColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _selectedLocation,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.caretDown,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                          iconSize: 0,
                          items: _location.map((location) {
                            return DropdownMenuItem<String>(
                                value: location,
                                child: Text(
                                  location,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20),
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                              print(_selectedLocation);
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.tune,
                          size: 28,
                          color: Colors.white,
                        ),
                        onPressed: () => print("clicked button"),
                      ),
                    ],
                  ),
                ),
                buildPositionedButtons()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 22.0, bottom: 10),
              child: Text(
                "Featured Restaurants",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.image1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardListWidget(
                      image: AppImages.image1[index],
                      foodDetail: "Desert - Fast Food - Alcohol",
                      foodName: "Cafe De Perks",
                      vote: 4.5,
                      foodTime: "15-30 min",
                    );
                  },
                ),
              ),
            ),
            Container(
              color: AppColors.greyColor.shade200,
              height: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 22.0, bottom: 10),
              child: Text(
                "More Restaurants",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CardMoreWidget(
              image: AppImages.image1[1],
              foodDetail: "Desert - Fast Food - Alcohol",
              foodName: "Cafe De Perks",
              vote: 4.5,
              foodTime: "15-30 min",
            ),
            CardMoreWidget(
              image: AppImages.image1[0],
              foodDetail: "Desert - Fast Food - Alcohol",
              foodName: "Cafe De Perks",
              vote: 4.5,
              foodTime: "15-30 min",
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildPositionedButtons() {
    return Positioned(
      bottom: 10,
      left: 60,
      right: 60,
      child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 8,
                spreadRadius: 1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => print("Listview tapped"),
                child: Text(
                  "List View",
                  style: TextStyle(
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              GestureDetector(
                onTap: () => print("Map View tapped"),
                child: Text(
                  "Map View",
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
