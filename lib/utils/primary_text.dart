import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;

  const PrimaryText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w500,
    this.color = ExternalAppColors.primary,
    this.size = 25,
    this.height = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
