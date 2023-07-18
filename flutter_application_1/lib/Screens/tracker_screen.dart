import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import 'package:flutter_application_1/Widgets/text_field_input.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({Key? key}) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  late DatabaseReference? dbRef;
  Query dbfetch = FirebaseDatabase.instance.ref().child('breakfast');
  var isdrop = true;
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('breakfast');

  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _carbController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  dynamic _result;

  @override
  void dispose() {
    super.dispose();
    _foodController.dispose();
    _caloriesController.dispose();
    _fatController.dispose();
    _proteinController.dispose();
    _carbController.dispose();
  }

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('breakfast');
  }

  void clearall() {
    _foodController.clear();
    _caloriesController.clear();
    _fatController.clear();
    _carbController.clear();
    _proteinController.clear();
  }

  Widget ListItem({required Map breakfast}) {
    var p = breakfast['protein'];
    var c = breakfast['carbs'];
    var f = breakfast['fat'];

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(126, 255, 154, 0.315),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 0.0,
                              maxWidth: 100,
                            ),
                            child: Text(
                              breakfast['food'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Text(
                            ' - ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            breakfast['calories'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'P-$p | C-$c | F-$f',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  // delete
                  InkWell(
                    child: Icon(
                      Icons.delete_outline_rounded,
                      size: 15,
                    ),
                    onTap: () {
                      reference.child(breakfast['key']).remove();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breakfast",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    isdrop
                        ? InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              size: 20,
                            ),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onTap: () {
                              setState(() {
                                isdrop = false;
                              });
                            },
                          )
                        : InkWell(
                            child: Icon(
                              Icons.arrow_drop_down,
                            ),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onTap: () {
                              setState(() {
                                isdrop = true;
                              });
                            },
                          )
                  ],
                ),
              ),
              isdrop
                  ? Container(
                      child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              // <-- SEE HERE
                              width: 170,
                              height: 35,
                              child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: _foodController,
                                  decoration: InputDecoration(
                                    label: Text('food'),
                                    contentPadding:
                                        EdgeInsets.only(top: 10.0, left: 10.0),
                                    border: OutlineInputBorder(),
                                  ))),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              // <-- SEE HERE
                              width: 100,
                              height: 35,
                              child: TextField(
                                  controller: _caloriesController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    label: Text('Calories'),
                                    contentPadding:
                                        EdgeInsets.only(top: 10.0, left: 10.0),
                                    border: OutlineInputBorder(),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              // <-- SEE HERE
                              width: 70,
                              height: 35,
                              child: TextField(
                                  controller: _proteinController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    label: Text('Protein'),
                                    contentPadding:
                                        EdgeInsets.only(top: 10.0, left: 10.0),
                                    border: OutlineInputBorder(),
                                  ))),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              // <-- SEE HERE
                              width: 70,
                              height: 35,
                              child: TextField(
                                  controller: _carbController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    label: Text('Carbs'),
                                    contentPadding:
                                        EdgeInsets.only(top: 10.0, left: 10.0),
                                    border: OutlineInputBorder(),
                                  ))),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              // <-- SEE HERE
                              width: 70,
                              height: 35,
                              child: TextField(
                                  controller: _fatController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    label: Text('Fats'),
                                    contentPadding:
                                        EdgeInsets.only(top: 10.0, left: 10.0),
                                    border: OutlineInputBorder(),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              upload();
                            },
                            child: Container(
                              child: Text('ADD'),
                              width: 90,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                color: Color.fromRGBO(117, 236, 143, 0.678),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        child: FirebaseAnimatedList(
                          query: dbfetch,
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index) {
                            Map breakfast = snapshot.value as Map;
                            breakfast['Key'] = snapshot.key;
                            return ListItem(breakfast: breakfast);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]))
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dinner",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      child: Icon(Icons.add),
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  upload() async {
    try {
      setState(() {
        if (_caloriesController.text == null &&
            _foodController.text == null &&
            _fatController.text == null &&
            _carbController.text == null &&
            _proteinController.text == null) {
          print('rerror');
        } else {
          Map<String, String> breakfast = {
            'food': _foodController.text,
            'carbs': _carbController.text,
            'calories': _caloriesController.text,
            'fat': _fatController.text,
            'protein': _proteinController.text
          };
          dbRef!.push().set(breakfast);
          clearall();
        }
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}


//                  SizedBox(
//                         // <-- SEE HERE
//                         width: 50,
//                         height: 30,
//                         child: TextField(
//                             decoration: InputDecoration(
//                           hintText: 'food',
//                           contentPadding:
//                               EdgeInsets.only(top: 10.0, left: 10.0),
//                           border: OutlineInputBorder(),
//                         ))),
