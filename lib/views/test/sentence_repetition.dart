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
  bool isListening = false;
  int score = 0;
  var sentences = [
    'I only know that John is the one to help today',
    'The cat always hides under the couch when dogs are in the room',
  ];
  int currentSentenceIndex = 0;
  String recognizedText = '';
  bool isMicEnabled = false;
  bool secondsentence = true;

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
    await flutterTts.speak(sentences[currentSentenceIndex]);
    Future.delayed(const Duration(seconds: 3), () {
      enableMicButton();
    });
  }

  void goToNextSentence() {
    setState(() {
      recognizedText = '';
      currentSentenceIndex++;
      if(secondsentence){
        _speakSentence();
        disableMicButton();
        secondsentence = false;
      }else{
        _showNextSentencePopup();
      }


    });
  }

  void _showNextSentencePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Completed'),
          content: const Text('You have completed the Sentence Repetition test.'),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
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
            if (!isListening && isMicEnabled) {
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
                        if (spokenSentence.toLowerCase() ==
                            targetSentence.toLowerCase()) {
                          setState(() {
                            score++;
                          });
                        }
                        Future.delayed(const Duration(seconds: 3), (){
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
            radius: 30,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
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
