import 'package:flutter/material.dart';
import 'package:foodapp/src/constant/colors.dart';
import 'package:foodapp/src/constant/images.dart';
import 'package:foodapp/src/ui/card_widget.dart';
import 'package:foodapp/src/ui/home_page_custom_shape.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 220,
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
                  padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "NewYork, NY",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Koho"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.tune,
                          size: 32,
                          color: Colors.white,
                        ),
                        onPressed: () => print("clicked button"),
                      ),
                    ],
                  ),
                ),
                Positioned(
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 22.0, bottom: 10),
              child: Text(
                "Featured Restaurants",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 20,
              ),
              child: Container(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.image1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardListWidget(
                      image: AppImages.image1[index],
                      foodDetail: "Detail",
                      foodName: "Name",
                      vote: 4.5,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
