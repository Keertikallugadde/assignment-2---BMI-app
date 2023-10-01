import 'package:flutter/material.dart';


class ResultPage extends StatelessWidget {
  final double? bmi;
  final Color? color;

  ResultPage({this.bmi, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bmi != null ? "BMI: ${bmi!.toStringAsFixed(2)}" : "",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color ?? Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
