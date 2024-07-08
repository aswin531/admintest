import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/controllers/providers/car/checkbox_provider.dart';
import 'package:admin_rent/controllers/providers/car/storage_provider.dart';
import 'package:admin_rent/controllers/providers/firebase/auth/auth_provider.dart';
import 'package:admin_rent/controllers/providers/firebase/password_visibility_provider.dart';
import 'package:admin_rent/firebase_options.dart';
import 'package:admin_rent/view/login/login_page.dart';
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

// MultiProvider(
//   providers: [
//     ChangeNotifierProvider(
//       create: (context) => PasswordVisibilityProvider(),
//     ),
//     ChangeNotifierProvider(
//       create: (context) => AuthProviders(),
//     )
//   ],
//   child: FutureBuilder(
//     future: Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     ),
//     builder: (context, snapshot) {
//       if (snapshot.hasError) {
//         if (kDebugMode) {
//           print('Error initializing Firebase: ${snapshot.error}');
//         }
//         return const Text('Firebase initialization failed');
//       }
//       return ScreenUtilInit(
//         designSize: const Size(360, 690),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         child: MaterialApp(
//           home: const LoginPage(),
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//         ),
//       );
//     },
//   ))

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
          create: (context) => CheckBoxProvider(),
        )
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
