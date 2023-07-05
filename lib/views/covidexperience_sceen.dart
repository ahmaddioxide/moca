import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/symptoms_initial_illness_screen.dart';
import '../controllers/covidexperience_controller.dart';

class CovidExperienceScreen extends StatefulWidget {
  const CovidExperienceScreen({super.key});

  @override
  _CovidExperienceScreenState createState() => _CovidExperienceScreenState();
}

class _CovidExperienceScreenState extends State<CovidExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool _isloading = false;

  // Create an instance of the controller
  final CovidExperienceController _controller =
      Get.put(CovidExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Covid Experience Data',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Have you had COVID-19? ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Yes',
                          groupValue: _controller.covid,
                          onChanged: (value) {
                            setState(() {
                              _controller.covid = value!;
                              isVisible = true;
                            });
                          },
                        ),
                        const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Radio(
                          value: 'No',
                          groupValue: _controller.covid,
                          onChanged: (value) {
                            setState(() {
                              _controller.covid = value!;
                              isVisible = false;
                              if (isVisible == false) {
                                _controller.pcrTest = 'none';
                                _controller.result = 'none';
                              }
                            });
                          },
                        ),
                        const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    /////Q2
                    Visibility(
                      visible: isVisible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Divider(
                            color: Colors.black12,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'If yes, did you get your PCR test done?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'Yes',
                                groupValue: _controller.pcrTest,
                                onChanged: (value) {
                                  setState(() {
                                    _controller.pcrTest = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _controller.pcrTest,
                                onChanged: (value) {
                                  setState(() {
                                    _controller.pcrTest = value!;
                                  });
                                },
                              ),
                              const Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          /////Q2
                          const SizedBox(height: 16),
                          const Divider(
                            color: Colors.black12,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'If yes, what were the results?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'Positive',
                                groupValue: _controller.result,
                                onChanged: (value) {
                                  setState(() {
                                    _controller.result = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Positive',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Radio(
                                value: 'Negative',
                                groupValue: _controller.result,
                                onChanged: (value) {
                                  setState(() {
                                    _controller.result = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Negative',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ////////Q4
                    const SizedBox(height: 16),
                    const Divider(
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'If you did not get your PCR test done, how do you know you have had COVID-19?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Please share your Experience',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _controller.pcrTestDetails = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please share your Experience';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'How long has it been since you first started to feel ill or tested positive? ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Less than 3 months',
                              groupValue: _controller.duration,
                              onChanged: (value) {
                                setState(() {
                                  _controller.duration = value!;
                                });
                              },
                            ),
                            const Text(
                              'Less than 3 months',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: '3 months',
                              groupValue: _controller.duration,
                              onChanged: (value) {
                                setState(() {
                                  _controller.duration = value!;
                                });
                              },
                            ),
                            const Text(
                              '3 months',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: '3 to 6 Months',
                              groupValue: _controller.duration,
                              onChanged: (value) {
                                setState(() {
                                  _controller.duration = value!;
                                });
                              },
                            ),
                            const Text(
                              '3 to 6 Months',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: '6 to 9 Months',
                              groupValue: _controller.duration,
                              onChanged: (value) {
                                setState(() {
                                  _controller.duration = value!;
                                });
                              },
                            ),
                            const Text(
                              '6 to 9 Months',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'More than 9 Months',
                              groupValue: _controller.duration,
                              onChanged: (value) {
                                setState(() {
                                  _controller.duration = value!;
                                });
                              },
                            ),
                            const Text(
                              'More than 9 Months',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'How would you describe your experience with COVID-19 in the first 4 weeks? ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Asymptomatic',
                              groupValue: _controller.first4weeks,
                              onChanged: (value) {
                                setState(() {
                                  _controller.first4weeks = value!;
                                });
                              },
                            ),
                            const Text(
                              'Asymptomatic',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'Mild',
                              groupValue: _controller.first4weeks,
                              onChanged: (value) {
                                setState(() {
                                  _controller.first4weeks = value!;
                                });
                              },
                            ),
                            const Text(
                              'Mild',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'Moderate',
                              groupValue: _controller.first4weeks,
                              onChanged: (value) {
                                setState(() {
                                  _controller.first4weeks = value!;
                                });
                              },
                            ),
                            const Text(
                              'Moderate',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'Severe (hospitalized/oxygen therapy)',
                              groupValue: _controller.first4weeks,
                              onChanged: (value) {
                                setState(() {
                                  _controller.first4weeks = value!;
                                });
                              },
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Severe (hospitalized/oxygen',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Text(
                                  'therapy)',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                              value:
                                  'Critically severe (ICU/mechanical ventilation)',
                              groupValue: _controller.first4weeks,
                              onChanged: (value) {
                                setState(() {
                                  _controller.first4weeks = value!;
                                });
                              },
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Critically severe(ICU/mechanical',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Text(
                                  'ventilation)',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'How would you describe your experience with COVID-19 after the first 4 weeks? ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'I recovered completely  ',
                              groupValue: _controller.week4Experience,
                              onChanged: (value) {
                                setState(() {
                                  _controller.week4Experience = value!;
                                });
                              },
                            ),
                            const Text(
                              'I recovered completely',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'I have ongoing, mild/ moderate symptoms',
                              groupValue: _controller.week4Experience,
                              onChanged: (value) {
                                setState(() {
                                  _controller.week4Experience = value!;
                                });
                              },
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'I have ongoing, mild',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Text(
                                  '/ moderate symptoms',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'I have ongoing, severe symptoms',
                              groupValue: _controller.week4Experience,
                              onChanged: (value) {
                                setState(() {
                                  _controller.week4Experience = value!;
                                });
                              },
                            ),
                            const Text(
                              'I have ongoing, severe symptoms',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              try {
                                setState(() {
                                  _isloading = true;
                                });
                                if (_formKey.currentState!.validate() &&
                                    _controller.covid != '' &&
                                    _controller.pcrTest != '' &&
                                    _controller.result != '' &&
                                    _controller.duration != '' &&
                                    _controller.first4weeks != '' &&
                                    _controller.week4Experience != '' &&
                                    _controller.pcrTestDetails != '') {
                                  _controller
                                      .submitFormMethod(
                                    pcrTest: _controller.pcrTest,
                                    covid: _controller.covid,
                                    result: _controller.result,
                                    duration: _controller.duration,
                                    first4weeks: _controller.first4weeks,
                                    week4Experience:
                                        _controller.week4Experience,
                                    pcrTestDetails: _controller.pcrTestDetails,
                                  )
                                      .then((value) {
                                    if (value == true) {
                                      setState(() {
                                        _isloading = false;
                                      });
                                      Get.offAll(
                                        () =>
                                            const SymptomsInitialIllnessScreen(),
                                      );
                                    }
                                  });
                                } else {
                                  setState(() {
                                    _isloading = false;
                                  });
                                  Get.snackbar(
                                    'Missing Fields',
                                    'Please fill all the fields',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              } catch (e) {
                                setState(() {
                                  _isloading = false;
                                });
                                debugPrint('Error: $e');
                                Get.snackbar(
                                  'Error',
                                  'Error: $e',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
