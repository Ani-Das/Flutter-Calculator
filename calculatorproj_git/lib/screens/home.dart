import 'package:calculatorproj_git/widgets/left_bar.dart';
import 'package:calculatorproj_git/widgets/right_bar.dart';
import 'package:calculatorproj_git/constants/App_constants.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator App",
          style: TextStyle(color: accenthexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainhexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accenthexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accenthexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult >= 24) {
                    _textResult = "You\'re overweight";
                  } else if (_bmiResult >= 18 && _bmiResult < 24) {
                    _textResult = "Normal weight";
                  } else {
                    _textResult = "Underweight";
                  }
                });
              },
              child: Text("Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accenthexColor)),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accenthexColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Normal weight",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accenthexColor),
              ),
            ),
            Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accenthexColor),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            left_bar(barWidth: 70),
            SizedBox(height: 20),
            right_bar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
