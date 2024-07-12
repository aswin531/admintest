// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:admin_rent/utils/custom_error_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProviders extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore adminCollection = FirebaseFirestore.instance;

  bool isLoading = false;
//Sign In
  Future<User?> signin(
      BuildContext context, String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
          
      await saveUserLoggedIn(true);

      // if (!credential.user!.emailVerified) {
      //   await credential.user!.sendEmailVerification();
      // }

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        content: Text("Sign In Successful!"),
        backgroundColor: Colors.green,
      ));

      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase exception here
      if (kDebugMode) {
        print("Error during authentication: ${e.code} - ${e.message}");
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(getErrorMessage(e.code))));
    } catch (e) {
      if (kDebugMode) {
        print("Unexpected Error: $e");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return null;
  }

  // Example function to save user login state using shared_preferences
  Future<void> saveUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("isLoggedIn", isLoggedIn);
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isLoggedIn = preferences.getBool("isLoggedIn") ?? false;
    return isLoggedIn;
  }
}


 
// //Sign Out
//   Future<void> signOut(BuildContext context) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       await _firebaseAuth.signOut();
//       //await _googleSignIn.signOut(); // Sign out of Google if signed in

//       notifyListeners();
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Signed Out Successfully!')));
//     } on FirebaseAuthException catch (e) {
//       final message = errorMessages[e.code];
//       if (message != null) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(message)));
//       } else {
//         if (kDebugMode) {
//           print("Error during authentication : ${e.code} - ${e.message}");
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Unexpected Error: $e");
//       }
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   bool get isLoading => _isLoading;
// }



// //Google SignIn
//   // Future<void> signInWithGoogle(BuildContext context) async {
//   //   _isLoading = true;
//   //   notifyListeners();

//   //   try {
//   //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//   //     if (googleUser != null) {
//   //       final GoogleSignInAuthentication googleAuth =
//   //           await googleUser.authentication;
//   //       // ignore: unused_local_variable
//   //       final credential = await _firebaseAuth.signInWithCredential(
//   //           GoogleAuthProvider.credential(
//   //               accessToken: googleAuth.accessToken,
//   //               idToken: googleAuth.idToken));
//   //       notifyListeners();
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //           const SnackBar(content: Text("Google SignIn Successful")));
//   //     }
//   //   } on FirebaseAuthException catch (e) {
//   //     final message = errorMessages[e.code];
//   //     if (message != null) {
//   //       ScaffoldMessenger.of(context)
//   //           .showSnackBar(SnackBar(content: Text(message)));
//   //     } else {
//   //       if (kDebugMode) {
//   //         print("Error during authentication : ${e.code} - ${e.message}");
//   //       }
//   //     }
//   //   } catch (e) {
//   //     if (kDebugMode) {
//   //       print("Unexpected Error: $e");
//   //     }
//   //   } finally {
//   //     _isLoading = false;
//   //     notifyListeners();
//   //   }
//   // }