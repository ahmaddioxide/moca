import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/constants/list.dart';
import 'package:moca/views/animal_name_screen.dart';
import 'package:moca/views/test/backward_test_screen.dart';
import 'package:moca/views/test/connecting_dot_screen.dart';
import 'package:moca/views/test/cube_drawing_test_screen.dart';
import 'package:moca/views/test/delayRecall_test_screen.dart';
import 'package:moca/views/test/forward_test_screen.dart';
import 'package:moca/views/test/abstraction_screen.dart';
import 'package:moca/views/test/memory_test_screen.dart';
import 'package:moca/views/test/orientation_screen.dart';
import 'package:moca/views/test/sentence_repetition_screen.dart';
import 'package:moca/views/test/serial7_test_screen.dart';
import 'package:moca/views/test/verbalfluency_test_screen.dart';
import 'package:moca/views/test/vigilance_test_screen.dart';
import 'package:moca/views/test/visuospatial_clock_test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainTestScreen extends StatefulWidget {
  const MainTestScreen({super.key});

  @override
  _MainTestScreenState createState() => _MainTestScreenState();
}

class _MainTestScreenState extends State<MainTestScreen> {
  late int gameNumber;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _unlockedGames = prefs.getInt('nextGame') ?? 1;
      });
    });
  }

  late int _unlockedGames = 1;

  void _playGame(gameNumber) {
    if (gameNumber == _unlockedGames) {
      switch (gameNumber) {
        case 1:
          Get.offAll(() => const ConnectingDotsScreen());
          break;
        case 2:
          Get.offAll(() => const DrawingScreen());
          break;
        case 3:
          Get.offAll(() => const ClockTestScreen());
          break;
        case 4:
          Get.offAll(() => const AnimalNameGuessScreen());
          break;
        case 5:
          Get.offAll(() => const MemoryTestScreen());
          break;
        case 6:
          Get.offAll(() => const ForwardDigitSpan());
          break;
        case 7:
          Get.offAll(() =>  BackwardDigitSpan());
          break;
        case 8:
          Get.offAll(() => const VigilanceScreen());
          break;
        case 9:
          Get.offAll(() => const Serial7Screen());
        case 10:
          Get.offAll(() => const SentenceRepetitionScreen());
          break;
        case 11:
          Get.offAll(() => const VocabularyScreen());
          break;
        case 12:
          Get.offAll(() => const AbstractionScreen());
          break;
        case 13:
          Get.offAll(() => const DelayRecallScreen());
        case 14:
          Get.offAll(() => const OrientationScreen());
          break;

        // default:
        //   Navigator.pushNamed(context, '/animal_name_screen');
      }
    } else {
      // Show a message that the game is locked
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Game Locked'),
          content: Text('You need to complete Game $_unlockedGames  first.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Main Test Screen',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        )),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: List.generate(14, (index) {
            int gameNumber = index + 1;
            bool isLocked = gameNumber != _unlockedGames;

            return ElevatedButton(
              onPressed: () => _playGame(gameNumber),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.deepPurple,
                elevation: 10,
                side: const BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                backgroundColor: isLocked ? Colors.grey : Colors.deepPurple,
                minimumSize: const Size(100, 120),
              ),
              child: Text(
                "Game ${gameNameList[gameNumber - 1]}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
        ),
      ),
    );
  }
}
