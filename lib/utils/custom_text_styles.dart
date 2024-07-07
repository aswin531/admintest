import 'package:admin_rent/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandStyles {
  static final TextStyle brandText = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryAccent,
    fontFamily: 'YourFontFamily', 
    letterSpacing: 1.2,
    shadows: [
      Shadow(
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.3),
      ),
    ],
  );
}
