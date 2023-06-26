import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SentenceRepetitionScreen extends StatefulWidget {
  const SentenceRepetitionScreen({Key? key}) : super(key: key);

  @override
  SentenceRepetitionScreenState createState() =>
      SentenceRepetitionScreenState();
}

class SentenceRepetitionScreenState extends State<SentenceRepetitionScreen> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  var isListening = false;
  var score = 0;
  var sentences = [
    'I only know that John is the one to help today',
    'The cat always hides under the couch when dogs are in the room',
  ];
  var currentSentenceIndex = 0;
  var recognizedText = '';

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
    Future.delayed(const Duration(seconds: 2), () {
      _speakSentence();
    });
  }

  Future<void> initializeSpeechToText() async {
    bool isAvailable = await speechToText.initialize();
    if (!isAvailable) {
      debugPrint('Speech recognition is not available');
    }
  }

  Future<void> _speakSentence() async {
    await flutterTts.speak(sentences[currentSentenceIndex]);
  }

  void goToNextSentence() {
    setState(() {
      recognizedText = '';
      if (currentSentenceIndex < sentences.length - 1) {
        currentSentenceIndex++;
      } else {
        currentSentenceIndex = 0;
      }
      _speakSentence();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AvatarGlow(
            animate: isListening,
            endRadius: 75,
            duration: const Duration(milliseconds: 2000),
            glowColor: Colors.deepPurple,
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            showTwoGlows: true,
            child: GestureDetector(
              onTapDown: (details) async {
                if (!isListening) {
                  bool available = await speechToText.initialize();
                  if (available) {
                    setState(() {
                      isListening = true;
                      recognizedText = '';
                      speechToText.listen(
                        onResult: (result) {
                          if (result.finalResult) {
                            var spokenSentence = result.recognizedWords.trim();
                            var targetSentence = sentences[currentSentenceIndex];
                            if (spokenSentence.toLowerCase() == targetSentence.toLowerCase()) {
                              setState(() {
                                score++;
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
                backgroundColor: Colors.deepPurple,
                radius: 30,
                child: Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: goToNextSentence,
            child: const Icon(Icons.arrow_forward),
          ),

        ],
      ),
      appBar: AppBar(
        title: const Text('Sentence Repetition Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            if (currentSentenceIndex < sentences.length)
              Text(
                sentences[currentSentenceIndex],
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            Text(
              recognizedText,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


