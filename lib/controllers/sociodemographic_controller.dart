import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class DemographicController extends GetxController {
  String name = '';
  String gender = 'Male';
  String age = '18-20 years';
  String residence = 'Rural';
  String education = 'Matriculation (grade 9 and 10)';
  String profession = '';

  Future<bool> submitSocioDemographicForm(
      {name, gender, age, residence, education, profession, email}) async {
    debugPrint('submitForm() called');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('socio_demographic')
        .doc('data') //test result (do it)
        .set(
      {
        'name': name,
        'gender': gender,
        'age': age,
        'residence': residence,
        'education': education,
        'profession': profession,
      },
    ).catchError((e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Error: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return false;
    });
return true;
  }
}
