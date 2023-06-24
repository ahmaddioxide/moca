import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/home_screen.dart';
import '../constants/list.dart';
import '../controllers/animal_name_controller.dart';

class AnimalNameGuessScreen extends StatefulWidget {
  const AnimalNameGuessScreen({super.key});

  @override
  _AnimalNameGuessScreenState createState() => _AnimalNameGuessScreenState();
}

class _AnimalNameGuessScreenState extends State<AnimalNameGuessScreen> {
  final AnimalNameTestController _controller =
      Get.put(AnimalNameTestController());

  int currentPictureIndex = 0;
  int score = 0;
  TextEditingController guessController = TextEditingController();

  void checkAnswer(String guess) {
    String answer = animalsNameList[currentPictureIndex];
    if (guess.toLowerCase() == answer.toLowerCase()) {
      setState(() {
        score++;
        guessController.clear();
        if (currentPictureIndex < animalsPicList.length - 1) {
          currentPictureIndex++;
        } else {
          // Game Over
          _showGameOverDialog();
        }
      });
    } else {
      setState(() {
        guessController.clear();
        if (currentPictureIndex < animalsPicList.length - 1) {
          currentPictureIndex++;
        } else {
          // Game Over
          _showGameOverDialog();
        }
      });
    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: const Text('Thank You for Playing'),
          actions: <Widget>[
            TextButton(
              child: const Text('Next'),
              onPressed: () {
                {
                  if (_controller.score != -1) {
                    _controller
                        .submitForm(
                      score: score,
                    )
                        .then((value) {
                      if (value == true) {
                        setState(() {
                          currentPictureIndex = 0;
                          score = 0;
                        });
                        Get.offAll(const HomePage());
                      }
                    });
                  } else {
                    Get.snackbar(
                      'Error',
                      'Complete the Form !',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Guess The Picture',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      animalsPicList[currentPictureIndex],
                    ),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // Image.asset(
              //   animalsPicList[currentPictureIndex],
              //   width: 200,
              //   height: 200,
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: guessController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Enter your guess',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ),
                      )),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                ),
                onPressed: () {
                  try {
                    if (guessController.text.isNotEmpty) {
                      String guess = guessController.text;
                      checkAnswer(guess);
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please Enter Name of the Animal',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  } catch (e) {
                    Get.snackbar(
                      'Error',
                      'Some Error Occured!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
