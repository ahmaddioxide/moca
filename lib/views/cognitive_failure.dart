import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<int> ratings = List<int>.filled(25, 0); // List to store the ratings for each question

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cognitive Failure Questionnaire'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please rate the frequency of the following events in the past six months using the scale below:',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Text(
                  '1 = Never',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '2 = Rarely',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '3 = Sometimes',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
              ],

            ),
            Row(
              children: [
                Text(
                  '4 = Often',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '5 = Very Often',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
            ),
           SizedBox(height: screenHeight * 0.02),
           Expanded(
             child: Scrollbar(
               thickness: screenWidth * 0.03,
               radius: Radius.circular(screenWidth * 0.02),

               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     for (int i = 0; i < 25; i++) ...[
                       SizedBox(height: screenHeight * 0.02),
                       Text(
                         '${i + 1}. ${getQuestion(i)}',
                         style: TextStyle(fontSize: screenWidth * 0.04),
                       ),
                       SizedBox(height: screenHeight * 0.01),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           for (int rating = 0; rating <= 4; rating++) ...[
                             Row(
                               children: [
                                 Radio<int>(
                                   value: rating,
                                   groupValue: ratings[i],
                                   onChanged: (value) {
                                     setState(() {
                                       ratings[i] = value!;
                                     });
                                   },
                                 ),
                                 Text(getRatingLabel(rating)),
                               ],
                             ),
                           ],
                         ],
                       ),
                     ],
                     SizedBox(height: screenHeight * 0.02),
                     ElevatedButton(
                       onPressed: () {
                         // Print the ratings for each question
                         for (int i = 0; i < 25; i++) {
                           print('Question ${i + 1}: ${ratings[i]}');
                         }
                       },
                       child: Text('Submit'),
                     ),
                   ],
                 ),
               ),
             ),
           ),
          ],
        ),
      ),
    );
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

