import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/orientation_screen.dart';

class AbstractionController extends GetxController {
  Future<void> submitTaskResults(
      List<bool> taskResults,
      ) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Save the results to Firestore
      final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
      final DocumentReference userDoc = userCollection.doc(currentUser.uid);
      final CollectionReference resultsCollection =
      userDoc.collection('abstraction_results');

      await resultsCollection.add({'taskResults': taskResults}).then((value) {
        Get.snackbar('Success', "Task results saved successfully.",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        Get.offAll(() =>  OrientationScreen());
      }, onError: (error) {
        Get.snackbar('Error', "Task results could not be saved.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      });

      // Process the results or navigate to the next screen
      debugPrint('Task Results: $taskResults');
    } else {
      // Handle user not signed in
      Get.snackbar('Error', "User is not signed in.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      debugPrint('User is not signed in.');
    }
  }
}