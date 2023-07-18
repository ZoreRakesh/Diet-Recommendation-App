import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tp extends StatefulWidget {
  const Tp({super.key});

  @override
  State<Tp> createState() => _TpState();
}

class _TpState extends State<Tp> {
  String greetings = '';
  bool _validate = false;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _actController = TextEditingController();

  String height = "";
  String activity = "";
  String age = ""; //user's response will be assigned to this variable
  String weight = ""; //user's response will be assigned to this variable
  String gender = ""; //user's response will be assigned to this variable
  //user's response will be assigned to this variable
  String final_response =
      ""; //will be displayed on the screen once we get the data from the server
  final _formkey =
      GlobalKey<FormState>(); //key created to interact with the form

  //function to validate and save user form
  // Future<void> _savingData() async {
  //   final validation = _formkey.currentState?.validate();
  //   if (!validation!) {
  //     return;
  //   }
  //   _formkey.currentState?.save();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  child: Form(
                    // key: _formkey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your AGE: ',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                      controller: _ageController,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your height: ',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                      controller: _heightController,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your weight: ',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                      controller: _weightController,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your gender 1male 0female: ',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                      controller: _genderController,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your activitylevel: ',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                      controller: _actController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () async {
                    setState(() {
                      _heightController.text.isEmpty ||
                              _ageController.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                    _validate ? null : await postdata();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                    child: Icon(Icons.abc_outlined),
                    onPressed: () async {
                      final response = await http.get(
                          Uri.parse('http://backend-objk.onrender.com/tp'));

                      final decoded =
                          json.decode(response.body) as Map<String, dynamic>;
                      setState(() {
                        height = decoded['breakfast'];
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  height,
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  postdata() async {
    height = _heightController.text;
    age = _ageController.text;
    weight = _weightController.text;
    gender = _genderController.text;
    activity = _actController.text;

    _heightController.clear();
    _ageController.clear();
    _weightController.clear();
    _genderController.clear();
    _actController.clear();

    //validating the form and saving it
    // _savingData();

    //url to send the post request to
    final url = 'http://backend-objk.onrender.com/tp';

    //sending a post request to the url
    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          'height': height,
          'age': age,
          'weight': weight,
          'gender': gender,
          'activity': activity,
        }));
  }
}
