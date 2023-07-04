import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:moca/views/abstraction_screen.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../controllers/sentencerepetition_controller.dart';

class SentenceRepetitionScreen extends StatefulWidget {
  const SentenceRepetitionScreen({Key? key}) : super(key: key);

  @override
  SentenceRepetitionScreenState createState() =>
      SentenceRepetitionScreenState();
}

class SentenceRepetitionScreenState extends State<SentenceRepetitionScreen> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  final SentenceController _controller = Get.put(SentenceController());
  bool isListening = false;
  int score = 0;
  var spokenSentence = 'Hold the button and start speaking';
  var sentences = [
    'I only know that John is the one to help today',
    'The cat always hides under the couch when dogs are in the room',
  ];
  int currentSentenceIndex = 0;
  String recognizedText = 'Hold the button and start speaking';
  bool isMicEnabled = false;
  bool secondSentence = true;

  String sentence1 =
      "A sentence will be read to you. Repeat it exactly as it is said.";
  String sentence2 =
      "Now another sentence will be read to you. Repeat it exactly asit is said";

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
    Future.delayed(const Duration(seconds: 3), () {
      _speakSentence();
      disableMicButton();
    });
  }

  Future<void> initializeSpeechToText() async {
    bool isAvailable = await speechToText.initialize();
    if (!isAvailable) {
      debugPrint('Speech recognition is not available');
    }
  }

  void disableMicButton() {
    setState(() {
      isMicEnabled = false;
    });
  }

  void enableMicButton() {
    setState(() {
      isMicEnabled = true;
    });
  }

  Future<void> _speakSentence() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(sentences[currentSentenceIndex]);

    Future.delayed(const Duration(seconds: 3), () {
      enableMicButton();
    });
  }

  void goToNextSentence() {
    setState(() {
      recognizedText = '';
      spokenSentence = 'Hold the button and start speaking';
      currentSentenceIndex++;
      if (secondSentence) {
        disableMicButton();
        secondSentence = false;
        Future.delayed(const Duration(seconds: 1), () {
          _speakSentence();
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(() =>  AbstractionScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
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
            if (!isListening && isMicEnabled) {
              bool available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  recognizedText = '';
                  speechToText.listen(
                    onResult: (result) {
                      if (result.finalResult) {
                        spokenSentence = result.recognizedWords.trim();
                        var targetSentence = sentences[currentSentenceIndex];
                        if (spokenSentence.toLowerCase() ==
                            targetSentence.toLowerCase()) {
                          setState(() {
                            score++;
                            _controller.incrementScore();
                          });
                        }
                        Future.delayed(const Duration(seconds: 3), () {
                          goToNextSentence();
                        });
                      } else {
                        setState(() {
                          recognizedText = result.recognizedWords;
                        });
                      }
                    },
                  );
                });
              } else {
                debugPrint('Speech recognition is not available');
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
            backgroundColor: isMicEnabled ? Colors.deepPurple : Colors.grey,
            radius: 40,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Language Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Sentence Repetition',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                secondSentence ? sentence1 : sentence2,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            const Divider(
              color: Colors.deepPurple,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            // Text(
            //   'Score: $score',
            //   style: const TextStyle(fontSize: 24),
            // ),
            // if (currentSentenceIndex < sentences.length)
            //   Text(
            //     sentences[currentSentenceIndex],
            //     style: const TextStyle(fontSize: 16),
            //     textAlign: TextAlign.center,
            //   ),
            SizedBox(height: height * 0.25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  isListening ? recognizedText : spokenSentence,
                  style: TextStyle(
                    fontSize: 18,
                    color: isListening ? Colors.deepPurple : Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
