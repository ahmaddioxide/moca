import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  // Create an instance of the controller
  final SymptomsInitialIllnessController _controller =
      Get.put(SymptomsInitialIllnessController());

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
