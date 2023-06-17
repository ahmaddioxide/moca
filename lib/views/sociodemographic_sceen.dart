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
                SizedBox(
                  height: Get.height * 0.01,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
                const Text(
                  'Select Your Gender',
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
                      ),
                    ),
                  ],
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
                          color: Colors.deepPurple,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
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
                      style: TextStyle(color: Colors.deepPurple, fontSize: 18),
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
                      style: TextStyle(color: Colors.deepPurple, fontSize: 18),
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
                      style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                    ),
                  ],
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
                    child: DropdownButtonFormField(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                      ),
                      isExpanded: true,
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
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your profession',
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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _controller
                            .submitSocioDemographicForm(
                          name: _controller.name,
                          gender: _controller.gender,
                          age: _controller.age,
                          residence: _controller.residence,
                          education: _controller.education,
                          profession: _controller.profession,
                        )
                            .then(
                          (value) {
                            if (value) {
                              Get.to(() => const MedicalHistoryScreen());
                            }
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
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
    );
  }
}
