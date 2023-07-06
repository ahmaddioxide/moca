import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OreientationController extends GetxController {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  RxBool isDayCorrect = false.obs;
  RxBool isPlaceCorrect = false.obs;
  RxBool isCityCorrect = false.obs;


  late DateTime selectedDayMonthYear ;
  DateTime currentDateTime= DateTime.now();

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
      selectedDayMonthYear = picked;
      dayController.text = "${selectedDayMonthYear.day} / ${selectedDayMonthYear.month} /${selectedDayMonthYear.year}";
    }
  }

  void verifyInputs() {
    isDayCorrect.value = dayController.text == "${currentDateTime.day} / ${currentDateTime.month} /${currentDateTime.year}";
    isPlaceCorrect.value = placeController.text.toLowerCase() == 'islamabad'|| placeController.text == 'rawalpindi';
    isCityCorrect.value = cityController.text.toLowerCase() == 'islamabad'|| cityController.text == 'rawalpindi';

    saveResultsToFirestore();
  }
}
