import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class DemographicController extends GetxController {
  String name = '';
  String gender = '';
  String age = '18-20 years';
  String residence = '';
  String education = 'Matriculation (grade 9 and 10)';
  String profession = '';

  void submitForm() async {
    debugPrint('submitForm() called');
    final User? user = FirebaseAuth.instance.currentUser;

      final DocumentReference userRef = FirebaseFirestore.instance
          .collection('users')
          .doc('test_user')
          .collection('socio_demographic')
          .doc();

      final Map<String, dynamic> formData = {
        'name': name,
        'gender': gender,
        'age': age,
        'residence': residence,
        'education': education,
        'profession': profession,
      };

      await userRef.set(formData);

      Get.dialog(
        AlertDialog(
          title: Text('Form Submitted'),
          content: Text('Your socio-demographic data has been submitted.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

  }
}
