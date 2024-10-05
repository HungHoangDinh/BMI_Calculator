import 'package:flutter/material.dart';
import '../constaints.dart';
class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final VoidCallback onpress;
  const ReusableCard({super.key, required this.color,required this.cardChild,required this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onpress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}