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

  /////signup
  Future<UserCredential?> loginMethod({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('LoginCalled() called Error "$e"');
    }
    return userCredential;
  }

  void submitForm({name, password, email}) async {
    debugPrint('submitForm() called');

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('user_info')
        .doc('data') //test result (do it)
        .set({
      'name': name,
      'password': password,
      'email': email,
      'id': currentUser!.uid,
    });
  }
}
