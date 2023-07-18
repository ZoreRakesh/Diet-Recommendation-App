// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi_screen.dart';
import 'package:flutter_application_1/Screens/All_calci/result_screen.dart';
import 'package:flutter_application_1/Widgets/my_text_field.dart';

import 'package:flutter_application_1/utils/colors.dart';

import 'dart:math';

enum Gender { Male, Female, other }

class CAL extends StatefulWidget {
  const CAL({super.key});

  @override
  State<CAL> createState() => _CALState();
}

class _CALState extends State<CAL> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  dynamic bmi;

  var bmr;
  var calories;
  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
  }

  String activityLevel = 'Beginner';
  String gender = 'Male';
  String target = 'Gain';

  // List of items in our dropdown menu
  var item = [
    'Male',
    'Female',
  ];
  var it = ['Gain', 'Loss'];

  // List of items in our dropdown menu
  var items = ['Beginner', 'Intermediate', 'Advance'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: containerColor,
          title: Text(
            'Fat',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                width: double.infinity,
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: BoxDecoration(
                        color: bodyColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton(
                      // Initial Value
                      value: gender,

                      // Array list of items
                      items: item.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    hintText: "Weight(kg)",
                    inputType: TextInputType.number,
                    controller: _weightController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    hintText: "Height(cm)",
                    inputType: TextInputType.number,
                    controller: _heightController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    hintText: "Age",
                    inputType: TextInputType.number,
                    controller: _ageController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: BoxDecoration(
                        color: bodyColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton(
                      // Initial Value
                      value: activityLevel,

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          activityLevel = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: BoxDecoration(
                        color: bodyColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton(
                      // Initial Value
                      value: target,

                      // Array list of items
                      items: it.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          target = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      BMR();
                      Calorie();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultsPage(
                                    bmiResult: '$calories ',
                                    resultText: Text(''),
                                    interpret:
                                        'Your Calories consumption should be:',
                                  ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: activeCardColor,
                      ),
                      child: Center(
                        child: Text(
                          'CALCULATE',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'nunito',
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 10.0),
                      height: 50,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]))));
  }

  int BMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);

    double heightc = height / 100;
    double heightSquare = (heightc * heightc);
    double result = weight / (heightSquare);
    bmi = result.toInt();
    return bmi;
  }

  BMR() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    double age = double.parse(_ageController.text);
    double bm;

    double caloriesRequiredForBMR = (weight * 10) + (6.25 * height) - (5 * age);
    if (gender == "male") {
      bm = caloriesRequiredForBMR + 5;
    } else {
      bm = caloriesRequiredForBMR - 116;
    }
    bmr = bm.toInt();
  }

  Calorie() {
    var level;
    if (activityLevel == "Beginner") {
      level = 1.3;
    } else if (activityLevel == "Intermediate") {
      level = 1.5;
    } else if (activityLevel == "Advance") {
      level = 1.7;
    }
    // to calculate required calories on the daily basis
    double requiredCal = bmr * level;

    // Target to gain the calories
    if (target == "Gain") {
      calories = requiredCal + 500;
    }
    // target to loss calories
    else if (target == "Loss") {
      calories = requiredCal - 500;
    }
  }

  bmitext(text, color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
