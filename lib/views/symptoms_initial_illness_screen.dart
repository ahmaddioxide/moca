import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/custom_widget/drop_down.dart';
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
        title: const Text('COVID-19 SYMPTOMS'),
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
                  'Symptoms during the initial illness (first 4 weeks) ',
                  style: TextStyle(fontSize: 18),
                ),
                ////fever
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Fever',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.fever,
                      onChanged: (value) {
                        setState(() {
                          _controller.fever = value!;
                        });
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
                  ],
                ),

                ///cough
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Cough',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.cough,
                      onChanged: (value) {
                        setState(() {
                          _controller.cough = value!;
                        });
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
                  ],
                ),
                ////stuffyNose
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Stuffy Nose',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.stuffyNose,
                      onChanged: (value) {
                        setState(() {
                          _controller.stuffyNose = value!;
                        });
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
                  ],
                ),
                ////soreThroat
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Sore Throat',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.soreThroat,
                      onChanged: (value) {
                        setState(() {
                          _controller.soreThroat = value!;
                        });
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
                  ],
                ),
                ////breathingIssues
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Breathing Issues',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.breathingIssues,
                      onChanged: (value) {
                        setState(() {
                          _controller.breathingIssues = value!;
                        });
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
                  ],
                ),
                ////chestPain
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Chest Pain',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.chestPain,
                      onChanged: (value) {
                        setState(() {
                          _controller.chestPain = value!;
                        });
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
                  ],
                ),
                ////irregularPulse
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Irregular Pulse',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.irregularPulse,
                      onChanged: (value) {
                        setState(() {
                          _controller.irregularPulse = value!;
                        });
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
                  ],
                ),
                ////itchyRedDryEyes
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Itchy/Red/Dry Eyes',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.itchyRedDryEyes,
                      onChanged: (value) {
                        setState(() {
                          _controller.itchyRedDryEyes = value!;
                        });
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
                  ],
                ),
                ////headAches
                const SizedBox(height: 16),
                DropDown(
                  result: _controller.headAches,
                  text: "Head Aches",
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
