// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi_screen.dart';
import 'package:flutter_application_1/Screens/All_calci/result_screen.dart';
import 'package:flutter_application_1/Widgets/my_text_field.dart';

import 'package:flutter_application_1/utils/colors.dart';

import 'dart:math';

enum Gender { Male, Female, other }

class FAT extends StatefulWidget {
  const FAT({super.key});

  @override
  State<FAT> createState() => _FATState();
}

class _FATState extends State<FAT> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  dynamic bmi;

  var BFP;

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
  }

  String gender = 'Male';

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
  ];
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
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      BMI();
                      fatCal();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultsPage(
                                    bmiResult: '$BFP%',
                                    resultText: bmi == null
                                        ? bmitext("", primaryColor)
                                        : bmi < 18.5
                                            ? bmitext("Your BMI is UnderWeight",
                                                Color.fromARGB(255, 0, 89, 255))
                                            : bmi > 25
                                                ? bmitext(
                                                    "Your BMI is OverWeight",
                                                    Colors.red)
                                                : bmitext("Your BMI is Normal",
                                                    Colors.green),
                                    interpret: 'Your Body Fat percentage is:',
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

  fatCal() {
    // if (gender=="male") {
    //   bodyFat = (1.20 * bmi) + (0.23 * age) - 16.2;
    // }else if (gender=="female"){
    //    bodyFat = (1.20 * bmi) + (0.23 * age) - 5.4;
    // }
    String a = _ageController.text;
    int age = int.parse(a);

    if (gender == "Male") {
      if (age < 18 && age > 0) {
        BFP = 1.51 * bmi - 0.70 * age - 2.2;
      } else if (age > 18) {
        BFP = 1.20 * bmi + 0.23 * age - 16.2;
      }
    } else if (gender == "Female") {
      if (age < 18 && age > 0) {
        BFP = 1.20 * bmi + 0.23 * age - 5.4;
      } else if (age > 18) {
        BFP = 1.20 * bmi + 0.23 * age - 16.2;
      }
    }
    // print('Your body fat percentage is ${BFP}%');
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
