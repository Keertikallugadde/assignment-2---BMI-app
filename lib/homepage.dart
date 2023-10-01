import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import'resultpage.dart';


class HomePage  extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double?bmi;
  Color?color1;

  void _computeBmi() {
    if (_weightController.text.isEmpty || _heightController.text.isEmpty) {
      setState(() {
        bmi = null;
      });
      return;
    }

    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);

    if (weight == null || height == null) {
      setState(() {
        bmi = null;
      });
      return;
    }

    final bmiValue = weight / ((height / 100) * (height / 100));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(bmi: bmi, color: color1),
      ),
    );


    setState(() {
      bmi = bmiValue;
      if (bmiValue < 17.5) {
        color1 = Colors.red;
      } else if (bmiValue >= 18.5 && bmiValue < 25) {
        color1 = Colors.black;
      } else if (bmiValue >= 25 && bmiValue < 30) {
        color1 = Colors.orange;
      } else if (bmiValue >= 30) {
        color1 = Colors.red;
      }
      });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xff800080),
      appBar: AppBar(
        title:Text(
          "BMIapp",
          style:GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )
          ),
        )
      ),
      body:Center(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50
            ),
            Container(
              height:220,
              width:350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color:Colors.amber,
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    "Enter weighth(kgs)",
                    style:GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize:25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    color: Colors.white.withOpacity(0.8),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText:"Enter weight",
                      ),


                    ),
                  ),
                ],
              ),


            ),
            SizedBox(
              height:30
            ),
            Container(
              height:220,
              width:350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                color:Colors.amber,),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter height(cms)",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:Colors.black),
                    ),
                  ),
                  Container(
                    width: 250,
                    color: Colors.white.withOpacity(0.8),
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText:"Enter height",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed:_computeBmi,


                child: Padding(
                  padding: const EdgeInsets.only(
                    left:12.0, right: 12.0, top: 8.0, bottom: 8.0),
                  child: Text(
                    "Compute"),




                ),


              ),
              SizedBox(
                child: Text(
                  bmi != null ? "BMI: ${bmi!.toStringAsFixed(2)}" : "",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color1?? Colors.black,

                  ),
                ),
              ),












          ],

        ),
      ),
    );
  }
}
