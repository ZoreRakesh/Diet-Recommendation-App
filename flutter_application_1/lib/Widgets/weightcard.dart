import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/weightslider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/screensize.dart';

class WeightCard extends StatelessWidget {
  final int weight;
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

  WeightCard({Key? key, this.weight = 70, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'WEIGHT',
                style: _titleStyle,
              ),
              Text(
                "KG",
                style: _subtitleStyle,
              )
            ],
          ),
          Expanded(
            child: Center(
              child: _drawSlider(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : WeightSlider(
                  minValue: 30,
                  maxValue: 110,
                  value: weight,
                  onChanged: (val) => onChanged!(val),
                  width: constraints.maxWidth,
                );
        },
      ),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget? child;

  const WeightBackground({Key? key, this.child}) : super(key: key);

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
