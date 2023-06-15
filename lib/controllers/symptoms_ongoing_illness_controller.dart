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

  void submitForm({
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
    debugPrint('submitForm() called');

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('symptoms_initial_illness')
        .doc(currentUser!.uid)
        .set({
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
    });
  }
}
