import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moca/controllers/firebase_const.dart';

class CubeController extends GetxController {
  final CollectionReference _collection =
  FirebaseFirestore.instance.collection('users');


  Future<void> saveScore(int scoreValue) async {
    try {
      await _collection.doc(currentUser!.uid).update({
        "Viscospatial_test_2": {'cube_drawing_sccore': scoreValue}
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
