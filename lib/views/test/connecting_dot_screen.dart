import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/cube_drawing_test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

import '../../controllers/connecting_dots_controller.dart';

class ConnectingDotsScreen extends StatefulWidget {
  const ConnectingDotsScreen({super.key});

  @override
  _DotScreenState createState() => _DotScreenState();
}

class _DotScreenState extends State<ConnectingDotsScreen> {
  final ConnectingDotsController _controller =
      Get.put(ConnectingDotsController());
  List<int> selectedIndices = [];
  late SharedPreferences sf;
  @override
  void initState() {
    super.initState();
    initalizeSharedPref();
    Future.delayed(const Duration(seconds: 2), () {
      _countdownTimer();
    });
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

  bool nextscreen = false;
  final List<dynamic> patternSequence = [
    1,
    'A',
    2,
    'B',
    3,
    'C',
    4,
    'D',
    5,
    'E'
  ];

  var isPatternCorrect = [];
  bool randomizeDots = true;
  int score = 0;

  List<Offset> dotPositions = [];
  List<dynamic> selectedValues = [];
  bool isTimerStarted = false;

  void selectDot(int index) {
    setState(() {
      if (selectedIndices.isNotEmpty && selectedIndices.last == index) {
        // Unselect the last dot if it is already selected
        selectedIndices.removeLast();
        selectedValues.removeLast();
      } else {
        // Select the dot
        if (selectedValues.contains(patternSequence[index])) {
        } else {
          selectedIndices.add(index);
          selectedValues
              .add(patternSequence[index]); // Store the selected dot value
          // print(selectedValues);
          // print(selectedValues.length);
        }
      }
      if (selectedValues.length == patternSequence.length) {
        _validatePattern();
        nextText();
      }

      // isPatternCorrect.add(());
    });
  }

  void _validatePattern() {
    for (int i = 0; i < patternSequence.length; i++) {
      if (selectedValues[i] == patternSequence[i]) {
        score++;
        // print("score: $score");
      } else {
        return;
      }
    }

    return;
  }

  Offset getRandomDotPosition(
      Size containerSize, List<Offset> existingPositions) {
    final random = Random();
    const dotSize = 50.0;

    const minX = dotSize;
    const minY = dotSize;
    final maxX = containerSize.width - dotSize;
    final maxY = containerSize.height - dotSize;

    Offset newPosition;
    bool isOverlapping = false;

    do {
      final x = minX + random.nextDouble() * (maxX - minX);
      final y = minY + random.nextDouble() * (maxY - minY);
      newPosition = Offset(x, y);

      isOverlapping = existingPositions.any((position) {
        final distance = (position - newPosition).distance;
        return distance <
            dotSize * 2; // Check if dots are too close to each other
      });
    } while (isOverlapping);

    return newPosition;
  }

  void _countdownTimer() async {
    while (_controller.remainingSeconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      _controller.decrementSeconds();
    }
    isTimerStarted = false;

    if (nextscreen == false) {
      nextText();
    }
  }

  Future<void> nextText() async {
    nextscreen = true;

    if (score == 10) {
      await _controller.updatetestScore(1);
    } else {
      await _controller.updatetestScore(0);
    }
    Future.delayed(const Duration(seconds: 3));
    {
      sf.setInt('nextGame', 2);
      Get.offAll(() => const DrawingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visualisation Test',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Connect the Dots',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Select Dots, going from a number to a letter in ascending order. First select a number then select a letter. Begin from 1 and then to A then to 2 and so on.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            const Divider(
              thickness: 1,
              color: Colors.deepPurple,
              indent: 16,
              endIndent: 16,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
            Obx(
              () => Text(
                "Remaining Time: ${_controller.remainingSeconds} sec",
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.grey[300],
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final containerSize =
                      Size(constraints.maxWidth, constraints.maxHeight);

                  dotPositions.clear();
                  for (int i = 0; i < patternSequence.length; i++) {
                    final newPosition =
                        getRandomDotPosition(containerSize, dotPositions);
                    dotPositions.add(newPosition);
                  }

                  return Stack(
                    children: [
                      for (var i = 0; i < patternSequence.length; i++)
                        Positioned(
                          left: dotPositions[i].dx - 25,
                          top: dotPositions[i].dy - 25,
                          child: GestureDetector(
                            onTap: () {
                              selectDot(i);
                            },
                            child: Dot(
                              index: patternSequence[i],
                              isSelected: selectedIndices.contains(i),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final dynamic index;
  final bool isSelected;

  const Dot({super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
