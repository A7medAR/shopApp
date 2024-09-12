import 'package:flutter/material.dart';

class BMI_Result extends StatelessWidget {
final int result;
final bool isMale;
final int age;

BMI_Result({
  required this.result,
  required this.isMale,
  required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI RESULT',
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
          ), onPressed: () { Navigator.pop(context); },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender:${
              isMale? 'Male' :'Female'
              }',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Reuslt : $result',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'AGE : $age',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
