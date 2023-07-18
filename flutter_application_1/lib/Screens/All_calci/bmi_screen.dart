import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/log_and_signup/login_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';

import 'package:flutter_svg/svg.dart';

import 'package:flutter_application_1/Widgets/text_field_input.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  dynamic _result;

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _resultController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Text(
              "BMI",
              style: TextStyle(
                  fontSize: 23, color: blueColor, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 44),
            TextFieldInput(
              hintText: "enter your Weight(in kg)",
              textInputType: TextInputType.numberWithOptions(decimal: true),
              textEditingController: _weightController,
            ),
            const SizedBox(
              height: 24,
            ),

            TextFieldInput(
              hintText: "enter your height(in cm)",
              textInputType: TextInputType.numberWithOptions(decimal: true),
              textEditingController: _heightController,
            ),
            const SizedBox(
              height: 24,
            ),

            InkWell(
              mouseCursor: MaterialStateMouseCursor.clickable,
              onTap: () {
                calculateBMI();
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: mobileBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 9),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),

            //   TextFieldInput(
            // hintText: "Result will be here",
            // textInputType: TextInputType.number,
            // textEditingController: _resultController,
            // ),
            Text(
              _result == null ? "" : "${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              child: _result == null
                  ? bmitext("", primaryColor)
                  : _result < 18.5
                      ? bmitext("UnderWeight", Colors.yellow)
                      : _result > 25
                          ? bmitext("OverWeight", Colors.red)
                          : bmitext("Normal", Colors.green),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            )
          ],
        ),
      ),
    ));
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;

    setState(() {});
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
