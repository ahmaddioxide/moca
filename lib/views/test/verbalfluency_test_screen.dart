import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/abstraction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:language_tool/language_tool.dart' as langTool;
import '../../controllers/fluency_test_controller.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({Key? key}) : super(key: key);

  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  late SharedPreferences sf;
  final FluencyTestController _controller = Get.put(FluencyTestController());
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  late langTool.LanguageTool _languageTool;
  var subjectWords = <String>[];
  String currentLetter = '';
  bool isTimerStarted = false;
  String text = 'Hold the button and start speaking';
  var words = <String>[];
  var word;
  bool isSpeechAvailable = false;
  bool starttest = true;

  @override
  void initState() {
    super.initState();
    initalizeSharedPref();
    speechToText.initialize();
    _languageTool = langTool.LanguageTool();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
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
              '''Tell as many words as you can think of that begin with a certain letter of the alphabet that you will be told once you click on the 60 second timer. You can say any kind of word you want, except for proper nouns, numbers, or words that begin with the same sound but have a different suffix, for example, love, lover, loving.''',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 10,
            ),
            child: Text(
              "Try to at least speak 2 or more words at a time for better detection.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
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
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                starttest
                    ? "Double tap the button to start test"
                    : "Hold the button and start speaking",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Text(
                "$words",
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
        animate: _controller.isListening.value,
        endRadius: 75,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.deepPurple,
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        showTwoGlows: true,
        child: GestureDetector(
          onLongPress: () async {
            if (!_controller.isListening.value &&
                !starttest &&
                isTimerStarted) {
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
                  : _controller.isListening.value
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
      _controller.remainingSeconds.value = _controller.timerDuration.inSeconds;
      subjectWords.clear();
      words.clear();
    });

    _countdownTimer();
    _speakRandomLetter();
  }

  void _countdownTimer() async {
    while (_controller.remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _controller.remainingSeconds--;
    }
    isTimerStarted = false;
    _stopListening();
    _calculateScore();
  }

  Future<void> _calculateScore() async {
    var score = 0;
    if (words.length >= 11) {
      score = 1;
      await _controller.updateScore(score);
    } else {
      score = 0;
      await _controller.updateScore(score);
    }

    Future.delayed(const Duration(seconds: 2), () {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Test Completed',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        content: const Text(
          'You have successfully completed the Language test.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.deepPurple,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              sf.setInt('nextGame', 12);
              Get.offAll(() => const AbstractionScreen());
            },
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _speakRandomLetter() async {
    // var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var randomLetter = 'F';
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
          var spokenWords = word.split(' ');
          for (var word in spokenWords) {
            _checkAndAddWord(word.toLowerCase());
          }
        }
      },
    );
    _controller.isListening.value = true;
  }

  Future<void> _checkAndAddWord(String word) async {
    if (await _isvalidWord(word)) {
      //if words already contains the word then don't add it
      if (words.contains(word)) {
        return;
      }
      setState(() {
        // subjectWords.add(word);
        words.add(word);
      });
    }
  }

  Future<bool> _isvalidWord(String word) async {
    // debugPrint('Word: ${word[0].toLowerCase() == currentLetter.toLowerCase()}');
    // debugPrint('Word: ${word.toLowerCase()}');

    if (word[0].toLowerCase() == currentLetter.toLowerCase()) {
      final errors = await _languageTool.check(word);
      // debugPrint('Errors: ${errors.isNotEmpty}}');

      if (errors.isEmpty) {
        return true;
      } else {
        return errors.isNotEmpty;
      }
    } else {
      return false;
    }
  }

  void _stopListening() {
    speechToText.stop();
    _controller.isListening.value = false;
  }
}
