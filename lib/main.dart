import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_go/constants.dart';
import 'package:meditation_app_go/screens/details_screen.dart';
import 'package:meditation_app_go/widgets/bottom_nav_bar.dart';
import 'package:meditation_app_go/widgets/category_card.dart';
import 'package:meditation_app_go/widgets/search_bar.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(displayColor: kTextColor),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                    AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Good Mornign \nShishir",
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBar(),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                            title: "Diet Recommendation",
                            svgSrc: "assets/icons/Hamburger.svg",
                            press: () {}),
                        CategoryCard(
                            title: "Kegel Exercises",
                            svgSrc: "assets/icons/Excrecises.svg",
                            press: () {}),
                        CategoryCard(
                            title: "Meditation",
                            svgSrc: "assets/icons/Meditation.svg",
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailScreen();
                                  }));
                            }),
                        CategoryCard(
                            title: "Yoga",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/gym.svg",
            isActive: true,
          ),
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/Settings.svg",
          ),
        ],
      ),
    );
  }
}
