import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi_screen.dart';

import 'package:flutter_application_1/Screens/calcii_screen.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Screens/log_and_signup/login_screen.dart';
import 'package:flutter_application_1/Screens/profile.dart';

import 'package:flutter_application_1/Screens/tracker_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;

  List<Widget> homeScreenItems = [
    const Home(),
    const CalciScreen(),
    const profileScreen(),
  ];

  void navigationTapped(value) {
    //Animating Page
    setState(() {
      _page = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: containerColor,
        title: Image(
          image: AssetImage('/newlogo2.png'),
          width: 150,
          fit: BoxFit.contain,
        ),
        // actions: <Widget>[
        //   GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const profileScreen()));
        //       },
        // child: Container(
        //   padding: EdgeInsets.only(right: 15),
        //   child: Icon(
        //     Icons.person,
        //     color: Colors.black,
        //   ),
        // )),
      ),
      body: homeScreenItems[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.5,
        onTap: navigationTapped,
        currentIndex: _page,
        backgroundColor: mobileBackgroundColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: (_page == 0) ? activeCardColor : inActiveCardColor,
            ),
            label: 'HOME',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: (_page == 1) ? activeCardColor : inActiveCardColor,
              ),
              label: 'CALCI',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 2) ? activeCardColor : inActiveCardColor,
            ),
            label: 'PROFILE',
            backgroundColor: containerColor,
          ),
        ],
      ),
    );
  }
}
