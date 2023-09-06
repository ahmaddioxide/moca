import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/digitspan_controller.dart';
import 'package:moca/views/test/backward_test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ForwardDigitSpan extends StatefulWidget {
  const ForwardDigitSpan({Key? key}) : super(key: key);

  @override
  State<ForwardDigitSpan> createState() => _ForwardDigitState();
}

class _ForwardDigitState extends State<ForwardDigitSpan> {
  late SharedPreferences sf;
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  final DigitSpanController _controller = Get.put(DigitSpanController());
  int score = 0;
  var numbers = ['2', '1', '8', '5', '4'];
  bool isTimerStarted = false;
  bool innNextScreen = false;

  @override
  void initState() {
    super.initState();
    initalizeSharedPref();
  }

  void _startTest() {
    isTimerStarted = true;
    _controller.timeDuration();
    _countdownTimer();
    _speakNumbers();
    // disableMicButton();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

  void _countdownTimer() async {
    while (_controller.remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _controller.decrementSeconds();
    }
    isTimerStarted = false;
    if (innNextScreen == false) {
      nextTest();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.remainingSeconds;
  }

  void nextTest() {
    int score = _controller.getScore();
    sf.setInt('nextGame', 7);
    innNextScreen = true;
    _controller.remainingSeconds.value = 0;
    Get.offAll(() =>  BackwardDigitSpan(ForwardScore: score));
  }

  void _speakNumbers() async {
    _controller.isReading.value = true;
    for (var number in numbers) {
      await flutterTts.speak(number);
      await Future.delayed(const Duration(seconds: 2));
    }
    _controller.isReading.value = false;
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
                !_controller.isReading.value &&
                !_controller.starttest.value &&
                isTimerStarted) {
              var available = await speechToText.initialize();
              if (available) {
                _controller.isListening.value = true;
                speechToText.listen(
                  onResult: (result) {
                    _controller.text.value = result.recognizedWords;
                    var recognizedWords =
                        _controller.text.replaceAll('', ' ').split(' ');
                    var numbersJoined = numbers.join('');
                    if (recognizedWords.join('') == numbersJoined) {
                      score++;
                      _controller.incrementScore();
                    }
                  },
                );
              }
            }
          },
          onTapUp: (details) {
            if (!_controller.starttest.value && _controller.isReading.isFalse) {
              _controller.isListening.value = false;
              speechToText.stop();
              Future.delayed(const Duration(seconds: 3), () {
                nextTest();
              });
            }
          },
          onDoubleTap: () {
            if (_controller.starttest.value) {
              _controller.starttest.value = false;
              _startTest();
            }
          },
          child: Obx(
            () => CircleAvatar(
              backgroundColor: _controller.starttest.value
                  ? Colors.deepPurple
                  : _controller.isReading.value
                      ? Colors.grey
                      : Colors.deepPurple,
              radius: 40,
              child: Obx(
                () => Icon(
                  _controller.starttest.value
                      ? Icons.double_arrow_rounded
                      : Icons.mic,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Attention Test',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 16.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Forward Digit Span',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
          const Padding(
            padding: EdgeInsets.only(
                top: 5.0, left: 16.0, bottom: 16.0, right: 12.0),
            child: Text(
              'A list of numbers will be read to you. Please repeat them exactly in the same order',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Score: $score',
          //     style: const TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // Center(
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //       child: Row(
          //         children: [
          //           for (var number in numbers) ...[
          //             const SizedBox(width: 8),
          //             Chip(
          //               label: Text(
          //                 number,
          //                 style: const TextStyle(
          //                     fontSize: 18, color: Colors.deepPurple),
          //               ),
          //             ),
          //           ],
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: height * 0.05),

          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.deepPurple,
          ),
          SizedBox(height: height * 0.1),
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
                child: Obx(
                  () => Text(
                    _controller.starttest.value
                        ? "Double tap the button to start test"
                        : _controller.text.value,
                    style: TextStyle(
                      fontSize: 20,
                      color: _controller.isListening.value
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                    textAlign: TextAlign.center,
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
