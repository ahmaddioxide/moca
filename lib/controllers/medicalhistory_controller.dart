import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class MedicalHistoryController extends GetxController {
  String? diet1 = '';
  String? diet2 = '';
  String? diet3 = '';
  String? diet4 = '';
  String? diet5 = '';
  String physicalActivity = '';
  String smoke = '';
  String? medicalCondition1 = '';
  String? medicalCondition2 = '';
  String? medicalCondition3 = '';
  String? medicalCondition4 = '';
  String? medicalCondition5 = '';
  String? medicalCondition6 = '';
  String? medicalCondition7 = '';
  String? medicalCondition8 = '';
  String? medicalCondition9 = '';
  String alcohol = '';

  Future<bool> submitForm({
    diet1,
    diet2,
    diet3,
    diet4,
    diet5,
    physicalActivity,
    smoke,
    alcohol,
    medicalCondition1,
    medicalCondition2,
    medicalCondition3,
    medicalCondition4,
    medicalCondition5,
    medicalCondition6,
    medicalCondition7,
    medicalCondition8,
    medicalCondition9,
  }) async {
    debugPrint('submitForm() called');
    try {
      ///storing page info if page has been used of user in firestore

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'pages': FieldValue.arrayUnion(['medical_history']),
      }, SetOptions(merge: true));
      ////storing data of user in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'medical_history': {
          'diet': [diet1, diet2, diet3, diet4, diet5],
          'physicalActivity': physicalActivity,
          'smoke': smoke,
          'alcohol': alcohol,
          'medicalCondition': [
            medicalCondition1,
            medicalCondition2,
            medicalCondition3,
            medicalCondition4,
            medicalCondition5,
            medicalCondition6,
            medicalCondition7,
            medicalCondition8,
            medicalCondition9
          ],
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

  // Future<bool> signup({diet, physicalActivity, smoke, medicalCondition}) async {
  //   try {
  //     debugPrint('submitForm() called');
  //     bool? check = await submitForm(
  //         diet1: diet,
  //         physicalActivity: physicalActivity,
  //         smoke: smoke,
  //         medicalCondition: medicalCondition);
  //     if (check == false) {
  //       debugPrint('ERROR is storing data!');
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint('Error: $e');
  //     Get.snackbar(
  //       'Error',
  //       'Error: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return false;
  //   }
  //   return true;
  // }
}
