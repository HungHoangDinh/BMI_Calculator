import 'package:bmi_caculator_flutter/components/bottom_button.dart';
import 'package:bmi_caculator_flutter/components/reusable_cart.dart';
import 'package:flutter/material.dart';
import '../constaints.dart';
import 'package:bmi_caculator_flutter/calculator_brain.dart';
class ResultsPage extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String bmiContext;
  const ResultsPage({super.key, required this.bmiResult,required this.bmiContext,required this.bmi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text('Your Result',style: titleTextStyle, ),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(color: activeCardColor, cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bmiResult,style: resultTextStyle,),
                Text(bmi,style: bmiTextStyle,),
                Text(bmiContext,style: bodyTextStyle,textAlign: TextAlign.center,)
              ],
            ), onpress:(){}),
          ),
          BottomButton(buttonTitle: "RECALCULATE", onTap: (){
            Navigator.pop(context);
          })
        ],
      )
    );
  }
}
