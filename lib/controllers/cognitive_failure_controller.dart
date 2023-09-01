import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class CognitiveFailureController extends GetxController {
  RxList<int> ratings = List<int>.filled(25, 0).obs;

  void setRating(int index, int rating) {
    ratings[index] = rating;
    update(); // Notify GetX that the ratings list has changed
  }

  Future<bool> submitSurvey() async {
    ///storing page info if page has been used of user in firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .set({
      'pages': FieldValue.arrayUnion(['survey_results']),
    }, SetOptions(merge: true));
    ////storing data of user in firestore
    //const currentUser = 'current_user'; // Replace with the current user ID

    // Create a new document for the current user
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(currentUser!.uid);

    // Save the ratings to the Firestore document
    //for (int i = 0; i < ratings.length; i++) {
    //final rating = ratings[i];
    try {
      await userDocRef.update({
        'survey_results': {
          '0': {
            'question': getQuestion(0),
            'rating': ratings[0],
          },
          '1': {
            'question': getQuestion(1),
            'rating': ratings[1],
          },
          '2': {
            'question': getQuestion(2),
            'rating': ratings[2],
          },
          '3': {
            'question': getQuestion(3),
            'rating': ratings[3],
          },
          '4': {
            'question': getQuestion(4),
            'rating': ratings[4],
          },
          '5': {
            'question': getQuestion(5),
            'rating': ratings[5],
          },
          '6': {
            'question': getQuestion(6),
            'rating': ratings[6],
          },
          '7': {
            'question': getQuestion(7),
            'rating': ratings[7],
          },
          '8': {
            'question': getQuestion(8),
            'rating': ratings[8],
          },
          '9': {
            'question': getQuestion(9),
            'rating': ratings[9],
          },
          '10': {
            'question': getQuestion(10),
            'rating': ratings[10],
          },
          '11': {
            'question': getQuestion(11),
            'rating': ratings[11],
          },
          '12': {
            'question': getQuestion(12),
            'rating': ratings[12],
          },
          '13': {
            'question': getQuestion(13),
            'rating': ratings[13],
          },
          '14': {
            'question': getQuestion(14),
            'rating': ratings[14],
          },
          '15': {
            'question': getQuestion(15),
            'rating': ratings[15],
          },
          '16': {
            'question': getQuestion(16),
            'rating': ratings[16],
          },
          '17': {
            'question': getQuestion(17),
            'rating': ratings[17],
          },
          '18': {
            'question': getQuestion(18),
            'rating': ratings[18],
          },
          '19': {
            'question': getQuestion(19),
            'rating': ratings[19],
          },
          '20': {
            'question': getQuestion(20),
            'rating': ratings[20],
          },
          '21': {
            'question': getQuestion(21),
            'rating': ratings[21],
          },
          '22': {
            'question': getQuestion(22),
            'rating': ratings[22],
          },
          '23': {
            'question': getQuestion(23),
            'rating': ratings[23],
          },
          '24': {
            'question': getQuestion(24),
            'rating': ratings[24],
          },
        }
      });
    } catch (e) {
      Get.snackbar(
        'Attention!',
        'An error occurred while submitting the survey',
        titleText: const Text(
          'Attention!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade500,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );
    }

    // Reset the ratings after submission
    ratings.clear();
    ratings.addAll(List<int>.filled(25, 0));

    // Show a success message or navigate to the next screen

    Get.snackbar(
      'Survey Submitted!',
      'Thank you for completing the survey!',
      titleText: const Text(
        'Survey Submitted!',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade500,
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
    );
    return true;
  }

  String getQuestion(int index) {
    // Add your questions here
    List<String> questions = [
      'Do you read something and find you haven\'t been thinking about it and must read it again?',
      'Do you find you forget why you went from one part of the house to the other?',
      'Do you fail to notice signposts on the road?',
      'Do you find you confuse right and left when giving directions?',
      'Do you bump into people?',
      'Do you find you forget whether you\'ve turned off a light or a fire or locked the door?',
      'Do you fail to listen to people\'s names when you are meeting them?',
      'Do you say something and realize afterwards that it might be taken as insulting?',
      'Do you fail to hear people speaking to you when you are doing something else?',
      'Do you lose your temper and regret it?',
      'Do you leave important letters unanswered for days?',
      'Do you find you forget which way to turn on a road you know well but rarely use?',
      'Do you fail to see what you want in a supermarket (although it\'s there)?',
      'Do you find yourself suddenly wondering whether you\'ve used a word correctly?',
      'Do you have trouble making up your mind?',
      'Do you find you forget appointments?',
      'Do you forget where you put something like a newspaper or a book?',
      'Do you find you accidentally throw away the thing you want and keep what you meant to throw away -- as in the example of throwing away the matchbox and putting the used match in your pocket?',
      'Do you daydream when you ought to be listening to something?',
      'Do you find you forget people\'s names?',
      'Do you start doing one thing at home and get distracted into doing something else (unintentionally)?',
      'Do you find you can\'t quite remember something although it\'s "on the tip of your tongue"?',
      'Do you find you forget what you came to the shops to buy?',
      'Do you drop things?',
      'Do you find you can\'t think of anything to say?',
    ];

    if (index >= 0 && index < questions.length) {
      return questions[index];
    }
    return '';
  }

  String getRatingLabel(int rating) {
    // Add your rating labels here
    List<String> ratingLabels = [
      '0',
      '1',
      '2',
      '3',
      '4',
    ];

    if (rating >= 0 && rating < ratingLabels.length) {
      return ratingLabels[rating];
    }
    return '';
  }
}
