import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/animal_name_screen.dart';
import 'package:moca/views/test/backward_test_screen.dart';
import 'package:moca/views/test/forward_test_screen.dart';
import 'package:moca/views/test/abstraction_screen.dart';
import 'package:moca/views/test/memory_test_screen.dart';
import 'package:moca/views/test/orientation_screen.dart';
import 'package:moca/views/test/sentence_repetition_screen.dart';
import 'package:moca/views/test/serial7_test_screen.dart';
import 'package:moca/views/test/vigilance_test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainTestScreen extends StatefulWidget {
  const MainTestScreen({super.key});

  @override
  _MainTestScreenState createState() => _MainTestScreenState();
}

class _MainTestScreenState extends State<MainTestScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _unlockedGames = prefs.getInt('nextGame') ?? 1;
      });
    });
  }
   int _unlockedGames=1;

  void _playGame(int gameNumber) {
    if (gameNumber == _unlockedGames) {
      switch (gameNumber) {
        case 1:
          Get.offAll(() => const AnimalNameGuessScreen());
          break;
        case 2:
          Get.offAll(() => const AnimalNameGuessScreen());
          break;
        case 3:
          Get.offAll(() => const MemoryTestScreen());
          break;
        case 4:
          Get.offAll(() => const ForwardDigitSpan());
          break;
        case 5:
          Get.offAll(() => const BackwardDigitSpan());
          break;
        case 6:
          Get.offAll(() => const VigilanceScreen());
          break;
        case 7:
          Get.offAll(() => const Serial7Screen());
          break;
          case 8:
          Get.offAll(() => const SentenceRepetitionScreen());
          break;
          case 9:
          Get.offAll(() =>  AbstractionScreen());
          case 10:
          // Get.offAll(() => const AnimalNameGuessScreen());
          break;
          case 11:
          Get.offAll(() => OrientationScreen());
          break;

        default:
          Navigator.pushNamed(context, '/animal_name_screen');
      }
    } else {
      // Show a message that the game is locked
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Game Locked'),
          content: Text('You need to complete Game ${gameNumber - 1} first.'),
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
        title: const Text('Main Test Screen'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: List.generate(12, (index) {
            int gameNumber = index + 1;
            bool isLocked = gameNumber != _unlockedGames;

            return ElevatedButton(
              onPressed: () => _playGame(gameNumber),
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
                backgroundColor: isLocked ? Colors.grey : Colors.deepPurple,
                minimumSize: const Size(120, 120),
              ),
              child: Text(
                'Game $gameNumber',
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


