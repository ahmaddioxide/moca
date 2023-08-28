import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class SymptomsOnGoingIllnessController extends GetxController {
  String cough = 'None';
  String breathingIssues = 'None';
  String chestPain = 'None';
  String irregularPulse = 'None';
  String itchyRedDryEyes = 'None';
  String headAche = 'None';
  String lossOfSmelltaste = 'None';
  String blurredVision = 'None';
  String hallucinations = 'None';
  String confusion = 'None';
  String forgetfulness = 'None';
  String delayedThinking = 'None';
  String poorConcentration = 'None';
  String difficultSpeaking = 'None';
  String difficultSleeping = 'None';
  String depressionAnxiety = 'None';
  String numbness = 'None';
  String fatigue = 'None';
  String bodyPain = 'None';
  String nausea = 'None';
  String abdominalPain = 'None';
  String lossOfAppetite = 'None';

  Future<bool> submitForm({
    headAche,
    cough,
    breathingIssues,
    chestPain,
    irregularPulse,
    itchyRedDryEyes,
    lossOfSmelltaste,
    blurredVision,
    hallucinations,
    confusion,
    forgetfulness,
    delayedThinking,
    poorConcentration,
    difficultSpeaking,
    difficultSleeping,
    depressionAnxiety,
    numbness,
    fatigue,
    bodyPain,
    nausea,
    abdominalPain,
    lossOfAppetite,
  }) async {
    try {
      ///storing page info if page has been used of user in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'pages': FieldValue.arrayUnion(['symptoms_ongoing_illness']),
      }, SetOptions(merge: true));
      ////storing data of user in firestore
      debugPrint('submitForm() called');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'symptoms_ongoing_illness': {
          'cough': cough,
          'breathingIssues': breathingIssues,
          'chestPain': chestPain,
          'irregularPulse': irregularPulse,
          'itchyRedDryEyes': itchyRedDryEyes,
          'lossOfSmelltaste': lossOfSmelltaste,
          'blurredVision': blurredVision,
          'hallucinations': hallucinations,
          'confusion': confusion,
          'forgetfulness': forgetfulness,
          'delayedThinking': delayedThinking,
          'poorConcentration': poorConcentration,
          'difficultSpeaking': difficultSpeaking,
          'difficultSleeping': difficultSleeping,
          'depressionAnxiety': depressionAnxiety,
          'numbness': numbness,
          'fatigue': fatigue,
          'bodyPain': bodyPain,
          'nausea': nausea,
          'abdominalPain': abdominalPain,
          'lossOfAppetite': lossOfAppetite,
          'headAche': headAche
        }
      });
      //     .collection('symptoms_ongoing_illness')
      //     .doc('data')
      //     .set({
      //   'cough': cough,
      //   'breathingIssues': breathingIssues,
      //   'chestPain': chestPain,
      //   'irregularPulse': irregularPulse,
      //   'itchyRedDryEyes': itchyRedDryEyes,
      //   'lossOfSmelltaste': lossOfSmelltaste,
      //   'blurredVision': blurredVision,
      //   'hallucinations': hallucinations,
      //   'confusion': confusion,
      //   'forgetfulness': forgetfulness,
      //   'delayedThinking': delayedThinking,
      //   'poorConcentration': poorConcentration,
      //   'difficultSpeaking': difficultSpeaking,
      //   'difficultSleeping': difficultSleeping,
      //   'depressionAnxiety': depressionAnxiety,
      //   'numbness': numbness,
      //   'fatigue': fatigue,
      //   'bodyPain': bodyPain,
      //   'nausea': nausea,
      //   'abdominalPain': abdominalPain,
      //   'lossOfAppetite': lossOfAppetite,
      //   'headAche': headAche
      // });
      return true;
    } catch (e) {
      debugPrint('LoginCalled() called Error "$e"');
      Get.snackbar(
        'Error',
        'Some Error Occured! ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  Future<bool> signUpMethod({
    headAche,
    cough,
    breathingIssues,
    chestPain,
    irregularPulse,
    itchyRedDryEyes,
    lossOfSmelltaste,
    blurredVision,
    hallucinations,
    confusion,
    forgetfulness,
    delayedThinking,
    poorConcentration,
    difficultSpeaking,
    difficultSleeping,
    depressionAnxiety,
    numbness,
    fatigue,
    bodyPain,
    nausea,
    abdominalPain,
    lossOfAppetite,
  }) async {
    try {
      debugPrint('submitForm() called');
      bool? check = await submitForm(
        headAche: headAche,
        cough: cough,
        breathingIssues: breathingIssues,
        chestPain: chestPain,
        irregularPulse: irregularPulse,
        itchyRedDryEyes: itchyRedDryEyes,
        lossOfSmelltaste: lossOfSmelltaste,
        blurredVision: blurredVision,
        hallucinations: hallucinations,
        confusion: confusion,
        forgetfulness: forgetfulness,
        delayedThinking: delayedThinking,
        poorConcentration: poorConcentration,
        difficultSpeaking: difficultSpeaking,
        difficultSleeping: difficultSleeping,
        depressionAnxiety: depressionAnxiety,
        numbness: numbness,
        fatigue: fatigue,
        bodyPain: bodyPain,
        nausea: nausea,
        abdominalPain: abdominalPain,
        lossOfAppetite: lossOfAppetite,
      );
      if (check == false) {
        debugPrint('ERROR is storing data!');
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
