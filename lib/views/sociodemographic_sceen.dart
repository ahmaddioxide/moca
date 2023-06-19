import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sociodemographic_controller.dart';

class SocioDemographicScreen extends StatefulWidget {
  const SocioDemographicScreen({super.key});
  @override
  _SocioDemographicScreenState createState() => _SocioDemographicScreenState();
}

class _SocioDemographicScreenState extends State<SocioDemographicScreen> {
  final _formKey = GlobalKey<FormState>();

  // Create an instance of the controller
  final DemographicController _controller = Get.put(DemographicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Socio-Demographic Data',
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
                SizedBox(
                  height: Get.height * 0.01,
                ),
                /////Name
                TextFormField(
                  decoration: const InputDecoration(
                    // hintText: 'Enter Your Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                    labelText: 'Enter Your Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _controller.name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
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
                  'Gender',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: _controller.gender,
                      onChanged: (value) {
                        setState(() {
                          _controller.gender = value!;
                        });
                      },
                    ),
                    const Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Radio(
                      value: 'Female',
                      groupValue: _controller.gender,
                      onChanged: (value) {
                        setState(() {
                          _controller.gender = value!;
                        });
                      },
                    ),
                    const Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Age',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 8),
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
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      borderRadius: BorderRadius.circular(12),
                      disabledHint: const Text(
                        'Select your age',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                      value: _controller.age,
                      onChanged: (value) {
                        setState(
                          () {
                            _controller.age = value!;
                          },
                        );
                      },
                      items: const [
                        DropdownMenuItem(
                          value: '18-20 years',
                          child: Text('18-20 years'),
                        ),
                        DropdownMenuItem(
                          value: '21-30 years',
                          child: Text('21-30 years'),
                        ),
                        DropdownMenuItem(
                          value: '31-40 years',
                          child: Text('31-40 years'),
                        ),
                        DropdownMenuItem(
                          value: '41-50 years',
                          child: Text('41-50 years'),
                        ),
                        DropdownMenuItem(
                          value: '51-60 years',
                          child: Text('51-60 years'),
                        ),
                        DropdownMenuItem(
                          value: '61-65 years',
                          child: Text('61-65 years'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Residence',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Rural',
                      groupValue: _controller.residence,
                      onChanged: (value) {
                        setState(() {
                          _controller.residence = value!;
                        });
                      },
                    ),
                    const Text(
                      'Rural',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Radio(
                      value: 'Semi-urban',
                      groupValue: _controller.residence,
                      onChanged: (value) {
                        setState(() {
                          _controller.residence = value!;
                        });
                      },
                    ),
                    const Text(
                      'Semi-urban',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Radio(
                      value: 'Urban',
                      groupValue: _controller.residence,
                      onChanged: (value) {
                        setState(() {
                          _controller.residence = value!;
                        });
                      },
                    ),
                    const Text(
                      'Urban',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8),
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
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      borderRadius: BorderRadius.circular(12),
                      disabledHint: const Text(
                        'Select your Education',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                      value: _controller.education,
                      onChanged: (value) {
                        setState(
                          () {
                            _controller.education = value!;
                          },
                        );
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'Matriculation (grade 9 and 10)',
                          child: Text('Matriculation (grade 9 and 10)'),
                        ),
                        DropdownMenuItem(
                          value: 'Intermediate (grade 11 and 12)',
                          child: Text('Intermediate (grade 11 and 12)'),
                        ),
                        DropdownMenuItem(
                          value: 'Undergraduate degree (bachelor’s)',
                          child: Text('Undergraduate degree (bachelor’s)'),
                        ),
                        DropdownMenuItem(
                          value: 'Postgraduate degree',
                          child: Text('Postgraduate degree'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Profession',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    // hintText: 'Enter Your Name',
                    prefixIcon: Icon(
                      Icons.art_track,
                      color: Colors.deepPurple,
                    ),
                    labelText: 'Enter Your profession',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _controller.profession = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your profession';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width:double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                if (_controller.gender == '' ||
                                    _controller.residence == '') {
                                  Get.snackbar(
                                    'Error',
                                    'Complete the form! ',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                } else {
                                  _controller.submitForm(
                                    name: _controller.name,
                                    gender: _controller.gender,
                                    age: _controller.age,
                                    residence: _controller.residence,
                                    education: _controller.education,
                                    profession: _controller.profession,
                                  );
                                }
                              }
                            } catch (e) {
                              debugPrint('LoginCalled() called Error "$e"');
                              Get.snackbar(
                                'Error',
                                'Some Error Occured! ',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          child: const Text('Submit',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
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
