import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';

class Serial7Controller extends GetxController {
  final CollectionReference _collection =
  FirebaseFirestore.instance.collection('users');
  RxBool isListening = false.obs;
  RxBool starttest = false.obs;
  RxString text = "Hold the button and start speaking".obs;
  RxBool maxAttemptsReached = false.obs;
  RxInt attempts = 0.obs;
  RxInt maxAttempts = 5.obs;

  RxInt remainingSeconds = 60.obs;
  var timerDuration = const Duration(seconds: 60);

  void timeDuration() {
    remainingSeconds.value = timerDuration.inSeconds;
  }

  void decrementSeconds() {
    remainingSeconds.value--;
  }


  Future<void> saveScore(int scoreValue) async {
    try {
      await _collection.doc(currentUser!.uid).update({
        "attention_test_3": {'serial7_test_score': scoreValue}
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
