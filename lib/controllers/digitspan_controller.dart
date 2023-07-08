import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';

class DigitSpanController extends GetxController {
  final CollectionReference _scoresCollection =
      FirebaseFirestore.instance.collection('users');

  RxInt Score = 0.obs;
  RxBool starttest = true.obs;
  RxBool isReading = true.obs;

  RxInt remainingSeconds = 60.obs;
  var timerDuration = const Duration(seconds: 60);

  void timeDuration() {
    remainingSeconds.value = timerDuration.inSeconds;
  }

  void decrementSeconds() {
    remainingSeconds.value--;
  }

  void incrementScore() {
    Score.value++;
    _updateScore(Score.value);
  }

  Future<void> _updateScore(int score) async {
    try {
      await _scoresCollection
          .doc(currentUser!.uid)
          .collection('attention_test')
          .doc('ForwardandBackwardTest')
          .set({'score': score});
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
