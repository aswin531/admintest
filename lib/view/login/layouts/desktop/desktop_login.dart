import 'package:admin_rent/utils/colors.dart';
import 'package:admin_rent/view/login/layouts/desktop/widgets/form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesktopLoginLayout extends StatelessWidget {
  const DesktopLoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.withOpacity(0.09),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue.withOpacity(0.09)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  "assets/images/logo_avatar.png",
                  width: 60.h,
                  height: 60.h,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: VerticalDivider(
              indent: 50.h,
              endIndent: 50.h,
              width: 2,
              thickness: 2,
              color: const Color.fromARGB(255, 220, 223, 224),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  DesktopFormContainer(),
                  SizedBox(height: 16.h),
                  Container(
                    width: 70.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.primaryAccent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.google),
                          color: AppColors.primaryAccent,
                        ),
                        const SizedBox(width: 8),
                        const Flexible(
                          child: Text(
                            "Sign In with Google",
                            style: TextStyle(color: AppColors.primaryAccent),
                            overflow:
                                TextOverflow.ellipsis, // Handles text overflow
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
