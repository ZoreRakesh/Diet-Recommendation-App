import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home_result.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Widgets/weightcard.dart';
import '../Widgets/weightslider.dart';
import '../utils/colors.dart';
import '../utils/screensize.dart';

import 'package:flutter_svg/flutter_svg.dart';

enum Gender { Male, Female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;

  var age = 20;

  var height = 180;
  Gender selectedGender = Gender.Male;
  var gender = 1;
  var weight = 50;
  var activity = 1;
  final decorate = const BoxDecoration(
    color: containerColor,
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xffDDDDDD),
        blurRadius: 2.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 0.0),
      )
    ],
  );

  var breakfast;
  var lunch;
  var dinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: bodyColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: decorate,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'GENDER',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedGender = Gender.Male;
                                                  gender = 1;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.male_sharp,
                                                    size: 40.0,
                                                    color: selectedGender ==
                                                            Gender.Male
                                                        ? activeCardColor
                                                        : inActiveCardColor,
                                                  ),
                                                  SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Text(
                                                    'Male',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: selectedGender ==
                                                              Gender.Male
                                                          ? activeCardColor
                                                          : inActiveCardColor,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedGender =
                                                      Gender.Female;
                                                  gender = 0;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.female_sharp,
                                                    size: 40.0,
                                                    color: selectedGender ==
                                                            Gender.Female
                                                        ? activeCardColor
                                                        : inActiveCardColor,
                                                  ),
                                                  SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Text(
                                                    'Female',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: selectedGender ==
                                                              Gender.Female
                                                          ? activeCardColor
                                                          : inActiveCardColor,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                          ],
                                        )
                                      ]),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: decorate,
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 25),
                                  child: WeightCard(
                                    weight: weight,
                                    onChanged: (val) =>
                                        setState(() => weight = val),
                                  ),
                                ))
                          ],
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'HEIGHT',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RotatedBox(
                                quarterTurns: 3,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    inactiveTrackColor:
                                        Color.fromARGB(95, 133, 190, 228),
                                    activeTrackColor: activeCardColor,
                                    thumbColor: activeCardColor,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 8.0),
                                    overlayShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 8.0),
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
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    height.toString(),
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: activeCardColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    ' cm',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: activeCardColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(left: 10),
                          decoration: decorate,
                        ))
                  ],
                )),
            Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: decorate,
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      age.toString(),
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: activeCardColor,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      ' kg',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: activeCardColor,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    RotatedBox(
                                      quarterTurns: 4,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          inactiveTrackColor:
                                              Color.fromARGB(95, 133, 190, 228),
                                          activeTrackColor: activeCardColor,
                                          thumbColor: activeCardColor,
                                          thumbShape: RoundSliderThumbShape(
                                              enabledThumbRadius: 8.0),
                                          overlayShape: RoundSliderThumbShape(
                                              enabledThumbRadius: 8.0),
                                        ),
                                        child: Slider(
                                          value: age.toDouble(),
                                          min: 0,
                                          max: 100,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              age = newValue.round();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        )),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          decoration: decorate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ACTIVITY',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            activity == 1
                                                ? 'Sedentary'
                                                : activity == 2
                                                    ? "Light"
                                                    : activity == 3
                                                        ? "Moderate"
                                                        : activity == 4
                                                            ? "Active"
                                                            : "VeryActive",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: activeCardColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        activity == 1
                                            ? '(little or no exercise)'
                                            : activity == 2
                                                ? "(exercise 1-3 times/week)"
                                                : activity == 3
                                                    ? "(exercise 4-5 times/week)"
                                                    : activity == 4
                                                        ? "(intense 3-4 times/week)"
                                                        : "(intense 6-7 times/week)",
                                        style: TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        inactiveTrackColor:
                                            Color.fromARGB(95, 133, 193, 228),
                                        activeTrackColor: activeCardColor,
                                        thumbColor: activeCardColor,
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 8.0),
                                        overlayShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 8.0),
                                      ),
                                      child: Container(
                                        width: 90,
                                        child: Slider(
                                          value: activity.toDouble(),
                                          min: 1,
                                          max: 5,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              activity = newValue.round();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    )),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await postdata();
                        final url = 'https://backend-objk.onrender.com/tp';

                        final receive = await http.get(Uri.parse(url));

                        final decoded =
                            json.decode(receive.body) as Map<String, dynamic>;
                        setState(() {
                          breakfast = decoded['breakfast'];
                          lunch = decoded['lunch'];
                          dinner = decoded['dinner'];
                        });
                        if (receive.statusCode == 200) {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeResult(
                                      breakfast: breakfast,
                                      lunch: lunch,
                                      dinner: dinner,
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: const BoxDecoration(
                          color: activeCardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffDDDDDD),
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                        ),
                        child: Center(
                          child: !_isLoading
                              ? const Text(
                                  'Calculate',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                )
                              : const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }

  postdata() async {
    String heigh = height.toString();
    String ag = age.toString();
    String gende = gender.toString();
    String weigh = weight.toString();
    String activ = activity.toString(); //url to send the post request to
    final url = 'https://backend-objk.onrender.com/tp';

    //sending a post request to the url
    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          'height': heigh,
          'age': ag,
          'weight': weigh,
          'gender': gende,
          'activity': activ,
        }));
  }
}
