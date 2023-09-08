import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/delayRecall_test_screen.dart';

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
      // final CollectionReference resultsCollection =
      // userDoc.collection('abstraction_results');
 int numberOfTrues = 0;
 int result = 0;
       for (int i = 0; i < taskResults.length; i++) {
          if (taskResults[i] == true) {
            numberOfTrues++;
          }
        }

       if(numberOfTrues>=2) {
         result = 2;
       }
        else if(numberOfTrues==1) {
          result = 1;
        }
        else {
          result = 0;
        }
      await userDoc.update({
        'abstraction_results': {'taskResults': result}
      }).then((value) {
        // Get.snackbar('Success', "Task results saved successfully.",
        //     backgroundColor: Colors.green,
        //     colorText: Colors.white,
        //     snackPosition: SnackPosition.BOTTOM);
        Get.offAll(() => const DelayRecallScreen());
      }, onError: (error) {
        // Get.snackbar('Error', "Task results could not be saved.",
        //     backgroundColor: Colors.red,
        //     colorText: Colors.white,
        //     snackPosition: SnackPosition.BOTTOM);
      });

      // Process the results or navigate to the next screen
      debugPrint('Task Results: $taskResults');
    } else {
      // Handle user not signed in
      // Get.snackbar('Error', "User is not signed in.",
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white,
      //     snackPosition: SnackPosition.BOTTOM);
      debugPrint('User is not signed in.');
    }
  }
}
