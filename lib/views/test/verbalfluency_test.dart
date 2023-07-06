import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:avatar_glow/avatar_glow.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({Key? key}) : super(key: key);

  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  bool isListening = false;
  bool isTimerStarted = false;
  var timerDuration = const Duration(seconds: 60);
  int remainingSeconds = 60;
  var subjectWords = <String>[];
  String currentLetter = '';
  String text = 'Hold the button and start speaking';
  var Words = <String>[];
  var word;
  bool isSpeechAvailable = false;
  bool starttest = true;

  @override
  void initState() {
    super.initState();
    speechToText.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language Test',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Text(
              'Verbal Fluency',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 10,
            ),
            child: Text(
              '''Tell as many words as you can think of that begin with a given letter in 60 second. You can say any kind of Grammatical word you want.''',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Letter is: $currentLetter",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$remainingSeconds',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                starttest
                    ? "Double top the button to start test"
                    : "Hold the button and start speaking",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Text(
                "${Words}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
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
          onLongPress: () async {
            if (!isListening && !starttest && isTimerStarted) {
              bool available = await speechToText.initialize();
              if (available) {
                _startListening();
              } else {
                debugPrint('Speech recognition is not available');
              }
            }
          },
          //allow double tap only once
          onDoubleTap: () {
            if (starttest) {
              setState(() {
                starttest = false;
              });
              _startTest();
            }
          },
          onLongPressUp: _stopListening,
          child: CircleAvatar(
            backgroundColor: starttest
                ? Colors.deepPurple
                : isTimerStarted
                    ? Colors.deepPurple
                    : Colors.grey,
            radius: 40,
            child: Icon(
              starttest
                  ? Icons.double_arrow_rounded
                  : isListening
                      ? Icons.mic
                      : Icons.mic_none,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  void _startTest() {
    setState(() {
      isTimerStarted = true;
      remainingSeconds = timerDuration.inSeconds;
      subjectWords.clear();
      Words.clear(); // Clear the Words list
    });

    _countdownTimer();
    _speakRandomLetter();
  }

  void _countdownTimer() async {
    while (remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        remainingSeconds--;
      });
    }
    isTimerStarted = false;
    _stopListening();
  }

  void _speakRandomLetter() async {
    var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var randomLetter = alphabet[DateTime.now().second % 26];
    setState(() {
      currentLetter = randomLetter;
    });
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak('The letter is $randomLetter');
  }

  void _startListening() {
    speechToText.listen(
      onResult: (result) {
        if (result.finalResult) {
          word = result.recognizedWords.toLowerCase();
          if (!_isInvalidWord(word)) {
            setState(() {
              subjectWords.add(word);
              Words.add(word); // Store the spoken word in the Words list
            });
          }
        }
      },
    );
    setState(() {
      isListening = true;
    });
  }

  void _stopListening() {
    speechToText.stop();
    setState(() {
      isListening = false;
    });
  }

  bool _isInvalidWord(String word) {
    return word.isEmpty ||
        word.startsWith(RegExp(r'[A-Z]')) || // Check for proper nouns
        RegExp(r'^\d+$').hasMatch(word);
  }
}
