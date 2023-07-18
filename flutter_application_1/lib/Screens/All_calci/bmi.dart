// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi_screen.dart';
import 'package:flutter_application_1/Screens/All_calci/result_screen.dart';
import 'package:flutter_application_1/Widgets/my_text_field.dart';

import 'package:flutter_application_1/utils/colors.dart';

import 'dart:math';

enum Gender { Male, Female, other }

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  dynamic bmi;

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _heightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: containerColor,
          title: Text(
            'BMI',
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
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      BMI();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultsPage(
                                    bmiResult: '$bmi',
                                    resultText: bmi == null
                                        ? bmitext("", primaryColor)
                                        : bmi < 18.5
                                            ? bmitext("UnderWeight",
                                                Color.fromARGB(255, 0, 89, 255))
                                            : bmi > 25
                                                ? bmitext(
                                                    "OverWeight", Colors.red)
                                                : bmitext(
                                                    "Normal", Colors.green),
                                    interpret: 'Your BMI is:',
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

  void BMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);

    double heightc = height / 100;
    double heightSquare = (heightc * heightc);
    double result = weight / (heightSquare);
    bmi = result.toInt();
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
