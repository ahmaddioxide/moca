import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //alert dialog which shows the information about the app
  void _showAlert(){
    Get.defaultDialog(
      title: 'About MOCA',
      titleStyle: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      content: const Text(
        'MOCA is a mobile application that aims to help the medical professionals to collect data from patients in a more efficient way. It is a digital version of the paper-based questionnaire that is used to collect data from patients. The app is developed by the students of the Air University as a part of the final year project.',
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
          title: const Text('MOCA', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  _showAlert();
                },
                icon: const Icon(Icons.info_outlined),
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
                        // color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16,),
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
                              padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0,),
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
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
                            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16,),
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
                              padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0,),
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
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
                            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16,),
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
                              padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0,),
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
                ],
              ),
            ),
          ),
        ));
  }
}
