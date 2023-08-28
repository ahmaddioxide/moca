import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

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

  Future<bool> submitForm({
    fever,
    cough,
    stuffyNose,
    soreThroat,
    breathingIssues,
    chestPain,
    irregularPulse,
    itchyRedDryEyes,
    headAches,
    lossOfSmelltaste,
    blurredVision,
    hallucinations,
    confusion,
    difficultSleepy,
    depressionAnxiety,
    numbness,
    fatigue,
    bodyPain,
    nausea,
    vomiting,
    diarrhea,
    abdominalPain,
    lossOfAppetite,
    hotFlashes,
    rash,
  }) async {
    try {
      ///storing page info if page has been used of user in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'pages': FieldValue.arrayUnion(['symptoms_initial_illness']),
      }, SetOptions(merge: true));
      ////storing data of user in firestore
      debugPrint('submitForm() called');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'symptoms_initial_illness': {
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
        }
      });
      //     .collection('symptoms_initial_illness')
      //     .doc('data')
      //     .set({
      //   'fever': fever,
      //   'cough': cough,
      //   'stuffyNose': stuffyNose,
      //   'soreThroat': soreThroat,
      //   'breathingIssues': breathingIssues,
      //   'chestPain': chestPain,
      //   'irregularPulse': irregularPulse,
      //   'itchyRedDryEyes': itchyRedDryEyes,
      //   'headAches': headAches,
      //   'lossOfSmelltaste': lossOfSmelltaste,
      //   'blurredVision': blurredVision,
      //   'hallucinations': hallucinations,
      //   'confusion': confusion,
      //   'difficultSleepy': difficultSleepy,
      //   'depressionAnxiety': depressionAnxiety,
      //   'numbness': numbness,
      //   'fatigue': fatigue,
      //   'bodyPain': bodyPain,
      //   'nausea': nausea,
      //   'vomiting': vomiting,
      //   'diarrhea': diarrhea,
      //   'abdominalPain': abdominalPain,
      //   'lossOfAppetite': lossOfAppetite,
      //   'hotFlashes': hotFlashes,
      //   'rash': rash,
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
    fever,
    cough,
    stuffyNose,
    soreThroat,
    breathingIssues,
    chestPain,
    irregularPulse,
    itchyRedDryEyes,
    headAches,
    lossOfSmelltaste,
    blurredVision,
    hallucinations,
    confusion,
    difficultSleepy,
    depressionAnxiety,
    numbness,
    fatigue,
    bodyPain,
    nausea,
    vomiting,
    diarrhea,
    abdominalPain,
    lossOfAppetite,
    hotFlashes,
    rash,
  }) async {
    try {
      debugPrint('submitForm() called');
      bool? check = await submitForm(
        fever: fever,
        cough: cough,
        stuffyNose: stuffyNose,
        soreThroat: soreThroat,
        breathingIssues: breathingIssues,
        chestPain: chestPain,
        irregularPulse: irregularPulse,
        itchyRedDryEyes: itchyRedDryEyes,
        headAches: headAches,
        lossOfSmelltaste: lossOfSmelltaste,
        blurredVision: blurredVision,
        hallucinations: hallucinations,
        confusion: confusion,
        difficultSleepy: difficultSleepy,
        depressionAnxiety: depressionAnxiety,
        numbness: numbness,
        fatigue: fatigue,
        bodyPain: bodyPain,
        nausea: nausea,
        vomiting: vomiting,
        diarrhea: diarrhea,
        abdominalPain: abdominalPain,
        lossOfAppetite: lossOfAppetite,
        hotFlashes: hotFlashes,
        rash: rash,
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
