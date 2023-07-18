import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi.dart';
import 'package:flutter_application_1/Screens/All_calci/bmr.dart';
import 'package:flutter_application_1/Screens/All_calci/calories.dart';
import 'package:flutter_application_1/Screens/All_calci/fat.dart';
import 'package:flutter_application_1/Screens/All_calci/ibw.dart';

import 'package:flutter_application_1/utils/colors.dart';

class CalciScreen extends StatefulWidget {
  const CalciScreen({super.key});

  @override
  State<CalciScreen> createState() => _CalciScreenState();
}

class _CalciScreenState extends State<CalciScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bodyColor,
        body: SafeArea(
            child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BMI()));
                      },
                      child: Container(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Icon(
                              Icons.monitor_weight_outlined,
                              size: 30.0,
                              color: nActiveCardColor,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'BMI',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 54, 58, 55),
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 10, right: 5, bottom: 10, top: 10),
                      ),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FAT()));
                      },
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Icon(
                                Icons.percent,
                                size: 30.0,
                                color: nActiveCardColor,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Body Fat',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 54, 58, 55),
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(
                              left: 5, right: 5, bottom: 10, top: 10),
                          decoration: BoxDecoration()),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BMR()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Icon(
                              Icons.set_meal,
                              size: 30.0,
                              color: nActiveCardColor,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'BMR',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 54, 58, 55),
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 5, right: 10, bottom: 10, top: 10),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => IBW()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Icon(
                              Icons.line_weight_outlined,
                              size: 30.0,
                              color: nActiveCardColor,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'IBW',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 54, 58, 55),
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 5, right: 5, bottom: 10, top: 10),
                      ),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CAL()));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Icon(
                              Icons.numbers,
                              size: 30.0,
                              color: nActiveCardColor,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Calorie',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 54, 58, 55),
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 5, right: 10, bottom: 10, top: 10),
                      ),
                    )),
                    SizedBox(width: 20),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
