import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

import '../views/medicalhistory_sceen.dart';

class DemographicController extends GetxController {
  String name = '';
  String gender = 'Male';
  String age = '18-20 years';
  String residence = 'Rural';
  String education = 'Matriculation (grade 9 and 10)';
  String profession = '';

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
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'socio_demographic': {
          'name': name,
          'gender': gender,
          'age': age,
          'residence': residence,
          'education': education,
          'profession': profession,
          'id': currentUser!.uid,
        }
      }).then((value) => Get.offAll(() => const MedicalHistoryScreen()));
      //.collection('socio_demographic')
      //.doc('data')
      //     .set({
      //   'name': name,
      //   'gender': gender,
      //   'age': age,
      //   'residence': residence,
      //   'education': education,
      //   'profession': profession,
      //   'id': currentUser!.uid,
      // }).then((value) => Get.offAll(() => const MedicalHistoryScreen()));
    } catch (e) {
      debugPrint('LoginCalled() called Error "$e"');
      Get.snackbar(
        'Error',
        'Some Error Occured! ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
