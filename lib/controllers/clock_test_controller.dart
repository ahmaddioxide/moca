import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockTestController extends GetxController {
  DateTime? selectedTime;
  RxInt score = RxInt(0);
  RxBool isLoading = RxBool(false);

  void setTime(DateTime? time) {
    selectedTime = time;
  }

  void increaseScore() {
    score.value += 1;
  }

  Future<void> saveScoreToFirestore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('clockGameScore', score.value);
    prefs.setInt('nextGame', 2);
    debugPrint(
        'Score of clockGameScore saved to SharedPreferences: ${score.value}');
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final CollectionReference userCollection =
          FirebaseFirestore.instance.collection('users');
      final DocumentReference userDoc = userCollection.doc(currentUser.uid);
      // final CollectionReference clockTestCollection =
      // userDoc.collection('visuospatial_draw_clock');
      // final DocumentReference dataDoc = clockTestCollection.doc('data');

      isLoading.value = true;

      await userDoc.update({
        'visuospatial_draw_clock': {'score': score.value}
      }).then((_) {
        debugPrint('Score saved to Firestore: ${score.value}');
      }).catchError((error) {
        debugPrint('Error saving score to Firestore: $error');
      }).whenComplete(() {
        isLoading.value = false;
      });
    }
  }
}
