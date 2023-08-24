import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/memory_test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool _isloading = false;

  late SharedPreferences sf;
  @override
  initState() {
    super.initState();
    initalizeSharedPref();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

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
          title: const Text('Thank You for Playing'),
          content: const Text('Moving On to Next Game'),
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
                        .then((value) async {
                      if (value == true) {
                        await sf.setInt('animalGameScore', score);
                        int scoredata = sf.getInt('animalGameScore') ?? 0;
                        debugPrint('scoredata:');
                        debugPrint(scoredata.toString());
                        setState(() {
                          currentPictureIndex = 0;
                          score = 0;
                        });
                        await sf.setInt('nextGame', 5);
                        Get.offAll(() => const MemoryTestScreen());
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
                width: 280,
                height: 270,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: guessController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {
                  setState(() {
                    _isloading = true;
                  });
                  try {
                    if (guessController.text.isNotEmpty) {
                      String guess = guessController.text;
                      checkAnswer(guess);
                      setState(() {
                        _isloading = false;
                      });
                    } else {
                      setState(() {
                        _isloading = false;
                      });
                      Get.snackbar(
                        'Error',
                        'Please Enter Name of the Animal',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  } catch (e) {
                    setState(() {
                      _isloading = false;
                    });
                    Get.snackbar(
                      'Error',
                      'Some Error Occured!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: _isloading == true
                    ? const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Loading",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              backgroundColor: Colors.blue,
                              strokeWidth: 4,
                            ),
                          )
                        ],
                      )
                    : const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
