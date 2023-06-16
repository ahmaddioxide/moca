import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/medicalhistory_sceen.dart';
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
        title: const Text('Socio-Demographic Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /////Name
                const Text(
                  '1. Name',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
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
                const Text(
                  '2. Gender',
                  style: TextStyle(fontSize: 18),
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
                    const Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: _controller.gender,
                      onChanged: (value) {
                        setState(() {
                          _controller.gender = value!;
                        });
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  '3. Age',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: _controller.age,
                  onChanged: (value) {
                    setState(() {
                      _controller.age = value!;
                    });
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
                const SizedBox(height: 16),
                const Text(
                  '4. Residence',
                  style: TextStyle(fontSize: 18),
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
                    const Text('Rural'),
                    Radio(
                      value: 'Semi-urban',
                      groupValue: _controller.residence,
                      onChanged: (value) {
                        setState(() {
                          _controller.residence = value!;
                        });
                      },
                    ),
                    const Text('Semi-urban'),
                    Radio(
                      value: 'Urban',
                      groupValue: _controller.residence,
                      onChanged: (value) {
                        setState(() {
                          _controller.residence = value!;
                        });
                      },
                    ),
                    const Text('Urban'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  '5. Education',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButtonFormField(
                  value: _controller.education,
                  onChanged: (value) {
                    setState(() {
                      _controller.education = value as String;
                    });
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your education';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  '6. Profession',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
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
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _controller.submitForm(
                        name: _controller.name,
                        gender: _controller.gender,
                        age: _controller.age,
                        residence: _controller.residence,
                        education: _controller.education,
                        profession: _controller.profession,
                      );
                      Get.to(() => const MedicalHistoryScreen());
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
