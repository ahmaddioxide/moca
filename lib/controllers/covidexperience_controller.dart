import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CovidExperienceController extends GetxController {
  String pcrTest = '';
  String pcrTestDetails = '';
  String covid = '';
  String result = '';
  String duration = '';
  String first4weeks = '';
  String week4Experience = '';

  void submitForm() async {
    debugPrint('submitForm() called');
    final User? user = FirebaseAuth.instance.currentUser;

    final DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc('test_user')
        .collection('covid_experience')
        .doc();

    final Map<String, dynamic> formData = {
      'pcrTest': pcrTest,
      'covid': covid,
      'results': result,
      'duration': duration,
      'first4weeks': first4weeks,
      'week4Experience': week4Experience,
      'pcrTestDetails': pcrTestDetails,
    };

    await userRef.set(formData);

    Get.dialog(
      AlertDialog(
        title: const Text('Form Submitted'),
        content: const Text('Your Covid Experience data has been submitted.'),
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
