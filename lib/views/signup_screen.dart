import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/home_screen.dart';
import 'package:moca/views/on_boarding_screens/on_boarding_screen.dart';
import '../controllers/signup_controller.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final SignUpController _controller = Get.put(SignUpController());
  bool _isPasswordVisible = false;
  bool _isRepasswordVisible = false;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: Get.height * 0.07),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              Image(
                image: const AssetImage('assets/illustrations/Signup.png'),
                height: Get.height * 0.3,
                width: Get.width * 0.6,
                fit: BoxFit.cover,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          // hintText: 'Enter Your Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                          labelText: 'Enter Your Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              _controller.name = value;
                            },
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepPurple,
                          ),
                          labelText: 'Enter Your Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _controller.email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          } else if (!value.contains('.')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains(' ')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains('..')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      TextFormField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.fingerprint_outlined,
                            color: Colors.deepPurple,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isPasswordVisible = !_isPasswordVisible;
                                },
                              );
                            },
                          ),
                          labelText: 'Enter Your Password',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _controller.password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters!';
                          } else if (value.contains(' ')) {
                            return 'Password must not contain space!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      TextFormField(
                        obscureText: !_isRepasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.fingerprint_outlined,
                            color: Colors.deepPurple,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isRepasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              setState(() {
                                _isRepasswordVisible = !_isRepasswordVisible;
                              });
                            },
                          ),
                          labelText: 'Re-Enter Your Password',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _controller.repassword = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isloading = false;
                            });
                            return 'Please enter password';
                          } else if (_controller.repassword !=
                              _controller.password) {
                            setState(() {
                              _isloading = false;
                            });
                            return 'Password MisMatched';
                          } else if (value.length < 6) {
                            setState(() {
                              _isloading = false;
                            });
                            return 'Password must be at least 6 characters!';
                          } else if (value.contains(' ')) {
                            setState(() {
                              _isloading = false;
                            });
                            return 'Password must not contain space!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      SizedBox(
                        width: double.infinity,
                        height: Get.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _isloading = true;
                            });

                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Before you start....'),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                          'This self-assessment tool consists of a set of 25 short questions (Cognitive Failures Questionnaire) followed by a series of interactive brain games (Montreal Cognitive Assessment). You will also be asked to provide your name, age, gender, residence, education, profession as well as your personal health information and experience with COVID-19 illness. The whole study should run in under 20 minutes. For accurate results, you are encouraged to complete it in one sitting. On completion, you will receive feedback on your performance, and personalised tips to strengthen your brain. Please note: Your participation in this study is entirely voluntary. You may refuse to take part, or discontinue at any time without any consequences. However, by participating, you are consenting to your data being used to assist in the latest research into neurocognitive science. The information we collect will be analysed anonymously. Personally identifiable information will be kept confidential and will not be shared with any third party. You will not benefit directly from participating in this study, but your contribution will help us gain a better understanding of post-COVID cognitive impairment, ultimately leading to improved prevention, screening, and treatment strategies. Taking part in this study has no anticipated risks. If you agree to these terms, click \'I Agree\' to continue. DISCLAIMER: CogQuest results are only indicative. They, in no case, can legally replace or question the diagnosis made by a physician.'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('I Agree'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      if (_formKey.currentState!.validate()) {
                                        _controller
                                            .signup(
                                          name: _controller.name.trim(),
                                          password: _controller.password.trim(),
                                          email: _controller.email.trim(),
                                        )
                                            .then((value) {
                                          if (value == true) {
                                            setState(() {
                                              _isloading = false;
                                            });
                                            Get.offAll(
                                              () => const HomeScreen(),
                                            );
                                          }
                                        });
                                      } else {
                                        setState(() {
                                          _isloading = false;
                                        });
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Don\'t Agree'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Get.offAll(() => const OnBoardingPage());
                                    },
                                  ),
                                ],
                              ),
                            );
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
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                        backgroundColor: Colors.blue,
                                        strokeWidth: 4,
                                      ),
                                    )
                                  ],
                                )
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAll(() =>
                                  const LogInScreen()); // Navigate to the LoginScreen
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
