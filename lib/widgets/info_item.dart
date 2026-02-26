import 'package:flutter/material.dart';
import '../constants/colors.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kPrimaryColor),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}