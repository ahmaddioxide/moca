import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/covidexperience_controller.dart';

class CovidExperienceScreen extends StatefulWidget {
  const CovidExperienceScreen({super.key});
  @override
  _CovidExperienceScreenState createState() => _CovidExperienceScreenState();
}

class _CovidExperienceScreenState extends State<CovidExperienceScreen> {
  final _formKey = GlobalKey<FormState>();

  // Create an instance of the controller
  final CovidExperienceController _controller =
      Get.put(CovidExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socio-Demographic Data'),
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
                /////Q1
                const SizedBox(height: 16),
                const Text(
                  '1. Have you had COVID-19? ',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: _controller.covid,
                      onChanged: (value) {
                        setState(() {
                          _controller.covid = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                    Radio(
                      value: 'No',
                      groupValue: _controller.covid,
                      onChanged: (value) {
                        setState(() {
                          _controller.covid = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
                /////Q2
                const Divider(),
                const SizedBox(height: 16),
                const Text(
                  '2. If yes, did you get your PCR test done?',
                  style: TextStyle(fontSize: 18),
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
                    const Text('Yes'),
                    Radio(
                      value: 'No',
                      groupValue: _controller.pcrTest,
                      onChanged: (value) {
                        setState(() {
                          _controller.pcrTest = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
                /////Q2
                const Divider(),
                const SizedBox(height: 16),
                const Text(
                  '3. If yes, what were the results?',
                  style: TextStyle(fontSize: 18),
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
                    const Text('Positive'),
                    Radio(
                      value: 'Negative',
                      groupValue: _controller.result,
                      onChanged: (value) {
                        setState(() {
                          _controller.result = value!;
                        });
                      },
                    ),
                    const Text('Negative'),
                  ],
                ),
                ////////Q4
                const Divider(),
                const Text(
                  '4. If you did not get your PCR test done, how do you know you have had COVID-19?',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
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
                //////Q5
                const Divider(),
                const Text(
                  '5. How long has it been since you first started to feel ill or tested positive? ',
                  style: TextStyle(fontSize: 18),
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
                        const Text('Less than 3 months'),
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
                        const Text('3 months'),
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
                        const Text('3 to 6 Months'),
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
                        const Text('6 to 9 Months'),
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
                        const Text('More than 9 Months'),
                      ],
                    ),
                  ],
                ),
                //////Q7
                const Divider(),
                const Text(
                  '6.How would you describe your experience with COVID-19 in the first 4 weeks? ',
                  style: TextStyle(fontSize: 18),
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
                        const Text('Asymptomatic'),
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
                        const Text('Mild'),
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
                        const Text('Moderate'),
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
                        const Text('Severe (hospitalized/oxygen therapy)'),
                      ],
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
                        const Text(
                            'Critically severe (ICU/mechanical ventilation)'),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                const Text(
                  '7.How would you describe your experience with COVID-19 after the first 4 weeks? ',
                  style: TextStyle(fontSize: 18),
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
                        const Text('I recovered completely  '),
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
                        const Text('I have ongoing, mild/ moderate symptoms'),
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
                        const Text('I have ongoing, severe symptoms'),
                      ],
                    ),
                  ],
                ),
                //////
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _controller.submitForm();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
