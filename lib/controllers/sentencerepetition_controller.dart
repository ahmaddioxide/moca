import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';

class SentenceController extends GetxController {
  // final CollectionReference _scoresCollection =
  //     FirebaseFirestore.instance.collection('users');

  RxInt Score = 0.obs;
  RxBool isMicEnabled = false.obs;
  RxInt remainingSeconds = 60.obs;
  var timerDuration = const Duration(seconds: 60);

  void timeDuration() {
    remainingSeconds.value = timerDuration.inSeconds;
  }

  void decrementSeconds() {
    remainingSeconds.value--;
  }

  void enableMicButton() {
    isMicEnabled.value = true;
  }

  void disableMicButton() {
    isMicEnabled.value = false;
  }

  void incrementScore() {
    Score.value++;
  }

  Future<void> updateScore(int Score) async {
    try {
      // await _scoresCollection.doc(currentUser!.uid).update({
      //   "language_test_1": {'sentence_rep_test_sccore': score}
      // });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'language_test_1': {
          'score': Score,
        }
      });
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
