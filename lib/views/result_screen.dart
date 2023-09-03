import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/result_controller.dart';
import 'package:moca/views/home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int? totalScore = 0;
  int? totalCfq = 0;
  String? userName;
  String? userEmail;
  String? userGender;

  final ResultController _controller = Get.put(ResultController());
  @override
  void initState() {
    super.initState();
    _controller.fetchUserScore().then((score) {
      setState(() {
        totalScore = score;
      });
    });
    _controller.fetchUserName().then((name) {
      setState(() {
        userName = name;
      });
    });
    _controller.fetchUserEmail().then((email) {
      setState(() {
        userEmail = email;
      });
    });
    _controller.fetchUserGender().then((gender) {
      setState(() {
        userGender = gender;
      });
    });
    _controller.fetchUserCfq().then((cfq) {
      setState(() {
        totalCfq = cfq;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // double percentage = (totalScore! / 30) * 100;
    String message;
    String src = 'assets/illustrations/Signup.png';
    if (totalScore! <= 30 && totalScore! >= 26) {
      message = 'Normal';
      src = "assets/illustrations/normalperson.png";
    } else if (totalScore! <= 25 && totalScore! >= 18) {
      message = 'Mild Cognitive Impairment';
      src = "assets/illustrations/mildsick.png";
    } else if (totalScore! <= 17 && totalScore! >= 10) {
      message = ' Moderate Cognitive Impairment';
      src = "assets/illustrations/moderatesick.png";
    } else {
      message = 'Severe Cognitive Impairment';
      src = "assets/illustrations/severesick.png";
    }
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Results',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Name: ", style: TextStyle(fontSize: 20)),
                    Flexible(
                      child: Text(
                        userName ?? "Loading...",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Email: ", style: TextStyle(fontSize: 20)),
                    Flexible(
                      child: Text(
                        userEmail ?? "Loading...",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Gender: ", style: TextStyle(fontSize: 20)),
                    Flexible(
                      child: Text(
                        userGender ?? "Loading...",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: Container(
                  width: width * 0.9,
                  height: height * 0.62,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              const Text(
                                "MOCA Score is: ",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "$totalScore  / 30",
                                  style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              const Text(
                                "CFQ Score is : ",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                totalCfq.toString(),
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    message,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage(src),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAll(() => const HomeScreen());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding:
                                    const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: const Text(
                              "Homepage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
