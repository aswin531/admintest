import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double? width;
  final double height;
  final double elevation;

  const StyledButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white,
      this.fontSize = 10,
      this.horizontalPadding = 16,
      this.verticalPadding = 16,
      this.borderRadius = 15,
      this.elevation = 5,
      this.height = 50,
      this.width = 240});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
          elevation: WidgetStateProperty.all<double>(elevation),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(fontSize),
                color: textColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade, // Adjust overflow handling as needed
            ),
          ),
        ),
      ),
    );
  }
}
