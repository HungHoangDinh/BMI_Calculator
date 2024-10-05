import 'package:flutter/material.dart';
import '../constaints.dart';
class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final  VoidCallback onTap;
  BottomButton({required this.buttonTitle,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: lagerButtonTextStyle,)),
        color: bottomContainerColor,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10),
        height: bottomContainerHeight,
      ),
    );
  }
}