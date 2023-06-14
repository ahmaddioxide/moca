import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class DemographicController extends GetxController {
  String email = '';
  String password = '';
  String name = '';
  String gender = '';
  String age = '18-20 years';
  String residence = '';
  String education = 'Matriculation (grade 9 and 10)';
  String profession = '';

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

  void submitForm(
      {name,
      gender,
      age,
      residence,
      education,
      profession,
      password,
      email}) async {
    debugPrint('submitForm() called');

    await FirebaseFirestore.instance
        .collection('users')
        .doc('test_user')
        .collection('socio_demographic')
        .doc(currentUser!.uid)
        .set({
      'name': name,
      'gender': gender,
      'age': age,
      'residence': residence,
      'education': education,
      'profession': profession,
      'password': password,
      'email': email,
      'id': currentUser!.uid,
    });

    // AlertDialog(
    //   title: const Text('Form Submitted'),
    //   content: const Text('Your socio-demographic data has been submitted.'),
    //   actions: [
    //     TextButton(
    //       onPressed: () {
    //         Get.back();
    //       },
    //       child: const Text('OK'),
    //     ),
    //   ],
    // );
  }
}
