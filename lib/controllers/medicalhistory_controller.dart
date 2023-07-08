import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class MedicalHistoryController extends GetxController {
  String diet = '';
  String physicalActivity = '';
  String smoke = '';
  String medicalCondition = '';

  Future<bool> submitForm(
      {diet, physicalActivity, smoke, medicalCondition}) async {
    debugPrint('submitForm() called');
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'medical_history': {
          'diet': diet,
          'physicalActivity': physicalActivity,
          'smoke': smoke,
          'medicalCondition': medicalCondition,
          'id': currentUser!.uid,
        }
      });
      //.collection('medical_history')
      //.doc('data')
      //     .set({
      //   'diet': diet,
      //   'physicalActivity': physicalActivity,
      //   'smoke': smoke,
      //   'medicalCondition': medicalCondition,
      //   'id': currentUser!.uid,
      // });
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  Future<bool> signup({diet, physicalActivity, smoke, medicalCondition}) async {
    try {
      debugPrint('submitForm() called');
      bool? check = await submitForm(
          diet: diet,
          physicalActivity: physicalActivity,
          smoke: smoke,
          medicalCondition: medicalCondition);
      if (check == false) {
        debugPrint('ERROR is storing data!');
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
