import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';

class SentenceController extends GetxController {
  final CollectionReference _scoresCollection =
  FirebaseFirestore.instance.collection('users');

  RxInt Score = 0.obs;

  void incrementScore() {
    Score.value++;
    _updateScore(Score.value);
  }

  Future<void> _updateScore(int score) async  {
    try {
      await _scoresCollection.doc(currentUser!.uid)
          .collection('language_test')
          .doc('SentenceRepetitionTest').set({'score': score});
    } catch (e) {
      debugPrint('Error updating score: $e');
      Get.snackbar(
        'Error',
        'Some Error Occured! ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
