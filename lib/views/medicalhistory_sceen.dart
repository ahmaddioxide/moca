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
        title: const Center(
            child: Text(
          'Medical History Data',
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
                const SizedBox(height: 16),
                const Text(
                  'What does your diet typically consist of? ',
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
                          value: 'Grains: bread, cereal, rice, pasta',
                          groupValue: _controller.diet,
                          onChanged: (value) {
                            setState(() {
                              _controller.diet = value!;
                            });
                          },
                        ),
                        const Text(
                          'Grains: bread, cereal, rice, pasta',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Dairy: milk, yoghurt, cheese',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Vegetables and fruits',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Fats, oils and sugars',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Red meat, poultry, fish,eggs, beans',
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
                /////////////2
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'How would you rate your physical activity level on the following scale?  ',
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
                          value: 'Rarely to never',
                          groupValue: _controller.physicalActivity,
                          onChanged: (value) {
                            setState(() {
                              _controller.physicalActivity = value!;
                            });
                          },
                        ),
                        const Text(
                          'Rarely to never',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Occasional, light to moderate activity',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Regular, light to moderate activity',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Regular, vigorous activity',
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
                /////////////Q3
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Do you smoke?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
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
                        const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                  ],
                ),
                /////////////Q4
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Do you have any medical condition/ chronic illness?',
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
                          value: 'High blood pressure',
                          groupValue: _controller.medicalCondition,
                          onChanged: (value) {
                            setState(() {
                              _controller.medicalCondition = value!;
                            });
                          },
                        ),
                        const Text(
                          'High blood pressure',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Asthma',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Heart disease',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Mental health disorder',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Diabetes',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Obesity',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Kidney disease',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'None',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        const Text(
                          'Other',
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
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_controller.diet != '' &&
                          _controller.physicalActivity != '' &&
                          _controller.smoke != '' &&
                          _controller.medicalCondition != '') {
                        _controller
                            .submitForm(
                                diet: _controller.diet,
                                physicalActivity: _controller.physicalActivity,
                                smoke: _controller.smoke,
                                medicalCondition: _controller.medicalCondition)
                            .then((value) {
                          if (value == true) {
                            Get.offAll(
                              () => const CovidExperienceScreen(),
                            );
                          }
                        });
                      } else {
                        Get.snackbar(
                          'Error',
                          'Complete the Form !',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
