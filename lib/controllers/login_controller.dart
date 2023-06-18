import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class LogInController extends GetxController {
  String email = '';
  String password = '';
  //////login
  Future<UserCredential?> logInMethod({email, password}) async {
    debugPrint('authSignup() called');
    UserCredential? userCredential;
    try {
      userCredential = await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        debugPrint('auth.signInWithEmailAndPassword() called');
        currentUser = value.user;
        debugPrint('currentUser: $currentUser');
        return value;
      });
    } on FirebaseAuthException catch (e) {
      debugPrint('LoginCalled() called Error "$e"');
    }
    return userCredential;
  }

  Future<bool> logIn({password, email}) async {
    try {
      debugPrint('LogIn() called');
      UserCredential? userCredential =
          await logInMethod(email: email, password: password);
      if (userCredential == null) {
        debugPrint('userCredential is null');
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
