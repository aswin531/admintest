import 'package:admin_rent/controllers/providers/firebase/auth/auth_provider.dart';
import 'package:admin_rent/view/dashboard/dashboard.dart';
import 'package:admin_rent/view/login/layouts/mobile/mobile_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileLoginLayout extends StatelessWidget {
  const MobileLoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AuthProviders>(context).isUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          bool isLoggedIn = snapshot.data ?? false;

          // Redirect to home page if user is already logged in
          if (isLoggedIn) {
            return  DashBoardPage();
          }

          return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.lightBlue.withOpacity(0.09),
                body: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.transparent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset("assets/images/logo_avatar.png")),
                  ),
                  MobileFormWidget(),
                  
                ])),
          );
        }
      },
    );
  }
}
