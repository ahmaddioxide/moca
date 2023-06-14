import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class MedicalHistoryController extends GetxController {
  String diet = '';
  String physicalActivity = '';
  String smoke = '';
  String medicalCondition = '';

  void submitForm({diet, physicalActivity, smoke, medicalCondition}) async {
    debugPrint('submitForm() called');

    await FirebaseFirestore.instance
        .collection('users')
        .doc('test_user')
        .collection('medical_history')
        .doc(currentUser!.uid)
        .set({
      'diet': diet,
      'physicalActivity': physicalActivity,
      'smoke': smoke,
      'medicalCondition': medicalCondition,
      'id': currentUser!.uid,
    });

    // Get.dialog(
    //   AlertDialog(
    //     title: const Text('Form Submitted'),
    //     content: const Text('Your medical history data has been submitted.'),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Get.back();
    //         },
    //         child: const Text('OK'),
    //       ),
    //     ],
    //   ),
    // );
  }
}
