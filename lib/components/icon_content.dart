import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon,required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 80,),
        SizedBox(height: 15,),
        Text(label,style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98)),)
      ],
    );
  }
}