import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import 'serial7_test.dart';

class VigilanceScreen extends StatefulWidget {
  const VigilanceScreen({Key? key}) : super(key: key);

  @override
  VigilanceScreenState createState() => VigilanceScreenState();
}

class VigilanceScreenState extends State<VigilanceScreen> {
  FlutterTts flutterTts = FlutterTts();
  int score = 0;
  int errors = 0;
  var sequence = ['F', 'B', 'A', 'C', 'M', 'N', 'A', 'A', 'J', 'K','L', 'B', 'A', 'F', 'A', 'K', 'D', 'E', 'A', 'A','A', 'J', 'A', 'M','O', 'F', 'A', 'A', 'B'
  ];
  bool isClicked = false;
  bool canrespond = false;
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startSpeaking();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _startSpeaking() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (currentIndex < sequence.length) {
        var currentLetter = sequence[currentIndex];
        flutterTts.speak(currentLetter);
        currentIndex++;
        canrespond = true;
        if (currentLetter == 'A') {
          Future.delayed(const Duration(milliseconds: 2900), () {
            if (!isClicked) {
              setState(() {
                errors++;
              });            }
          });

        }
        if (currentIndex >= sequence.length) {
          timer?.cancel();
          Future.delayed(const Duration(seconds: 4), () {
            Get.to(() => const SerialScreen());
          });
        }
      }
    });
  }

  void _compareResponse(String response) {
    if (currentIndex > 0 && currentIndex <= sequence.length) {
      var spokenLetter = sequence[currentIndex - 1];
      if (spokenLetter == 'A' && response == 'A' && canrespond) {
        setState(() {
          score++;
        });
      } else if (spokenLetter != 'A' && response == 'A' && canrespond) {
        setState(() {
          errors++;
        });
      }
      else{
      }
      canrespond = false;
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vigilance Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Correct: $score',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Errors: $errors',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                isClicked = true;
                _compareResponse('A');
                Future.delayed(const Duration(seconds: 3), () {
                  isClicked = false;
                });
              },
              child: const Text(
                'Tap to Respond',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
