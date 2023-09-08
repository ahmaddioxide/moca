import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

//import 'package:moca/controllers/firebase_const.dart';
int totalScore = 0;
int cfq = 0;
int cfqScore = 0;

class ResultController extends GetxController {
  void setZero() async {
    totalScore = 0;
    cfq = 0;
    cfqScore = 0;
  }

  Future<int?> fetchUserAge() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        Map<String, dynamic>? delayRecalltest =
            userData['DelayedRecall_test'] as Map<String, dynamic>?;

        if (delayRecalltest != null &&
            delayRecalltest.containsKey('DelayRecall_test_score')) {
          return delayRecalltest['DelayRecall_test_score'] as int?;
        }
      }

      return null;
    } catch (e) {
      Get.snackbar('Error', "Task results could not be saved.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> fetchUserName() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        Map<String, dynamic>? userinfo =
            userData['user_info'] as Map<String, dynamic>?;

        if (userinfo != null && userinfo.containsKey('name')) {
          return userinfo['name'] as String?;
        }
      }

      return null;
    } catch (e) {
      Get.snackbar('Error', "Error while fetching name",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> fetchUserEmail() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        Map<String, dynamic>? userinfo =
            userData['user_info'] as Map<String, dynamic>?;

        if (userinfo != null && userinfo.containsKey('email')) {
          return userinfo['email'] as String?;
        }
      }

      return null;
    } catch (e) {
      Get.snackbar('Error', "Error while fetching email.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> fetchUserGender() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        Map<String, dynamic>? sociodemographic =
            userData['socio_demographic'] as Map<String, dynamic>?;

        if (sociodemographic != null &&
            sociodemographic.containsKey('gender')) {
          return sociodemographic['gender'] as String?;
        }
      }

      return null;
    } catch (e) {
      Get.snackbar('Error', "Error while Fetching Gender",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<int?> fetchUserScore() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        /////delayedRecalltest
        Map<String, dynamic>? delayedRecalltest =
            userData['DelayedRecall_test'] as Map<String, dynamic>?;

        if (delayedRecalltest != null &&
            delayedRecalltest.containsKey('DelayRecall_test_score')) {
          totalScore =
              totalScore + (delayedRecalltest['DelayRecall_test_score'] as int);
        }
        /////Viscospatial_test_1
        Map<String, dynamic>? viscospatialtest1 =
            userData['Viscospatial_test_1'] as Map<String, dynamic>?;

        if (viscospatialtest1 != null &&
            viscospatialtest1.containsKey('connecting_dot_score')) {
          totalScore =
              totalScore + (viscospatialtest1['connecting_dot_score'] as int);
        }

        /////Viscospatial_test_2
        Map<String, dynamic>? viscospatialtest2 =
            userData['Viscospatial_test_2'] as Map<String, dynamic>?;

        if (viscospatialtest2 != null &&
            viscospatialtest2.containsKey('cube_drawing_sccore')) {
          totalScore =
              totalScore + (viscospatialtest2['cube_drawing_sccore'] as int);
        }
        /////abstraction_results
        Map<String, dynamic>? abstractionresults =
            userData['abstraction_results'] as Map<String, dynamic>?;

        if (abstractionresults != null &&
            abstractionresults.containsKey('taskResults')) {
          totalScore = totalScore + (abstractionresults['taskResults'] as int);
        }
        ////animal_name_test
        Map<String, dynamic>? animalnametest =
            userData['animal_name_test'] as Map<String, dynamic>?;

        if (animalnametest != null && animalnametest.containsKey('score')) {
          totalScore = totalScore + (animalnametest['score'] as int);
        }
        ////attention_test_1
        Map<String, dynamic>? attentiontest1 =
            userData['attention_test_1'] as Map<String, dynamic>?;

        if (attentiontest1 != null &&
            attentiontest1.containsKey('digit_span_score')) {
          totalScore = totalScore + (attentiontest1['digit_span_score'] as int);
        }
        ////attention_test_2
        Map<String, dynamic>? attentiontest2 =
            userData['attention_test_2'] as Map<String, dynamic>?;

        if (attentiontest2 != null &&
            attentiontest2.containsKey('vigilance_test_score')) {
          totalScore =
              totalScore + (attentiontest2['vigilance_test_score'] as int);
        }

        ///serial7_test_score
        Map<String, dynamic>? attentiontest3 =
            userData['attention_test_3'] as Map<String, dynamic>?;

        if (attentiontest3 != null &&
            attentiontest3.containsKey('serial7_test_score')) {
          totalScore =
              totalScore + (attentiontest3['serial7_test_score'] as int);
        }
        ////date_verification_results
        Map<String, dynamic>? dateverificationresults =
            userData['date_verification_results'] as Map<String, dynamic>?;

        if (dateverificationresults != null &&
            dateverificationresults.containsKey('orientation_score')) {
          totalScore = totalScore +
              (dateverificationresults['orientation_score'] as int);
        }
        ////language_test_1
        Map<String, dynamic>? languagetest1 =
            userData['language_test_1'] as Map<String, dynamic>?;

        if (languagetest1 != null && languagetest1.containsKey('score')) {
          totalScore = totalScore + (languagetest1['score'] as int);
        }
        ////language_test_2
        Map<String, dynamic>? languagetest2 =
            userData['language_test_2'] as Map<String, dynamic>?;

        if (languagetest2 != null &&
            languagetest2.containsKey('fluency_test_sccore')) {
          totalScore =
              totalScore + (languagetest2['fluency_test_sccore'] as int);
        }
        ////language_test_2
        Map<String, dynamic>? surveyresults =
            userData['survey_results'] as Map<String, dynamic>?;

        for (var e in surveyresults!.entries) {
          if (e.value != null && e.value.containsKey('rating')) {
            cfqScore = (cfqScore + e.value['rating'] as int?)!;
          }
        }
        ////memorytest
        // Map<String, dynamic>? memorytest =
        //     userData['memory_test'] as Map<String, dynamic>?;

        // if (memorytest != null && memorytest.containsKey('score')) {
        //   totalScore = totalScore + (memorytest['score'] as int);
        // }
        ////visuospatial_draw_clock
        Map<String, dynamic>? visuospatialdrawclock =
            userData['visuospatial_draw_clock'] as Map<String, dynamic>?;

        if (visuospatialdrawclock != null &&
            visuospatialdrawclock.containsKey('score')) {
          totalScore = totalScore + (visuospatialdrawclock['score'] as int);
        }

        ////results
        Map<String, dynamic>? results =
            userData['results'] as Map<String, dynamic>?;

        if (results == null) {
          try {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser!.uid)
                .update({
              'results': {
                'cfqScore': cfqScore,
                'totalscore': totalScore,
                'delayedRecalltest':
                    (delayedRecalltest?['DelayRecall_test_score'] as int?),
                'viscospatialtest1':
                    (viscospatialtest1?['connecting_dot_score'] as int?),
                'viscospatialtest2':
                    (viscospatialtest2?['cube_drawing_sccore'] as int?),
                'abstractionresults':
                    (abstractionresults?['taskResults'] as int?),
                'animalnametest': (animalnametest?['score'] as int?),
                'attentiontest1': (attentiontest1?['digit_span_score'] as int?),
                'attentiontest2':
                    (attentiontest2?['vigilance_test_score'] as int?),
                'attentiontest3':
                    (attentiontest3?['serial7_test_score'] as int?),
                'dateverificationresults':
                    (dateverificationresults?['orientation_score'] as int?),
                'languagetest1': (languagetest1?['score'] as int?),
                'languagetest2':
                    (languagetest2?['fluency_test_sccore'] as int?),
                //'memorytest': (memorytest?['score'] as int?),
                'visuospatialdrawclock':
                    (visuospatialdrawclock?['score'] as int?),
                'id': currentUser!.uid,
              }
            });
          } catch (e) {
            debugPrint(e.toString());
            Get.snackbar('Error', "Task results could not be saved.",
                backgroundColor: Colors.red,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM);
          }
        }
      }

      return totalScore;
    } catch (e) {
      Get.snackbar('Error', "Error while fetching score.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return 0;
    }
  }

  Future<int?> fetchUserCfq() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        Map<String, dynamic>? surveyresults =
            userData['survey_results'] as Map<String, dynamic>?;

        for (var e in surveyresults!.entries) {
          if (e.value != null && e.value.containsKey('rating')) {
            cfq = (cfq + e.value['rating'] as int?)!;
          }
        }
        return cfq as int?;
      }

      return 0;
    } catch (e) {
      Get.snackbar('Error', "While fetching cfq.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return 0;
    }
  }
}
