import 'package:admin_rent/controllers/calender/calender_provider.dart';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/controllers/providers/car/carfilter_provider.dart';
import 'package:admin_rent/controllers/providers/car/request_form_provider.dart';
import 'package:admin_rent/controllers/providers/car/storage_provider.dart';
import 'package:admin_rent/controllers/providers/firebase/auth/auth_provider.dart';
import 'package:admin_rent/controllers/providers/firebase/password_visibility_provider.dart';
import 'package:admin_rent/controllers/providers/sidebar/sidebar_controller.dart';
import 'package:admin_rent/firebase_options.dart';
import 'package:admin_rent/view/auth/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordVisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => StorageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarProvider(),
        ),
        
        ChangeNotifierProvider(
          create: (context) => CalendarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SidebarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarFilterChipProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RentalRequestProvider()..fetchRequests(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          home: const LoginPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity),
        ),
      ),
    );
  }

  static void debugPrint(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
