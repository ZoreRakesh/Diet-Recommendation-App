import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Ageslider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/screensize.dart';

class AgeCard extends StatelessWidget {
  final int age;
  final ValueChanged<int>? onChanged;

  TextStyle _titleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  TextStyle _subtitleStyle = TextStyle(
    fontSize: 11.0,
    color: Color.fromRGBO(143, 144, 156, 1.0),
  );

  AgeCard({Key? key, this.age = 50, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Age',
                style: _titleStyle,
              ),
             
            ],
          ),
          Expanded(
            child: Center(
              child: _drawSliderAge(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSliderAge() {
    return AgeBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : AgeSlider(
                  minValue: 30,
                  maxValue: 110,
                  value: age,
                  onChanged: (val) => onChanged!(val),
                  width: constraints.maxWidth,
                );
        },
      ),
    );
  }
}

class AgeBackground extends StatelessWidget {
  final Widget? child;

  const AgeBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: screenAwareSize(80.0, context),
          child: child,
        ),
        SvgPicture.asset(
          "/weight_arrow.svg",
        ),
      ],
    );
  }
}
