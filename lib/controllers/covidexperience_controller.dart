import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class CovidExperienceController extends GetxController {
  String pcrTest = '';
  String pcrTestDetails = '';
  String covid = '';
  String result = '';
  String duration = '';
  String first4weeks = '';
  String week4Experience = '';

  void submitForm({
    pcrTest,
    covid,
    result,
    duration,
    first4weeks,
    week4Experience,
    pcrTestDetails,
  }) async {
    debugPrint('submitForm() called');

    await FirebaseFirestore.instance
        .collection('users')
        .doc('test_user')
        .collection('covid_experience')
        .doc(currentUser!.uid)
        .set({
      'pcrTest': pcrTest,
      'covid': covid,
      'results': result,
      'duration': duration,
      'first4weeks': first4weeks,
      'week4Experience': week4Experience,
      'pcrTestDetails': pcrTestDetails,
      'id': currentUser!.uid,
    });

    // Get.dialog(
    //   AlertDialog(
    //     title: const Text('Form Submitted'),
    //     content: const Text('Your Covid Experience data has been submitted.'),
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
