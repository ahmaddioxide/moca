import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/Forward_digit_span.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../controllers/memorytest_controller.dart';

class MemoryTestScreen extends StatefulWidget {
  const MemoryTestScreen({Key? key}) : super(key: key);

  @override
  MemoryTestScreenState createState() => MemoryTestScreenState();
}

class MemoryTestScreenState extends State<MemoryTestScreen> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  bool isListening = false;
  String text = "Hold the button and start speaking";
  List<String> wordList = [
    'face',
    'velvet',
    'church',
    'daisy',
    'red',
  ];
  List<String> recognizedWordsList = [];
  String recognizedText = '';
  String spokenSentence = 'Hold the button and start speaking';
  int wordCount = 0;
  bool isSpeaking = true;
  bool isMicEnabled = false;
  int currentTrial = 1;

  final MemoryTestController _controller = Get.put(MemoryTestController());

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
    speakWordList();
    disableMicButton();
  }

  void resetScreen() {
    setState(() {
      wordCount = 0;
      spokenSentence = 'Hold the button and start speaking';
      isListening = false;
      recognizedText = '';
      disableMicButton();
    });
  }

  Future<void> initializeSpeechToText() async {
    bool isAvailable = await speechToText.initialize();
    if (!isAvailable) {
      debugPrint('Speech recognition is not available');
    }
  }

  void speakWordList() async {
    for (String word in wordList) {
      await flutterTts.speak(word);
      await Future.delayed(const Duration(milliseconds: 1500));
    }
    enableMicButton();
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

  //future async await function to return recognized words
  Future<String> getRecognizedWords() async {
    return recognizedText;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

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
                        spokenSentence = result.recognizedWords.trim().toLowerCase();

                        List<String> spokenWords = spokenSentence.split(' ');
                        for (String spokenWord in spokenWords) {
                          if (!recognizedWordsList.contains(spokenWord) &&
                              wordList.contains(spokenWord)) {
                            setState(() {
                              recognizedWordsList.add(spokenWord);
                              debugPrint("List: ${recognizedWordsList.toString()}");
                              wordCount++;
                            });
                          }
                        }
                        if (currentTrial == 2) {
                          _controller.saveData(wordList, recognizedWordsList);
                          Future.delayed(const Duration(seconds: 5), () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Memory Test Completed'),
                                  content: const Text(
                                      'You will be asked to recall those words again at the end of the test.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.offAll(() => const ForwardDigitSpan());
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        }
                        if (currentTrial < 2) {
                          setState(() {
                            recognizedText = '';
                          });
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              currentTrial++;
                              wordCount = 0;
                            });
                            resetScreen();
                            speakWordList();
                          });
                        }
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
        title: const Text('Memory Test',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Trial $currentTrial of 2",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.01),
            const Text(
              "This is a memory test. A list of words will be read to you that you will have to repeat and remember.",
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            SizedBox(height: height * 0.01),
            const Divider(
              color: Colors.deepPurple,
              thickness: 1,
              indent: 16,
              endIndent: 16,

            ),
            SizedBox(height: height * 0.01),
            Text(
              'Words Matched: $wordCount',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.1),
            Text(
              spokenSentence,
              style: TextStyle(
                fontSize: 20,
                color: isListening ? Colors.deepPurple : Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
