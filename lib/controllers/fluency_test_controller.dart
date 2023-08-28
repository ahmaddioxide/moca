
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';

class FluencyTestController extends GetxController {
  final CollectionReference _scoresCollection =
  FirebaseFirestore.instance.collection('users');

  RxInt score = 0.obs;
  RxBool isListening = false.obs;
  RxBool starttest = true.obs;
  RxBool isReading = true.obs;
  RxString text = "Hold the button and start speaking".obs;
  RxInt remainingSeconds = 60.obs;

  var timerDuration = const Duration(seconds: 60);

  void timeDuration() {
    remainingSeconds.value = timerDuration.inSeconds;
  }

  void decrementSeconds() {
    remainingSeconds.value--;
  }

  void setScore(int val) {
    score.value == val;
  }

  Future<void> updateScore(int score) async {
    try {
      await _scoresCollection.doc(currentUser!.uid).update({
        "language_test_2": {'fluency_test_sccore': score}
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
