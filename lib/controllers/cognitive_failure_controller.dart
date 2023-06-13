import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  RxList<int> ratings = List<int>.filled(25, 0).obs;

  void setRating(int index, int rating) {
    ratings[index] = rating;
    update(); // Notify GetX that the ratings list has changed
  }

  void submitSurvey() async {
    const currentUser = 'current_user'; // Replace with the current user ID

    // Create a new document for the current user
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(currentUser);

    // Save the ratings to the Firestore document
    for (int i = 0; i < ratings.length; i++) {
      final rating = ratings[i];
      await userDocRef.collection('survey_results').doc('question_$i').set({
        'question': getQuestion(i),
        'rating': rating,
      });
    }

    // Reset the ratings after submission
    ratings.clear();
    ratings.addAll(List<int>.filled(25, 0));

    // Show a success message or navigate to the next screen
    Get.snackbar('Survey Submitted', 'Thank you for completing the survey!');
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
      '1',
      '2',
      '3',
      '4',
      '5',
    ];

    if (rating >= 0 && rating < ratingLabels.length) {
      return ratingLabels[rating];
    }
    return '';
  }
}
