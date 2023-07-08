import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';


class MemoryTestController extends GetxController {

  RxList<String> wordList = <String>[].obs;
  RxList<String> recognizedWordsList = <String>[].obs;
  RxBool isListening = false.obs;


  RxInt remainingSeconds = 60.obs;
  var timerDuration = const Duration(seconds: 60);

  void timeDuration() {
    remainingSeconds.value = timerDuration.inSeconds;
  }

  void decrementSeconds() {
    remainingSeconds.value--;
  }


  void saveData(wordList, recognizedWordsList) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .collection('memory_test')
          .doc('data').set({'WordList': wordList.toList(), 'RecognizedWordsList': recognizedWordsList.toList()});
      debugPrint('Word list saved successfully');
    } catch (e) {
      debugPrint('Error saving word list: $e');
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
