import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:moca/views/test/orientation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../controllers/delayRecall_controller.dart';

class DelayRecallScreen extends StatefulWidget {
  const DelayRecallScreen({Key? key}) : super(key: key);

  @override
  DelayRecallScreenState createState() => DelayRecallScreenState();
}

class DelayRecallScreenState extends State<DelayRecallScreen> {
  late SharedPreferences sf;

  @override
  initState() {
    super.initState();
    initalizeSharedPref();
    initializeSpeechToText();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  List<String> wordList = [
    'face',
    'velvet',
    'church',
    'daisy',
    'red',
  ];

  List<String> recognizedWordsList = [];
  bool isSpeaking = true;
  bool isTimerStarted = false;

  final DelayRecallController _controller = Get.put(DelayRecallController());

  void _startTest() {
    isTimerStarted = true;
    _controller.timeDuration();
    _countdownTimer();
  }

  void _countdownTimer() async {
    while (_controller.remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _controller.decrementSeconds();
    }
    isTimerStarted = false;
    _calculateScore();
    _stopListening();
    alertdialog();
  }

  void _calculateScore() {
    int score = recognizedWordsList.length;

    _controller.saveData(score);
  }

  void _stopListening() {
    speechToText.stop();
    _controller.isListening.value = false;
  }

  Future<void> initializeSpeechToText() async {
    bool isAvailable = await speechToText.initialize();
    if (!isAvailable) {
      debugPrint('Speech recognition is not available');
    }
  }

  void alertdialog() {
    _controller.remainingSeconds.value = 1;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Complete'),
          content: const Text(
              'You have Successfully completed the Delay Recall test.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.offAll(() => const OrientationScreen());
                sf.setInt('nextGame', 14);
              },
              child: const Text('Next'),
            ),
          ],
        );
      },
    );
  }

  //future async await function to return recognized words
  Future<String> getRecognizedWords() async {
    return _controller.recognizedText.value;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _controller.isListening.value,
        endRadius: 75,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.deepPurple,
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!_controller.isListening.value &&
                !_controller.starttest.value &&
                isTimerStarted) {
              bool available = await speechToText.initialize();
              if (available) {
                _controller.isListening.value = true;
                _controller.recognizedText.value = '';
                speechToText.listen(
                  onResult: (result) {
                    if (result.finalResult) {
                      _controller.spokenSentence.value =
                          result.recognizedWords.trim().toLowerCase();
                      List<String> spokenWords =
                          _controller.spokenSentence.value.split(' ');
                      for (String spokenWord in spokenWords) {
                        if (!recognizedWordsList.contains(spokenWord) &&
                            wordList.contains(spokenWord)) {
                          recognizedWordsList.add(spokenWord);
                          _controller.incrementWordCount();
                        }
                      }
                      _controller.recognizedText.value = result.recognizedWords;
                    }
                  },
                );
              } else {
                debugPrint('Speech recognition is not available');
              }
            }
          },
          onDoubleTap: () {
            if (_controller.starttest.value) {
              _controller.starttest.value = false;
              _startTest();
            }
          },
          onTapUp: (details) {
            _controller.isListening.value = false;
            speechToText.stop();
          },
          child: Obx(
            () => CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 40,
              child: Icon(
                _controller.starttest.value
                    ? Icons.double_arrow_rounded
                    : _controller.isListening.value
                        ? Icons.mic
                        : Icons.mic_none,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Delay Recall Test',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.01),
            const Text(
              "Some words were read to you earlier in Memory Test, which you were asked to remember. Tell as many of those words as you can remember",
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
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Obx(
                  //   () => Text(
                  //     'Words Matched: ${_controller.wordCount.value}',
                  //     style: const TextStyle(
                  //         fontSize: 18, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  Obx(
                    () => Text(
                      '${_controller.remainingSeconds}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.1),
            Obx(
              () => Text(
                _controller.starttest.value
                    ? "Double tap the button to start test"
                    : _controller.isListening.value
                        ? _controller.recognizedText.value
                        : _controller.spokenSentence.value,
                style: TextStyle(
                  fontSize: 20,
                  color: _controller.isListening.value
                      ? Colors.deepPurple
                      : Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
