import 'dart:ffi';
import 'results.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reusable_cart.dart';
import '../constaints.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_caculator_flutter/calculator_brain.dart';
enum Gender{
  male, female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender=Gender.male;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    color: selectedGender==Gender.male?activeCardColor:inactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: (){setState(() {
                      selectedGender=Gender.female;
                    });},
                    color: selectedGender==Gender.female?activeCardColor:inactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("HEIGHT",style: labelTextStyle,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    Text(height.toString(),
                    style: numberTextStyle,),
                    Text("cm",style: labelTextStyle,)
                  ],),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTickMarkColor: Colors.white,
                        thumbColor: Color(0xFFEB1555), // Pink color
                        overlayColor: Color(0x1fEB1555), // Pink color with opacity
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8DE98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),],
                ), onpress:(){}), // chỉ cần một Expanded
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT",style: labelTextStyle,),
                          Text(weight.toString(),style: numberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),

                              SizedBox(width: 10,),
                               RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },),

                            ],
                          )
                        ],
                      )
                      , onpress: (){}),
                ),
                Expanded(
                  child: ReusableCard(color: activeCardColor, cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",style: labelTextStyle,),
                      Text(age.toString(),style: numberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),

                          SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                        ],
                      )
                    ],
                  ), onpress: (){}),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: "CALCULATE", onTap: (){
            CalculatorBrain cal= CalculatorBrain(height:height.toDouble(), weight: weight.toDouble());
            String bmi=cal.calculatorBMI();
            Navigator.push(context, MaterialPageRoute(builder: (context){

              return  ResultsPage( bmi: bmi,bmiResult: cal.getResult(), bmiContext: cal.getInterpretation());
            }));
          } ),
        ],
      ),
    );
  }
}




