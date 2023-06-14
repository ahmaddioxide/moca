import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/covidexperience_sceen.dart';
import '../controllers/medicalhistory_controller.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});
  @override
  _MedicalHistoryScreenState createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  final _formKey = GlobalKey<FormState>();

  // Create an instance of the controller
  final MedicalHistoryController _controller =
      Get.put(MedicalHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical History Data'),
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
                const SizedBox(height: 16),
                const Text(
                  '1. What does your diet typically consist of? ',
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Grains: bread, cereal, rice, pasta',
                          groupValue: _controller.diet,
                          onChanged: (value) {
                            setState(() {
                              _controller.diet = value!;
                            });
                          },
                        ),
                        const Text('Grains: bread, cereal, rice, pasta'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Dairy: milk, yoghurt, cheese',
                          groupValue: _controller.diet,
                          onChanged: (value) {
                            setState(() {
                              _controller.diet = value!;
                            });
                          },
                        ),
                        const Text('Dairy: milk, yoghurt, cheese'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Vegetables and fruits',
                          groupValue: _controller.diet,
                          onChanged: (value) {
                            setState(() {
                              _controller.diet = value!;
                            });
                          },
                        ),
                        const Text('Vegetables and fruits'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Fats, oils and sugars',
                          groupValue: _controller.diet,
                          onChanged: (value) {
                            setState(() {
                              _controller.diet = value!;
                            });
                          },
                        ),
                        const Text('Fats, oils and sugars'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value:
                              'Protein: red meat, poultry, fish, eggs, beans',
                          groupValue: _controller.diet,
                          onChanged: (value) {
                            setState(() {
                              _controller.diet = value!;
                            });
                          },
                        ),
                        const Text(
                            'Protein: red meat, poultry, fish, eggs, beans'),
                      ],
                    ),
                  ],
                ),
                /////////////2
                const Divider(),
                const Text(
                  '2. How would you rate your physical activity level on the following scale?  ',
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Rarely to never',
                          groupValue: _controller.physicalActivity,
                          onChanged: (value) {
                            setState(() {
                              _controller.physicalActivity = value!;
                            });
                          },
                        ),
                        const Text('Rarely to never'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Occasional, light to moderate activity',
                          groupValue: _controller.physicalActivity,
                          onChanged: (value) {
                            setState(() {
                              _controller.physicalActivity = value!;
                            });
                          },
                        ),
                        const Text('Occasional, light to moderate activity'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Regular, light to moderate activity',
                          groupValue: _controller.physicalActivity,
                          onChanged: (value) {
                            setState(() {
                              _controller.physicalActivity = value!;
                            });
                          },
                        ),
                        const Text('Regular, light to moderate activity'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Regular, vigorous activity',
                          groupValue: _controller.physicalActivity,
                          onChanged: (value) {
                            setState(() {
                              _controller.physicalActivity = value!;
                            });
                          },
                        ),
                        const Text('Regular, vigorous activity'),
                      ],
                    ),
                  ],
                ),
                /////////////Q3
                const Divider(),
                const Text(
                  '3. Do you smoke?',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Yes',
                          groupValue: _controller.smoke,
                          onChanged: (value) {
                            setState(() {
                              _controller.smoke = value!;
                            });
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'No',
                          groupValue: _controller.smoke,
                          onChanged: (value) {
                            setState(() {
                              _controller.smoke = value!;
                            });
                          },
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
                /////////////Q4
                const Divider(),
                const Text(
                  '4. Do you have any medical condition/ chronic illness?',
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'High blood pressure',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('High blood pressure'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Asthma',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Asthma'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Heart disease',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Heart disease'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Mental health disorder',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Mental health disorder'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Diabetes',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Diabetes'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Obesity',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Obesity'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Kidney disease',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Kidney disease'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'None',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('None'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Other',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text('Other'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _controller.submitForm(
                          diet: _controller.diet,
                          physicalActivity: _controller.physicalActivity,
                          smoke: _controller.smoke,
                          medicalCondition: _controller.medicalCondition);
                    }
                    Get.to(() => const CovidExperienceScreen());
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
