import 'package:admin_rent/controllers/providers/firebase/auth/auth_provider.dart';
import 'package:admin_rent/utils/auth_buttons.dart';
import 'package:admin_rent/utils/colors.dart';
import 'package:admin_rent/utils/custom_text_forms_fields.dart';
import 'package:admin_rent/utils/validation.dart';
import 'package:admin_rent/view/addcar/addcar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileFormWidget extends StatelessWidget {
  MobileFormWidget({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthProviders authSignIn = AuthProviders();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppColors.primaryAccent.withOpacity(0.5), width: 2),
              color: AppColors.primaryAccent.withOpacity(0.1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryAccent.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: 100.w,
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StyledTextFormField(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.primaryAccent, width: 2)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: AppColors.primaryAccent),
                  ),
                  labelText: "Enter your Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                StyledTextFormField(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: AppColors.primaryAccent, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: AppColors.primaryAccent),
                  ),
                  labelText: "Enter your Password",
                  controller: passwordController,
                  onSaved: (value) {
                    formKey.currentState!.save();
                  },
                  isPasswordField: true,
                  validator: (value) => CustomValidator.validatePassword(value),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16.h),
                StyledButton(
                  backgroundColor: AppColors.primaryAccent,
                  text: "Login",
                  onPressed: () => signIn(context, authSignIn),
                ),
                if (authSignIn.isLoading) const CircularProgressIndicator(),
              ],
            ),
          ),
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
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void signIn(BuildContext context, AuthProviders authSignIn) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    User? user = await authSignIn.signin(context, email, password);
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-in failed')),
      );
    }
  }
}
