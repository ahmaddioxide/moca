import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class SymptomsInitialIllnessController extends GetxController {
  String fever = 'None';
  String cough = 'None';
  String runnyStuffyNose = 'None';
  String soreThroat = 'None';
  String palpitations = 'None';
  String breathingIssues = 'None';
  String chestPainTightness = 'None';
  String forgetfulness = 'None';
  String delayedthinking = 'None';
  String poorconcentration = 'None';
  String itchyRedDryEyes = 'None';
  String headAches = 'None';
  String lossOfSmelltaste = 'None';
  String confusion = 'None';
  String difficultSleepy = 'None';
  String difficultySpeaking = 'None';
  String depressionAnxiety = 'None';
  String fatigue = 'None';
  String muscleBodyPain = 'None';
  String nauseaVomiting = 'None';
  String stomachAche = 'None';
  String diarrhea = 'None';
  String ucersSores = 'None';
  String blisters = 'None';
  String lossOfAppetite = 'None';
  String rash = 'None';
  String itchySwollenSkin = 'None';

  Future<bool> submitForm({
    fever,
    cough,
    runnyStuffyNose,
    soreThroat,
    palpitations,
    breathingIssues,
    chestPainTightness,
    forgetfulness,
    delayedthinking,
    poorconcentration,
    itchyRedDryEyes,
    headAches,
    lossOfSmelltaste,
    confusion,
    difficultSleepy,
    difficultySpeaking,
    depressionAnxiety,
    fatigue,
    muscleBodyPain,
    nauseaVomiting,
    stomachAche,
    diarrhea,
    ucersSores,
    blisters,
    lossOfAppetite,
    rash,
    itchySwollenSkin,
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
          'runnyStuffyNose': runnyStuffyNose,
          'soreThroat': soreThroat,
          'palpitations': palpitations,
          'breathingIssues': breathingIssues,
          'chestPainTightness': chestPainTightness,
          'forgetfulness': forgetfulness,
          'delayedthinking': delayedthinking,
          'poorconcentration': poorconcentration,
          'itchyRedDryEyes': itchyRedDryEyes,
          'headAches': headAches,
          'lossOfSmelltaste': lossOfSmelltaste,
          'confusion': confusion,
          'difficultSleepy': difficultSleepy,
          'difficultySpeaking': difficultySpeaking,
          'depressionAnxiety': depressionAnxiety,
          'fatigue': fatigue,
          'muscleBodyPain': muscleBodyPain,
          'nauseaVomiting': nauseaVomiting,
          'stomachAche': stomachAche,
          'diarrhea': diarrhea,
          'ucersSores': ucersSores,
          'blisters': blisters,
          'lossOfAppetite': lossOfAppetite,
          'rash': rash,
          'itchySwollenSkin': itchySwollenSkin,
        }
      });

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
    runnyStuffyNose,
    soreThroat,
    palpitations,
    breathingIssues,
    chestPainTightness,
    forgetfulness,
    delayedthinking,
    poorconcentration,
    itchyRedDryEyes,
    headAches,
    lossOfSmelltaste,
    confusion,
    difficultSleepy,
    difficultySpeaking,
    depressionAnxiety,
    fatigue,
    muscleBodyPain,
    nauseaVomiting,
    stomachAche,
    diarrhea,
    ucersSores,
    blisters,
    lossOfAppetite,
    rash,
    itchySwollenSkin,
  }) async {
    try {
      debugPrint('submitForm() called');
      bool? check = await submitForm(
        fever: fever,
        cough: cough,
        runnyStuffyNose: runnyStuffyNose,
        soreThroat: soreThroat,
        palpitations: palpitations,
        breathingIssues: breathingIssues,
        chestPainTightness: chestPainTightness,
        forgetfulness: forgetfulness,
        delayedthinking: delayedthinking,
        poorconcentration: poorconcentration,
        itchyRedDryEyes: itchyRedDryEyes,
        headAches: headAches,
        lossOfSmelltaste: lossOfSmelltaste,
        confusion: confusion,
        difficultSleepy: difficultSleepy,
        difficultySpeaking: difficultySpeaking,
        depressionAnxiety: depressionAnxiety,
        fatigue: fatigue,
        muscleBodyPain: muscleBodyPain,
        nauseaVomiting: nauseaVomiting,
        stomachAche: stomachAche,
        diarrhea: diarrhea,
        ucersSores: ucersSores,
        blisters: blisters,
        lossOfAppetite: lossOfAppetite,
        rash: rash,
        itchySwollenSkin: itchySwollenSkin,
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
