
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OreientationController extends GetxController {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  RxBool isDayCorrect = false.obs;
  RxBool isPlaceCorrect = false.obs;
  RxBool isCityCorrect = false.obs;

  DateTime currentDate = DateTime.now();

  Future<void> saveResultsToFirestore() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        // Save the results to Firestore
        final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
        final DocumentReference userDoc = userCollection.doc(currentUser.uid);
        final CollectionReference resultsCollection =
        userDoc.collection('date_verification_results');

        final DocumentReference resultDoc = resultsCollection.doc('result'); // Use 'result' as the document name

        await resultDoc.set({
          'isDayCorrect': isDayCorrect.value,
          'isPlaceCorrect': isPlaceCorrect.value,
          'isCityCorrect': isCityCorrect.value,
        });
      } catch (error) {
        // Handle Firestore error
        debugPrint('Firestore error: $error');
        // Show error message to the user
        Get.snackbar(
          'Error',
          'Failed to save results. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      // Handle user not signed in
      debugPrint('User is not signed in.');
      // Show error message to the user
      Get.snackbar(
        'Error',
        'User is not signed in.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      currentDate: DateTime.parse("2023-06-01 11:06:21.240752"),
      initialDate: DateTime.parse("2023-06-01 11:06:21.240752"),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      currentDate = picked;
      dayController.text = currentDate.day.toString();
    }
  }

  void verifyInputs() {
    isDayCorrect.value = dayController.text == currentDate.day.toString();
    isPlaceCorrect.value = placeController.text == 'islamabad'|| placeController.text == 'rawalpindi';
    isCityCorrect.value = cityController.text == 'islamabad'|| cityController.text == 'rawalpindi';

    saveResultsToFirestore();
  }
}
