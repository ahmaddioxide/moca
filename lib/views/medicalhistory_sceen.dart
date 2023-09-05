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
  bool _isloading = false;
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
                  'What does your diet typically consist of? (you may choose multiple options)',
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
                          groupValue: _controller.diet1,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.diet1 != value) {
                                _controller.diet1 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.diet1 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.diet2,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.diet2 != value) {
                                _controller.diet2 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.diet2 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.diet3,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.diet3 != value) {
                                _controller.diet3 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.diet3 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.diet4,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.diet4 != value) {
                                _controller.diet4 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.diet4 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.diet5,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.diet5 != value) {
                                _controller.diet5 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.diet5 =
                                    null; // Select if not selected
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Red meat, poultry, fish,eggs, \nbeans',
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
                          'Occasional, light to moderate \nactivity',
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
                /////////////Alcohol
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Do you consume alcohol?',
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
                          groupValue: _controller.alcohol,
                          onChanged: (value) {
                            setState(() {
                              _controller.alcohol = value!;
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
                          groupValue: _controller.alcohol,
                          onChanged: (value) {
                            setState(() {
                              _controller.alcohol = value!;
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
                  '.Do you have any medical condition/ chronic illness? (you may choose multiple options)',
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
                          groupValue: _controller.medicalCondition1,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition1 != value) {
                                _controller.medicalCondition1 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition1 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition2,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition2 != value) {
                                _controller.medicalCondition2 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition2 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition3,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition3 != value) {
                                _controller.medicalCondition3 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition3 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition4,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition4 != value) {
                                _controller.medicalCondition4 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition4 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition5,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition5 != value) {
                                _controller.medicalCondition5 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition5 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition6,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition6 != value) {
                                _controller.medicalCondition6 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition6 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition7,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition7 != value) {
                                _controller.medicalCondition7 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition7 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition8,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition8 != value) {
                                _controller.medicalCondition8 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition8 =
                                    null; // Select if not selected
                              }
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
                          groupValue: _controller.medicalCondition9,
                          toggleable: true,
                          onChanged: (value) {
                            setState(() {
                              if (_controller.medicalCondition9 != value) {
                                _controller.medicalCondition9 =
                                    value; // Deselect if already selected
                              } else {
                                _controller.medicalCondition9 =
                                    null; // Select if not selected
                              }
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
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepPurple,
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
                          if ((_controller.diet5 != '' ||
                                  _controller.diet4 != '' ||
                                  _controller.diet3 != '' ||
                                  _controller.diet1 != '' ||
                                  _controller.diet2 != '') &&
                              _controller.physicalActivity != '' &&
                              _controller.smoke != '' &&
                              _controller.alcohol != '' &&
                              (_controller.medicalCondition1 != '' ||
                                  _controller.medicalCondition2 != '' ||
                                  _controller.medicalCondition3 != '' ||
                                  _controller.medicalCondition4 != '' ||
                                  _controller.medicalCondition5 != '' ||
                                  _controller.medicalCondition6 != '' ||
                                  _controller.medicalCondition7 != '' ||
                                  _controller.medicalCondition8 != '' ||
                                  _controller.medicalCondition9 != '')) {
                            _controller
                                .submitForm(
                              diet1: _controller.diet1,
                              diet2: _controller.diet2,
                              diet3: _controller.diet3,
                              diet4: _controller.diet4,
                              diet5: _controller.diet5,
                              physicalActivity: _controller.physicalActivity,
                              smoke: _controller.smoke,
                              alcohol: _controller.alcohol,
                              medicalCondition1: _controller.medicalCondition1,
                              medicalCondition2: _controller.medicalCondition2,
                              medicalCondition3: _controller.medicalCondition3,
                              medicalCondition4: _controller.medicalCondition4,
                              medicalCondition5: _controller.medicalCondition5,
                              medicalCondition6: _controller.medicalCondition6,
                              medicalCondition7: _controller.medicalCondition7,
                              medicalCondition8: _controller.medicalCondition8,
                              medicalCondition9: _controller.medicalCondition9,
                            )
                                .then((value) {
                              if (value == true) {
                                setState(() {
                                  _isloading = false;
                                });
                                Get.offAll(
                                  () => const CovidExperienceScreen(),
                                );
                              }
                            });
                          } else {
                            setState(() {
                              _isloading = false;
                            });
                            Get.snackbar(
                              'Missing Fields!',
                              'Please complete the form!',
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
                                'Next ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
