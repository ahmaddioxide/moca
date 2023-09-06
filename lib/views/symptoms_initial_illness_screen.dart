import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/cognitive_failure_screen.dart';
import '../controllers/symptoms_initial_illness_controller.dart';

class SymptomsInitialIllnessScreen extends StatefulWidget {
  const SymptomsInitialIllnessScreen({super.key});
  @override
  _SymptomsInitialIllnessScreenState createState() =>
      _SymptomsInitialIllnessScreenState();
}

class _SymptomsInitialIllnessScreenState
    extends State<SymptomsInitialIllnessScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;
  // Create an instance of the controller
  final SymptomsInitialIllnessController _controller =
      Get.put(SymptomsInitialIllnessController());

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
                  'Report the severity of the following symptoms on the given scale by checking the relevant boxes.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 28),
                //fever
                Row(
                  children: [
                    const Text(
                      'Fever',
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
                          value: _controller.fever,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.fever = value!;
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
                ////coungh
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
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
                ////Runny/Stuffy Nose
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Runny/Stuffy Nose',
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
                          value: _controller.runnyStuffyNose,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.runnyStuffyNose = value!;
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
                /////Sore Throat
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      'Sore Throat',
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
                          value: _controller.soreThroat,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.soreThroat = value!;
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
                ////Breathing Issues
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
                ////Chest Pain/Tightness
                const SizedBox(height: 8),
                const Divider(color: Colors.black12),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Chest Pain/Tightness',
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
                            fontSize: 16,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                          value: _controller.chestPainTightness,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.chestPainTightness = value!;
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
                ////Palpitations
                Row(
                  children: [
                    const Text(
                      'Palpitations',
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
                          value: _controller.palpitations,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.palpitations = value!;
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
                //////Itchy/Red/Dry Eyes
                Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Itchy/Red/Dry Eyes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
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

                ///Headaches
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
                          value: _controller.headAches,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.headAches = value!;
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
                ////Loss of Smell/taste
                Row(
                  children: [
                    const Text(
                      'Loss of Smell/taste',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                ////forgetfulness
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
                /////Delayed Thinking
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
                          value: _controller.delayedthinking,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.delayedthinking = value!;
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
                      'Difficult Sleepy',
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
                          value: _controller.difficultSleepy,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.difficultSleepy = value!;
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
                        'Depression / Anxiety',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
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
                      'Difficulty speaking ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.difficultySpeaking,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.difficultySpeaking = value!;
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
                    const SizedBox(width: 10),
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
                      'Muscle/Body Pain',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.muscleBodyPain,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.muscleBodyPain = value!;
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
                      'Nausea/vomiting',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.nauseaVomiting,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.nauseaVomiting = value!;
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
                      'Poor concentration',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.poorconcentration,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.poorconcentration = value!;
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
                      'Diarrhea',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.diarrhea,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.diarrhea = value!;
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
                      'Blisters',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.blisters,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.blisters = value!;
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
                    const SizedBox(width: 10),
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
                Row(
                  children: [
                    const Text(
                      'Ulcers/Sores ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.ucersSores,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.ucersSores = value!;
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
                      'Rash',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.rash,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.rash = value!;
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
                      'Stomach ache',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.stomachAche,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.stomachAche = value!;
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
                      'Itchy/swollen skin',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          value: _controller.itchySwollenSkin,
                          onChanged: (value) {
                            setState(
                              () {
                                _controller.itchySwollenSkin = value!;
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
                const SizedBox(height: 16),
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
                                fever: _controller.fever,
                                cough: _controller.cough,
                                runnyStuffyNose: _controller.runnyStuffyNose,
                                soreThroat: _controller.soreThroat,
                                breathingIssues: _controller.breathingIssues,
                                chestPainTightness:
                                    _controller.chestPainTightness,
                                palpitations: _controller.palpitations,
                                itchyRedDryEyes: _controller.itchyRedDryEyes,
                                headAches: _controller.headAches,
                                lossOfSmelltaste: _controller.lossOfSmelltaste,
                                forgetfulness: _controller.forgetfulness,
                                delayedthinking: _controller.delayedthinking,
                                confusion: _controller.confusion,
                                difficultSleepy: _controller.difficultSleepy,
                                depressionAnxiety:
                                    _controller.depressionAnxiety,
                                difficultySpeaking:
                                    _controller.difficultySpeaking,
                                fatigue: _controller.fatigue,
                                muscleBodyPain: _controller.muscleBodyPain,
                                nauseaVomiting: _controller.nauseaVomiting,
                                poorconcentration:
                                    _controller.poorconcentration,
                                diarrhea: _controller.diarrhea,
                                blisters: _controller.blisters,
                                lossOfAppetite: _controller.lossOfAppetite,
                                ucersSores: _controller.ucersSores,
                                rash: _controller.rash,
                                stomachAche: _controller.stomachAche,
                                itchySwollenSkin: _controller.itchySwollenSkin,
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
                            debugPrint('LoginCalled() called Error "$e"');
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
