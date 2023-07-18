// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/All_calci/bmi_screen.dart';
import 'package:flutter_application_1/Screens/All_calci/result_screen.dart';
import 'package:flutter_application_1/Widgets/my_text_field.dart';

import 'package:flutter_application_1/utils/colors.dart';

import 'dart:math';

enum Gender { Male, Female, other }

class IBW extends StatefulWidget {
  const IBW({super.key});

  @override
  State<IBW> createState() => _IBWState();
}

class _IBWState extends State<IBW> {
  final TextEditingController _heightController = TextEditingController();

  var ideal;

  @override
  void dispose() {
    super.dispose();

    _heightController.dispose();
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
            'Ideal Body Weight',
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
                      idealBodyWeight();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultsPage(
                                    bmiResult: '$ideal kg',
                                    resultText: Text(''),
                                    interpret: 'Your Weight should be:',
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

  idealBodyWeight() {
    int height = int.parse(_heightController.text);
    if (gender == "Male") {
      ideal = height - 100;
    } else if (gender == "Female") {
      ideal = height - 105;
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
