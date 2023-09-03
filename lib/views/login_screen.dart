import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/home_screen.dart';
import 'package:moca/views/signup_screen.dart';
import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  final LogInController _controller = Get.put(LogInController());
  bool _isPasswordVisible = false;
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
                'Log In',
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
                          } else if (value.contains(' ')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains('..')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains('examples')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains('example')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains('@test')) {
                            return 'Please Enter Valid Email';
                          } else if (value.contains('@testing')) {
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
                            setState(() {
                              _isloading = false;
                            });
                            return 'Please enter password';
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
                            try {
                              setState(() {
                                _isloading = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                _controller
                                    .logIn(
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
                                  } else {
                                    setState(() {
                                      _isloading = false;
                                    });
                                  }
                                });
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
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                        backgroundColor: Colors.blue,
                                        strokeWidth: 4,
                                      ),
                                    )
                                  ],
                                )
                              : const Text(
                                  'Log In',
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
                                  const SignUpScreen()); // Navigate to the LoginScreen
                            },
                            child: const Text(
                              "Sign Up",
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
