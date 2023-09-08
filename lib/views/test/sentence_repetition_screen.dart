import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/verbalfluency_test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late SharedPreferences sf;
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  final SentenceController _controller = Get.put(SentenceController());
  RxBool isListening = false.obs;
  int score = 0;
  bool isTimerStarted = false;
  bool gotoNextSentence = false;
  RxString spokenSentence = 'Hold the button and start speaking'.obs;
  var sentences = [
    'I only know that John is the one to help today',
    'The cat always hid under the couch when dogs were in the room',
  ];
  int currentSentenceIndex = 0;
  RxString recognizedText = 'Hold the button and start speaking'.obs;
  RxBool secondSentence = true.obs;
  RxBool starttest = false.obs;
  bool gotoNextScreen = false;
  String sentence1 =
      "A sentence will be read to you. Repeat it exactly as it is said.";
  String sentence2 =
      "Now another sentence will be read to you. Repeat it exactly asit is said";

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
    initalizeSharedPref();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

  void _startTest() {
    isTimerStarted = true;
    _controller.disableMicButton();
    _countdownTimer();
    Future.delayed(const Duration(seconds: 1), () {
      _speakSentence();
    });
  }

  void _countdownTimer() async {
    while (_controller.remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _controller.decrementSeconds();
    }
    isTimerStarted = false;
    if (gotoNextSentence == false) {
      goToNextSentence();
    } else if (gotoNextSentence == true && gotoNextScreen == false) {
      nextTest();
    }
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
    _controller.remainingSeconds.value;
  }

  void nextTest() {
    gotoNextScreen = true;
    sf.setInt('nextGame', 11);
    Future.delayed(const Duration(seconds: 3), () {
      _controller.remainingSeconds.value = 0;
      Get.offAll(() => const VocabularyScreen());
    });
  }

  Future<void> initializeSpeechToText() async {
    bool isAvailable = await speechToText.initialize();
    if (!isAvailable) {
      debugPrint('Speech recognition is not available');
    }
  }

  Future<void> _speakSentence() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(sentences[currentSentenceIndex]);

    Future.delayed(const Duration(seconds: 3), () {
      _controller.enableMicButton();
    });
  }

  void goToNextSentence() {
    _controller.remainingSeconds.value = 60;
    gotoNextSentence = true;
    _countdownTimer();
    recognizedText.value = '';
    spokenSentence.value = 'Hold the button and start speaking';
    currentSentenceIndex++;

    if (secondSentence.value) {
      _controller.disableMicButton();
      secondSentence.value = false;
      Future.delayed(const Duration(seconds: 1), () {
        _speakSentence();
      });
    } else {
      nextTest();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening.value,
        endRadius: 75,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.deepPurple,
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening.value &&
                _controller.isMicEnabled.value &&
                starttest.value &&
                isTimerStarted) {
              bool available = await speechToText.initialize();
              if (available) {
                isListening.value = true;
                recognizedText.value = '';
                speechToText.listen(
                  onResult: (result) {
                    if (result.finalResult) {
                      spokenSentence.value = result.recognizedWords.trim();
                      var targetSentence = sentences[currentSentenceIndex];
                      // Split the target sentence and spoken sentence into words
                      var targetWords = targetSentence.toLowerCase().split(' ');
                      var spokenWords = spokenSentence.toLowerCase().split(' ');
                      // Initialize a variable to keep track of the number of correct words
                      int correctWordCount = 0;

                      // Compare each word in the target sentence with the spoken sentence
                      for (int i = 0;
                          i < targetWords.length && i < spokenWords.length;
                          i++) {
                        if (targetWords[i] == spokenWords[i]) {
                          correctWordCount++;
                        }
                      }
                      if (spokenSentence.toLowerCase() ==
                          targetSentence.toLowerCase() || correctWordCount >= 10) {
                        score++;
                        // _controller.incrementScore();
                      }
                      Future.delayed(const Duration(seconds: 3), () {
                        goToNextSentence();
                      });
                    } else {
                      recognizedText.value = result.recognizedWords;
                    }
                  },
                );
              } else {
                debugPrint('Speech recognition is not available');
              }
            }
            _controller.updateScore(score);
          },
          onTapUp: (details) {
            isListening.value = false;
            speechToText.stop();
          },
          onDoubleTap: () {
            if (!starttest.value) {
              starttest.value = true;
              _startTest();
            }
          },
          child: Obx(
            () => CircleAvatar(
              backgroundColor: !starttest.value
                  ? Colors.deepPurple
                  : _controller.isMicEnabled.value
                      ? Colors.deepPurple
                      : Colors.grey,
              radius: 40,
              child: Obx(
                () => Icon(
                  starttest.value ? Icons.mic : Icons.double_arrow_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Language Test',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
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
              child: Obx(
                () => Text(
                  secondSentence.value ? sentence1 : sentence2,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Try to speak clearly and slowly into the microphone",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Obx(
                    () => Text(
                      _controller.remainingSeconds.value.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Obx(
                  () => Text(
                    starttest.value
                        ? isListening.value
                            ? recognizedText.value
                            : spokenSentence.value
                        : "Double tap the button to start test",
                    style: TextStyle(
                      fontSize: 18,
                      color: isListening.value
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
