import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cognitive_failure_controller.dart';

class CognitiveFailure extends StatelessWidget {
  final CognitiveFailureController _cognitiveFailureController = Get.put(CognitiveFailureController());

  CognitiveFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cognitive Failure Questionnaire'),
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
                          '${i + 1}. ${_cognitiveFailureController.getQuestion(i)}',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int rating = 0; rating <= 4; rating++) ...[
                                Row(
                                  children: [
                                    Radio<int>(
                                      value: rating,
                                      groupValue: _cognitiveFailureController.ratings[i],
                                      onChanged: (value) {
                                        _cognitiveFailureController.setRating(i, value!);
                                      },
                                    ),
                                    Text(_cognitiveFailureController
                                        .getRatingLabel(rating)),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        )
                      ],
                      SizedBox(height: screenHeight * 0.02),
                      ElevatedButton(
                        onPressed: () {
                          _cognitiveFailureController.submitSurvey();
                        },
                        child: const Text('Submit'),
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
}
