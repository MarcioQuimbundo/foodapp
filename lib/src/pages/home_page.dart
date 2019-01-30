import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/src/constant/colors.dart';
import 'package:foodapp/src/constant/images.dart';
import 'package:foodapp/src/ui/card_more_widget.dart';
import 'package:foodapp/src/ui/card_widget.dart';
import 'package:foodapp/src/ui/home_page_custom_shape.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  GoogleMapController _mapController;
  int _tabbarIndex = 0;
  String _selectedLocation = "Istanbul, TR";
  bool selectedColor = true;

  List<String> _location = ["Newyork, NY", "Dubai", "Istanbul, TR"];
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _tabbarIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: _media.width,
                height: _media.height,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Stack(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            buildHeaderStack(_media),
                            buildHomeMainContainer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                width: _media.width,
                height: _media.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: _media.height,
                      width: double.infinity,
                      child: GoogleMap(
                        compassEnabled: true,
                        initialCameraPosition: CameraPosition(
                            bearing: 10,
                            zoom: 15,
                            target:
                                LatLng(41.054501963290505, 28.899536132812504)),
                        onMapCreated: (controller) {
                          setState(() {
                            _mapController = controller;
                          });
                        },
                      ),
                    ),
                    Container(
                      child: Positioned(
                        width: _media.width,
                        height: 280,
                        bottom: 0,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _mapController == null
                                    ? null
                                    : _mapController.addMarker(
                                        MarkerOptions(
                                          draggable: true,
                                          position: LatLng(
                                            41.08738144641038,
                                            28.788369297981262,
                                          ),
                                          infoWindowText: InfoWindowText(
                                              "Deneme Restaurant", "Good food"),
                                        ),
                                      );
                                _mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(
                                        41.08738144641038,
                                        28.788369297981262,
                                      ),
                                      zoom: 15.0,
                                      tilt: 60.0,
                                      bearing: 160,
                                    ),
                                  ),
                                );
                                print("tpped");
                              },
                              child: CardListWidget(
                                foodDetail: "Desert - Fast Food - Alcohol",
                                foodName: "Cafe De Perks",
                                vote: 4.5,
                                foodTime: "15-30 min",
                                image: AppImages.image1[0],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _mapController == null
                                    ? null
                                    : _mapController.addMarker(
                                        MarkerOptions(
                                          draggable: true,
                                          position: LatLng(
                                            41.05612003462361,
                                            28.72148036956787,
                                          ),
                                          infoWindowText: InfoWindowText(
                                              "Deneme Restaurant", "Good food"),
                                        ),
                                      );
                                _mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(
                                        41.05612003462361,
                                        28.72148036956787,
                                      ),
                                      zoom: 15.0,
                                      tilt: 80.0,
                                      bearing: 160,
                                    ),
                                  ),
                                );
                                print("tpped");
                              },
                              child: CardListWidget(
                                foodDetail: "Desert - Fast Food - Alcohol",
                                foodName: "Cafe De Istanbul",
                                vote: 4.5,
                                foodTime: "15-60 min",
                                image: AppImages.image1[1],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildHeaderStack(_media),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack buildHeaderStack(Size _media) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: Platform.isIOS ? 200 : 150,
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
          padding: Platform.isAndroid
              ? EdgeInsets.only(left: 20, top: 30, right: 10)
              : EdgeInsets.only(left: 20, top: 50, right: 10),
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
                          style: TextStyle(color: Colors.black54, fontSize: 20),
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
        buildPositionedButtons(),
      ],
    );
  }

  Container buildHomeMainContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 22.0, bottom: 10),
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
            foodName: "Cafe De Ankara",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "CLOSE",
            statusColor: Colors.pinkAccent,
          ),
          CardMoreWidget(
            image: AppImages.image1[0],
            foodDetail: "Desert - Fast Food - Alcohol",
            foodName: "Cafe De NewYork",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      elevation: 10,
      backgroundColor: AppColors.orangeColor,
      onPressed: () => null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Icon(
          IconData(0xe800, fontFamily: "Icons"),
          size: 32,
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return SafeArea(
      child: TabBar(
          labelColor: AppColors.orangeColor,
          unselectedLabelColor: AppColors.blackColor.withOpacity(0.55),
          indicatorColor: AppColors.orangeColor,
          indicatorWeight: 3,
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.only(bottom: 46),
              borderSide: BorderSide(color: AppColors.orangeColor, width: 3)),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.binoculars),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.shoppingCart),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.userAlt),
            ),
          ]),
    );
  }

  Positioned buildPositionedButtons() {
    return Positioned(
      bottom: 10,
      left: 40,
      right: 40,
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
                onTap: () {
                  if (_pageController.page.abs() != 0) {
                    _pageController.jumpToPage(0);
                    setState(() {
                      selectedColor = true;
                    });
                  } else {
                    selectedColor = false;
                  }
                },
                child: Text(
                  "List View",
                  style: TextStyle(
                    color: selectedColor
                        ? AppColors.orangeColor
                        : AppColors.greyColor,
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
                onTap: () {
                  if (_pageController.page.abs() != 1) {
                    _pageController.jumpToPage(1);
                    setState(() {
                      selectedColor = false;
                    });
                  } else {
                    selectedColor = true;
                  }
                },
                child: Text(
                  "Map View",
                  style: TextStyle(
                    color: selectedColor
                        ? AppColors.greyColor
                        : AppColors.orangeColor,
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
