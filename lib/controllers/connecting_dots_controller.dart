

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class ConnectingDotsController extends GetxController {
  final CollectionReference _scoresCollection =
  FirebaseFirestore.instance.collection('users');

  RxInt remainingSeconds = 120.obs;
  var timerDuration = const Duration(seconds: 120);

  void timeDuration() {
    remainingSeconds.value = timerDuration.inSeconds;
  }

  void decrementSeconds() {
    remainingSeconds.value--;
  }

  Future<void> updatetestScore(int score) async {
    try {
      await _scoresCollection.doc(currentUser!.uid)
          .update({'Viscospatial_test_1': {'connecting_dot_score': score}});
    } catch (e) {
      debugPrint('Error updating score: $e');
      Get.snackbar(
        'Error',
        'Some Error Occured!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}