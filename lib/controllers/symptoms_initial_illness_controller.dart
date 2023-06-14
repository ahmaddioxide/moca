import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SymptomsInitialIllnessController extends GetxController {
  String fever = 'None';
  String cough = 'None';
  String stuffyNose = 'None';
  String soreThroat = 'None';
  String breathingIssues = 'None';
  String chestPain = 'None';
  String irregularPulse = 'None';
  String itchyRedDryEyes = 'None';
  String headAches = 'None';
  String lossOfSmelltaste = 'None';
  String blurredVision = 'None';
  String hallucinations = 'None';
  String confusion = 'None';
  String difficultSleepy = 'None';
  String depressionAnxiety = 'None';
  String numbness = 'None';
  String fatigue = 'None';
  String bodyPain = 'None';
  String nausea = 'None';
  String vomiting = 'None';
  String diarrhea = 'None';
  String abdominalPain = 'None';
  String lossOfAppetite = 'None';
  String hotFlashes = 'None';
  String rash = 'None';

  void submitForm() async {
    debugPrint('submitForm() called');
    final User? user = FirebaseAuth.instance.currentUser;

    final DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc('test_user')
        .collection('socio_demographic')
        .doc();

    final Map<String, dynamic> formData = {
      'fever': fever,
      'cough': cough,
      'stuffyNose': stuffyNose,
      'soreThroat': soreThroat,
      'breathingIssues': breathingIssues,
      'chestPain': chestPain,
      'irregularPulse': irregularPulse,
      'itchyRedDryEyes': itchyRedDryEyes,
      'headAches': headAches,
      'lossOfSmelltaste': lossOfSmelltaste,
      'blurredVision': blurredVision,
      'hallucinations': hallucinations,
      'confusion': confusion,
      'difficultSleepy': difficultSleepy,
      'depressionAnxiety': depressionAnxiety,
      'numbness': numbness,
      'fatigue': fatigue,
      'bodyPain': bodyPain,
      'nausea': nausea,
      'vomiting': vomiting,
      'diarrhea': diarrhea,
      'abdominalPain': abdominalPain,
      'lossOfAppetite': lossOfAppetite,
      'hotFlashes': hotFlashes,
      'rash': rash,
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
