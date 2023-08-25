import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/homescreen_controller%20.dart';
import 'package:moca/views/covidexperience_sceen.dart';
import 'package:moca/views/medicalhistory_sceen.dart';
import 'package:moca/views/sociodemographic_sceen.dart';
import 'package:moca/views/symptoms_initial_illness_screen.dart';
import 'package:moca/views/symptoms_ongoing_illness_screen.dart';
import 'package:moca/views/test_main_screens.dart';

import 'cognitive_failure_screen.dart';
import 'on_boarding_screens/on_boarding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final HomeScreenController _controller = Get.put(HomeScreenController());
  ////signout button

  //alert dialog which shows the information about the app
  void _showAlert() {
    Get.defaultDialog(
      title: 'About MOCA',
      titleStyle: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      content: const Text(
        'Details: \n MOCA is a mobile application that aims to help the medical professionals to collect data from patients in a more efficient way. Information: \n It is a digital version of the paper-based questionnaire that is used to collect data from patients. The app is developed by the students of the Air University as a part of the final year project.',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'MOCA',
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 1.0, 0.0),
              child: IconButton(
                onPressed: () {
                  _showAlert();
                },
                icon: const Icon(Icons.info_outlined),
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1.0, 0.0, 2.0, 0.0),
              child: IconButton(
                onPressed: () async {
                  await _auth.signOut();
                  Get.offAll(() => const OnBoardingPage());
                },
                icon: const Icon(Icons.exit_to_app),
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          if (await _controller.checkIfSocioDemoGraphExists() !=
                              true) {
                            Get.offAll(() => const SocioDemographicScreen());
                          } else {
                            Get.snackbar(
                              'Attention!',
                              'The Form is already Filled!',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blueAccent,
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                            'Attention!',
                            'Error Occured!',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Container(
                        height: height * .25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 16,
                                bottom: 16,
                              ),
                              child: SizedBox(
                                height: height * .2,
                                width: width * .2,
                                child: Image.asset(
                                  'assets/images/personal.png',
                                  height: height * .2,
                                  width: width * .2,
                                  fit: BoxFit
                                      .contain, // Make sure the image fits within the available space
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .05,
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'SOCIO-DEMOGRAPHIC DATA',
                                  style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          if (await _controller.checkIfMedicalHistoryExists() !=
                              true) {
                            Get.offAll(() => const MedicalHistoryScreen());
                          } else if (await _controller
                                  .checkIfCovidExperienceExists() !=
                              true) {
                            Get.offAll(() => const CovidExperienceScreen());
                          } else if (await _controller
                                  .checkIfInitialIllnessExists() !=
                              true) {
                            Get.offAll(
                                () => const SymptomsInitialIllnessScreen());
                          } else if (await _controller
                                  .checkIfOngoingIllnessExists() !=
                              true) {
                            Get.offAll(
                                () => const SymptomsOnGoingIllnessScreen());
                          } else if (await _controller
                                  .checkIfCognitiveExists() !=
                              true) {
                            Get.offAll(() => const CognitiveFailure());
                          } else {
                            Get.snackbar(
                              'Attention!',
                              'The Form is already Filled!',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blueAccent,
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                            'Attention!',
                            'Error Occured!',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Container(
                        height: height * .25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          // color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 16,
                                bottom: 16,
                              ),
                              child: SizedBox(
                                height: height * .2,
                                width: width * .2,
                                child: Image.asset(
                                  'assets/images/health.png',
                                  height: height * .2,
                                  width: width * .2,
                                  fit: BoxFit
                                      .contain, // Make sure the image fits within the available space
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .05,
                            ),
                            const Expanded(
                              // Use Expanded widget here to fill the remaining width
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'MEDICAL HISTORY AND HEALTH-RELATED BEHAVIOURS ',
                                  style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainTestScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: height * .25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          // color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 16,
                                bottom: 16,
                              ),
                              child: SizedBox(
                                height: height * .2,
                                width: width * .2,
                                child: Image.asset(
                                  'assets/images/bacteria.png',
                                  height: height * .2,
                                  width: width * .2,
                                  fit: BoxFit
                                      .contain, // Make sure the image fits within the available space
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .05,
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'MONTREAL COGNITIVE ASSESSMENT (MoCA)',
                                  style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
