import 'package:admin_rent/controllers/providers/firebase/password_visibility_provider.dart';
import 'package:admin_rent/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StyledTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPasswordField;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final InputBorder? border;
  final InputBorder? focusedBorder;

  const StyledTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPasswordField = false,
    required this.keyboardType,
    this.validator,
    this.onSaved,
    this.border,
    this.focusedBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityProvider>(
      builder: (context, visibilityProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: true,
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              focusColor: Colors.blue,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              suffixIcon: isPasswordField
                  ? IconButton(
                      onPressed: () {
                        visibilityProvider.toggleVisibility();
                      },
                      icon: Icon(visibilityProvider.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )
                  : null,
              labelText: labelText,
              labelStyle:
                  const TextStyle(fontSize: 20, color: AppColors.primaryAccent),
              focusedBorder: focusedBorder ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryAccent),
                  ),
              enabledBorder: border ??
                  const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.border)),
            ),
            obscureText:
                isPasswordField ? visibilityProvider.obscureText : false,
          ),
        );
      },
    );
  }
}
