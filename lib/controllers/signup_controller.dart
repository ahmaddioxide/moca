import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class SignUpController extends GetxController {
  String email = '';
  String password = '';
  String repassword = '';
  String name = '';

  Future<UserCredential?> authSignup({email, password}) async {
    debugPrint('authSignup() called');
    UserCredential? userCredential;
    try {
      userCredential = await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        debugPrint('auth.createUserWithEmailAndPassword() called');
        currentUser = value.user;
        debugPrint('currentUser: $currentUser');
        return value;
      });
    } on FirebaseAuthException catch (e) {
      debugPrint('LoginCalled() called Error "$e"');
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Weak Password',
          'The password provided is too weak.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email Already in Use',
          'The account already exists for that email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar(
          'Operation Not Allowed',
          'Email/password accounts are not enabled.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Unknown Error',
          'An unknown error occurred.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
    return userCredential;
  }

  Future<bool> signup({name, password, email}) async {
    debugPrint('signup() called');
    UserCredential? userCredential =
        await authSignup(email: email, password: password);
    if (userCredential == null) {
      debugPrint('userCredential is null');
      return false;
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'user_info': {'name': name, 'email': email}
      });
      //     .collection('user_info')
      //     .doc('data')
      //     .set(
      //   {
      //     'name': name,
      //     'email': email,
      //   },
      // );
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
