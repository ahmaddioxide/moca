import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/digitspan_controller.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'Backward_Digit_Span.dart';

class ForwardDigitSpan extends StatefulWidget {
  const ForwardDigitSpan({Key? key}) : super(key: key);

  @override
  State<ForwardDigitSpan> createState() => _ForwardDigitState();
}

class _ForwardDigitState extends State<ForwardDigitSpan> {
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  final DigitSpanController _controller = Get.put(DigitSpanController());
  String text = "Hold the button and start speaking";
  bool isListening = false;
  int score = 0;
  var numbers = ['2', '4', '5', '7', '9'];
  bool isReading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _speakNumbers();
    });
  }

  void _speakNumbers() async {
    setState(() {
      isReading = true;
    });

    for (var number in numbers) {
      await flutterTts.speak(number);
      await Future.delayed(const Duration(seconds: 1));
    }

    setState(() {
      isReading = false;
    });
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
            if (!isListening && !isReading) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                        var recognizedWords = text.replaceAll('', ' ').split(' ');
                        var numbersJoined = numbers.join('');
                        if (recognizedWords.join('') == numbersJoined) {
                          score++;
                          _controller.incrementScore();
                        }
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
            Future.delayed(const Duration(seconds: 3), () {
              Get.offAll(() => const BackwardDigitSpan());
            });

          },
          child: CircleAvatar(
            backgroundColor: isReading ? Colors.grey : Colors.deepPurple,
            radius: 40,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Attention Test',
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
          const Padding(
            padding: EdgeInsets.only(top: 5.0, left: 16.0),
            child: Text(
              'Forward Digit Span',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, left: 16.0,bottom: 16.0, right: 12.0),
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
          const Padding(
            padding: EdgeInsets.only(top: 5.0, left: 16.0, bottom: 16.0, right: 12.0),
            child: Text(
              'Numbers:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    for (var number in numbers) ...[
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(number, style: const TextStyle(fontSize: 18, color: Colors.deepPurple),),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.deepPurple,
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
                    fontSize: 20,
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
