// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_application_1/utils/colors.dart';
import 'dart:math';

enum Gender { Male, Female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  var height = 180;
  var weight = 50;
  var age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          width: double.infinity,
          child: Column(
            children: [
              // Expanded(
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             selectedGender = Gender.Male;
              //           });
              //         },
              //         child: Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.male_rounded,
              //                   size: 50.0,
              //                 ),
              //                 SizedBox(
              //                   height: 10.0,
              //                 ),
              //                 Text(
              //                   'Male',
              //                   style: TextStyle(
              //                     fontSize: 16.0,
              //                     color: Color.fromARGB(255, 54, 58, 55),
              //                   ),
              //                 )
              //               ],
              //             ),
              //             margin: EdgeInsets.only(
              //                 left: 10, right: 5, bottom: 10, top: 10),
              //             decoration: BoxDecoration(
              //                 color: selectedGender == Gender.Male
              //                     ? activeCardColor
              //                     : inActiveCardColor,
              //                 borderRadius: BorderRadius.circular(10.0))),
              //       )),
              //       Expanded(
              //           child: GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             selectedGender = Gender.Female;
              //           });
              //         },
              //         child: Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.female_rounded,
              //                   size: 60.0,
              //                 ),
              //                 SizedBox(
              //                   height: 10.0,
              //                 ),
              //                 Text(
              //                   'Female',
              //                   style: TextStyle(
              //                     fontSize: 16.0,
              //                     color: Color.fromARGB(255, 54, 58, 55),
              //                   ),
              //                 )
              //               ],
              //             ),
              //             margin: EdgeInsets.only(
              //                 left: 5, right: 5, bottom: 10, top: 10),
              //             decoration: BoxDecoration(
              //                 color: selectedGender == Gender.Female
              //                     ? activeCardColor
              //                     : inActiveCardColor,
              //                 borderRadius: BorderRadius.circular(10.0))),
              //       )),
              //       Expanded(
              //           child: GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             selectedGender = Gender.other;
              //           });
              //         },
              //         child: Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.transgender_rounded,
              //                   size: 60.0,
              //                 ),
              //                 SizedBox(
              //                   height: 10.0,
              //                 ),
              //                 Text(
              //                   'other',
              //                   style: TextStyle(
              //                     fontSize: 16.0,
              //                     color: Color.fromARGB(255, 54, 58, 55),
              //                   ),
              //                 )
              //               ],
              //             ),
              //             margin: EdgeInsets.only(
              //                 left: 5, right: 10, bottom: 10, top: 10),
              //             decoration: BoxDecoration(
              //                 color: selectedGender == Gender.other
              //                     ? activeCardColor
              //                     : inActiveCardColor,
              //                 borderRadius: BorderRadius.circular(10.0))),
              //       )),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(),
                      flex: 0,
                    ),
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 22, 22, 22),
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 27, 27, 27),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color.fromARGB(255, 209, 209, 209),
                        activeTrackColor: Color.fromARGB(255, 134, 134, 134),
                        thumbColor: Color.fromARGB(255, 21, 235, 92),
                        overlayColor: Color.fromARGB(41, 228, 228, 228),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 243, 243),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )),
              Expanded(
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 22, 22, 22),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  child: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 30) weight--;
                                    });
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Color.fromARGB(255, 192, 194, 204),
                                  constraints: BoxConstraints.tightFor(
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  elevation: 2.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                RawMaterialButton(
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Color.fromARGB(255, 192, 194, 204),
                                  constraints: BoxConstraints.tightFor(
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  elevation: 2.0,
                                ),
                              ],
                            ),
                          ]),
                      margin: EdgeInsets.only(
                          left: 10, right: 5, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 243, 243),
                          borderRadius: BorderRadius.circular(10.0)))),
              //       Expanded(
              //           child: Container(
              //               child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       'AGE',
              //                       style: TextStyle(
              //                         fontSize: 18.0,
              //                         fontWeight: FontWeight.w900,
              //                       ),
              //                     ),
              //                     Text(
              //                       age.toString(),
              //                       style: TextStyle(
              //                         fontSize: 30.0,
              //                         color: Color.fromARGB(255, 22, 22, 22),
              //                       ),
              //                     ),
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                         RawMaterialButton(
              //                           child: Icon(Icons.remove),
              //                           onPressed: () {
              //                             setState(() {
              //                               if (age > 1) age--;
              //                             });
              //                           },
              //                           shape: CircleBorder(),
              //                           fillColor:
              //                               Color.fromARGB(255, 192, 194, 204),
              //                           constraints: BoxConstraints.tightFor(
              //                             width: 30.0,
              //                             height: 30.0,
              //                           ),
              //                           elevation: 2.0,
              //                         ),
              //                         SizedBox(
              //                           width: 10.0,
              //                         ),
              //                         RawMaterialButton(
              //                           child: Icon(Icons.add),
              //                           onPressed: () {
              //                             setState(() {
              //                               age++;
              //                             });
              //                           },
              //                           shape: CircleBorder(),
              //                           fillColor:
              //                               Color.fromARGB(255, 192, 194, 204),
              //                           constraints: BoxConstraints.tightFor(
              //                             width: 30.0,
              //                             height: 30.0,
              //                           ),
              //                           elevation: 2.0,
              //                         ),
              //                       ],
              //                     ),
              //                   ]),
              //               margin: EdgeInsets.only(
              //                   left: 5, right: 10, bottom: 10, top: 10),
              //               decoration: BoxDecoration(
              //                   color: Color.fromARGB(255, 243, 243, 243),
              //                   borderRadius: BorderRadius.circular(10.0)))),
              //     ],
              //   ),
              // ),
              InkWell(
                mouseCursor: MaterialStateMouseCursor.clickable,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ResultPage(
                                bmiResult: '$height',
                                resultText: '$weight',
                                interpret: 'jegdugwugdu',
                              ))));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 122, 255, 126),
                  ),
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'nunito',
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  height: 80,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpret});

  final String bmiResult;
  final String resultText;
  final String interpret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      interpret,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              margin: EdgeInsets.all(15),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 21, 235, 32),
              ),
            ),
          )
        ],
      ),
    );
  }
}
