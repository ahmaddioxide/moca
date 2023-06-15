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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Head Aches',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.headAches,
                      onChanged: (value) {
                        setState(() {
                          _controller.headAches = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Loss of Smell taste',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.lossOfSmelltaste,
                      onChanged: (value) {
                        setState(() {
                          _controller.lossOfSmelltaste = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Blurred Vision',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.blurredVision,
                      onChanged: (value) {
                        setState(() {
                          _controller.blurredVision = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Hallucinations',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.hallucinations,
                      onChanged: (value) {
                        setState(() {
                          _controller.hallucinations = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Confusion',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.confusion,
                      onChanged: (value) {
                        setState(() {
                          _controller.confusion = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Difficult Sleepy',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.difficultSleepy,
                      onChanged: (value) {
                        setState(() {
                          _controller.difficultSleepy = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Depression / Anxiety',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.depressionAnxiety,
                      onChanged: (value) {
                        setState(() {
                          _controller.depressionAnxiety = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Numbness',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.numbness,
                      onChanged: (value) {
                        setState(() {
                          _controller.numbness = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Fatigue',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.fatigue,
                      onChanged: (value) {
                        setState(() {
                          _controller.fatigue = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Body Pain',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.bodyPain,
                      onChanged: (value) {
                        setState(() {
                          _controller.bodyPain = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Nausea',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.nausea,
                      onChanged: (value) {
                        setState(() {
                          _controller.nausea = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Vomiting',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.vomiting,
                      onChanged: (value) {
                        setState(() {
                          _controller.vomiting = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Diarrhea',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.diarrhea,
                      onChanged: (value) {
                        setState(() {
                          _controller.diarrhea = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Abdominal Pain',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.abdominalPain,
                      onChanged: (value) {
                        setState(() {
                          _controller.abdominalPain = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Loss Of Appetite',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.lossOfAppetite,
                      onChanged: (value) {
                        setState(() {
                          _controller.lossOfAppetite = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Hot Flashes',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.hotFlashes,
                      onChanged: (value) {
                        setState(() {
                          _controller.hotFlashes = value!;
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Rash',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 23),
                    DropdownButton<String>(
                      value: _controller.rash,
                      onChanged: (value) {
                        setState(() {
                          _controller.rash = value!;
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
                // const SizedBox(height: 16),
                // DropDown(
                //   result: _controller.headAches,
                //   text: "Head Aches",
                // ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _controller.submitForm(
                        fever: _controller.fever,
                        cough: _controller.cough,
                        stuffyNose: _controller.stuffyNose,
                        soreThroat: _controller.soreThroat,
                        breathingIssues: _controller.breathingIssues,
                        chestPain: _controller.chestPain,
                        irregularPulse: _controller.irregularPulse,
                        itchyRedDryEyes: _controller.itchyRedDryEyes,
                        headAches: _controller.headAches,
                        lossOfSmelltaste: _controller.lossOfSmelltaste,
                        blurredVision: _controller.blurredVision,
                        hallucinations: _controller.hallucinations,
                        confusion: _controller.confusion,
                        difficultSleepy: _controller.difficultSleepy,
                        depressionAnxiety: _controller.depressionAnxiety,
                        numbness: _controller.numbness,
                        fatigue: _controller.fatigue,
                        bodyPain: _controller.bodyPain,
                        nausea: _controller.nausea,
                        vomiting: _controller.vomiting,
                        diarrhea: _controller.diarrhea,
                        abdominalPain: _controller.abdominalPain,
                        lossOfAppetite: _controller.lossOfAppetite,
                        hotFlashes: _controller.hotFlashes,
                        rash: _controller.rash,
                      );
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
