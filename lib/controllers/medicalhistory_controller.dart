import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MedicalHistoryController extends GetxController {
  String diet = '';
  String physicalActivity = '';
  String smoke = '';
  String medicalCondition = '';

  void submitForm() async {
    debugPrint('submitForm() called');
    final User? user = FirebaseAuth.instance.currentUser;

    final DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc('test_user')
        .collection('medical_history')
        .doc();

    final Map<String, dynamic> formData = {
      'diet': diet,
      'physicalActivity': physicalActivity,
      'smoke': diet,
      'medicalCondition': medicalCondition,
    };

    await userRef.set(formData);

    Get.dialog(
      AlertDialog(
        title: const Text('Form Submitted'),
        content: const Text('Your socio-demographic data has been submitted.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
