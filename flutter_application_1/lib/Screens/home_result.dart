import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class HomeResult extends StatefulWidget {
  final breakfast;
  final lunch;
  final dinner;

  const HomeResult({Key? key, required this.breakfast, this.lunch, this.dinner})
      : super(key: key);

  @override
  State<HomeResult> createState() => _HomeResultState();
}

class _HomeResultState extends State<HomeResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YOUR DIET',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: containerColor,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: bodyColor,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Your Diet should be : ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(this.widget.breakfast,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(this.widget.lunch,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(this.widget.dinner,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
