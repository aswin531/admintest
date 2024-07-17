// import 'package:admin_rent/controllers/firebase/auth/auth_provider.dart';
// import 'package:admin_rent/utils/auth_buttons.dart';
// import 'package:admin_rent/utils/custom_text_forms_fields.dart';
// import 'package:admin_rent/utils/validation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class SignupFormWidget extends StatelessWidget {
//   final __formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   SignupFormWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: __formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             StyledTextFormField(
//               labelText: "Email",
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress,
//               validator: (value) => CustomValidator.validateEmail(value),
//               onSaved: (value) {
//                 __formKey.currentState!.save();
//               },
//             ),
//             SizedBox(height: 10.0.h),
//             StyledTextFormField(
//               labelText: "Password",
//               controller: _passwordController,
//               keyboardType: TextInputType.text,
//               validator: (value) => CustomValidator.validatePassword(value),
//               isPasswordField: true,
//               onSaved: (value) {
//                 __formKey.currentState!.save();
//               },
//             ),
//             SizedBox(height: 10.0.h),
//             StyledTextFormField(
//               labelText: "Confirm Password",
//               controller: _confirmPasswordController,
//               keyboardType: TextInputType.text,
//               validator: (value) {
//                 CustomValidator.validatePassword(value);
//                 if (value != _passwordController.text) {
//                   return 'Passwords do not match.';
//                 }
//                 return null;
//               },
//               isPasswordField: true,
//               onSaved: (value) {
//                 __formKey.currentState!.save();
//               },
//             ),
//             SizedBox(height: 10.0.h),
//             Consumer<AuthProviders>(builder: (context, AuthProviders, _) {
//               if (AuthProviders.isLoading) {
//                 return const CircularProgressIndicator();
//               } else {
//                 return StyledButton(
//                     text: "Sign Up",
//                     onPressed: () async {
//                       // if (__formKey.currentState!.validate()) {
//                       //   await context.read<AuthProviders>().signup(
//                       //       context,
//                       //       _emailController.text.trim(),
//                       //       _passwordController.text.trim());
//                       // }
//                     });
//               }
//             })
//           ],
//         ));
//   }
// }
