import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/cognitive_failure_controller.dart';

class CognitiveFailure extends StatefulWidget {
  const CognitiveFailure({super.key});

  @override
  State<CognitiveFailure> createState() => _CognitiveFailureState();
}

class _CognitiveFailureState extends State<CognitiveFailure> {
  final CognitiveFailureController _cognitiveFailureController =
      Get.put(CognitiveFailureController());

  bool _isloading = false;
  late SharedPreferences sf;
  @override
  initState() {
    super.initState();
    initalizeSharedPref();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

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
              style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Text(
                  '0 = Never',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '1 = Rarely',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '2 = Sometimes',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
              ],
            ),
            Row(
              children: [
                Text(
                  '3 = Often',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '4 = Very Often',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Divider(thickness: screenWidth * 0.01),
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
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.deepPurple),
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
                                      groupValue: _cognitiveFailureController
                                          .ratings[i],
                                      onChanged: (value) {
                                        _cognitiveFailureController.setRating(
                                            i, value!);
                                      },
                                    ),
                                    Text(_cognitiveFailureController
                                        .getRatingLabel(rating)),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: Colors.black12),
                        const SizedBox(height: 8),
                      ],
                      SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _isloading = true;
                            });
                            try {
                              await _cognitiveFailureController
                                  .submitSurvey()
                                  .then((value) {
                                if (value) {
                                  setState(() {
                                    _isloading = false;
                                  });
                                  Get.offAll(() => const HomeScreen());
                                }
                              });
                            } catch (e) {
                              setState(() {
                                _isloading = false;
                              });
                              Get.snackbar(
                                'Attention!',
                                'Some Error Occured!',
                                titleText: const Text(
                                  'Attention!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red.shade500,
                                colorText: Colors.white,
                                snackStyle: SnackStyle.FLOATING,
                              );
                            }
                          },
                          child: _isloading == true
                              ? const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Loading",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                        backgroundColor: Colors.blue,
                                        strokeWidth: 4,
                                      ),
                                    )
                                  ],
                                )
                              : const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
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
