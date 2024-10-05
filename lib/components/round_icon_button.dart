import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RoundIconButton({required this.icon,required this.onPressed});
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(onPressed:onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56,height: 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xff4c4f5e),);

  }
}