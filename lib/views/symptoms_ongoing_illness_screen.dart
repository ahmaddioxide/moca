import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/cognitive_failure_screen.dart';
import '../controllers/symptoms_ongoing_illness_controller.dart';

class SymptomsOnGoingIllnessScreen extends StatefulWidget {
  const SymptomsOnGoingIllnessScreen({super.key});
  @override
  _SymptomsOnGoingIllnessScreenState createState() =>
      _SymptomsOnGoingIllnessScreenState();
}

class _SymptomsOnGoingIllnessScreenState
    extends State<SymptomsOnGoingIllnessScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;
  // Create an instance of the controller
  final SymptomsOnGoingIllnessController _controller =
      Get.put(SymptomsOnGoingIllnessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'COVID-19 SYMPTOMS',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Symptoms during the OnGoing illness (After first 4 weeks) ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    const Text(
                      'Cough',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.cough,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.cough = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Breathing Issues',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.breathingIssues,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.breathingIssues = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Chest Pain',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.chestPain,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.chestPain = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Irregular Pulse',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.irregularPulse,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.irregularPulse = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Itechy/Red/Dry Eyes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.itchyRedDryEyes,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.itchyRedDryEyes = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Head Aches',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.headAche,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.headAche = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Loss Of Smell/Taste',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.lossOfSmelltaste,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.lossOfSmelltaste = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Blurred Vision',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.blurredVision,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.blurredVision = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Hallucinations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.hallucinations,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.hallucinations = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Confusion',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.confusion,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.confusion = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Forgetfulness',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.forgetfulness,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.forgetfulness = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Delayed Thinking',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.delayedThinking,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.delayedThinking = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Poor Concentration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.poorConcentration,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.poorConcentration = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Difficult Speaking',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.difficultSpeaking,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.difficultSpeaking = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Difficult Sleeping',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.difficultSleeping,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.difficultSleeping = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Depression/Anxiety',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.depressionAnxiety,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.depressionAnxiety = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Numbness',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.numbness,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.numbness = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Fatigue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.fatigue,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.fatigue = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Body Pain',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.bodyPain,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.bodyPain = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Nausea',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.nausea,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.nausea = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Abdominal Pain',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.abdominalPain,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.abdominalPain = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Loss Of Appetite',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButton(
                          //isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.lossOfAppetite,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.lossOfAppetite = value!;
                              },
                            );
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'None',
                              child: Text('None'),
                            ),
                            DropdownMenuItem(
                              value: 'Mild',
                              child: Text('Mild'),
                            ),
                            DropdownMenuItem(
                              value: 'Moderate',
                              child: Text('Moderate'),
                            ),
                            DropdownMenuItem(
                              value: 'Severe',
                              child: Text('Severe'),
                            ),
                            DropdownMenuItem(
                              value: 'Very Severe',
                              child: Text('Very Severe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isloading = true;
                          });
                          try {
                            if (_formKey.currentState!.validate()) {
                              _controller
                                  .signUpMethod(
                                cough: _controller.cough,
                                breathingIssues: _controller.breathingIssues,
                                chestPain: _controller.chestPain,
                                irregularPulse: _controller.irregularPulse,
                                itchyRedDryEyes: _controller.itchyRedDryEyes,
                                headAche: _controller.headAche,
                                lossOfSmelltaste: _controller.lossOfSmelltaste,
                                blurredVision: _controller.blurredVision,
                                hallucinations: _controller.hallucinations,
                                confusion: _controller.confusion,
                                forgetfulness: _controller.forgetfulness,
                                delayedThinking: _controller.delayedThinking,
                                depressionAnxiety:
                                    _controller.depressionAnxiety,
                                poorConcentration:
                                    _controller.poorConcentration,
                                difficultSleeping:
                                    _controller.difficultSleeping,
                                difficultSpeaking:
                                    _controller.difficultSpeaking,
                                numbness: _controller.numbness,
                                fatigue: _controller.fatigue,
                                bodyPain: _controller.bodyPain,
                                nausea: _controller.nausea,
                                abdominalPain: _controller.abdominalPain,
                                lossOfAppetite: _controller.lossOfAppetite,
                              )
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    _isloading = false;
                                  });
                                  Get.offAll(
                                    () => const CognitiveFailure(),
                                  );
                                }
                              });
                            } else {
                              setState(() {
                                _isloading = false;
                              });
                            }
                          } catch (e) {
                            setState(() {
                              _isloading = false;
                            });
                            debugPrint('Error: $e');
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
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                      backgroundColor: Colors.blue,
                                      strokeWidth: 4,
                                    ),
                                  )
                                ],
                              )
                            : const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
