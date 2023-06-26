import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'sentence_repetition.dart';

class SerialScreen extends StatefulWidget {
  const SerialScreen({Key? key}) : super(key: key);

  @override
  State<SerialScreen> createState() => _SerialState();
}

class _SerialState extends State<SerialScreen> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  var text = "Hold the button and start speaking";
  var isListening = false;
  var maxAttemptsReached = false;
  var score = 0;
  var attempts = 0;
  var maxAttempts = 5;
  var target = 93;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _speakInstructions();
    });
  }

  void _speakInstructions() async {
    await flutterTts.speak(
        "Count backwards by subtracting 7 from 100. Do a total of 5 subtractions.");
  }

  void _validateCounting() {
    var recognizedNumber = int.tryParse(text);
    if (recognizedNumber != null) {
      if (recognizedNumber == target) {
        attempts++;
        setState(() {
          score++;
          if (attempts == maxAttempts) {
            _showPopup();
            isListening = false;
            maxAttemptsReached = true;
          } else {
            _speakTarget();
          }
          target -= 7;
        });
      } else {
        attempts++;
        _showSnackbar("Wrong Input! Try Again");
        if (attempts == maxAttempts) {
          setState(() {
            _showPopup();
            isListening = false;
            maxAttemptsReached = true;
          });
        }
      }
    }
  }

  void _speakTarget() async {
    await flutterTts.speak("Count backwards from $target");
  }

  void _showPopup() {
      int finalScore;

      if (score > 3) {
        finalScore = 3;
      } else if (score == 2 || score == 3) {
        finalScore = 2;
      } else if (score == 1) {
        finalScore = 1;
      } else {
        finalScore = 0;
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Test Complete'),
            content: Text('Your score is $finalScore'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.to(() => const SentenceRepetitionScreen());
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        endRadius: 75,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.deepPurple,
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening && !maxAttemptsReached) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                        _validateCounting();
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: maxAttemptsReached
                ? Colors.grey
                : isListening
                    ? Colors.grey
                    : Colors.deepPurple,
            radius: 30,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Series 7 Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Correct Responses: $score',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Attempts Left: ${maxAttempts - attempts}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                margin: const EdgeInsets.only(bottom: 150),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 24,
                    color: isListening ? Colors.black87 : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
