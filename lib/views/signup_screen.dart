import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/sociodemographic_sceen.dart';
import '../controllers/signup_controller.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Create an instance of the controller
  final SignUpController _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUP'),
      ),
      body: Padding(
<<<<<<< Updated upstream
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /////Name
                const Text(
                  '1. Enter Your Name :',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _controller.name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
=======
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
                            return 'Please enter password';
                          } else if (_controller.repassword !=
                              _controller.password) {
                            return 'Password MisMatched';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters!';
                          } else if (value.contains(' ')) {
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
                            if (_formKey.currentState!.validate()) {
                              _controller
                                  .signup(
                                name: _controller.name.trim(),
                                password: _controller.password.trim(),
                                email: _controller.email.trim(),
                              )
                                  .then((value) {
                                if (value == true) {
                                  Get.offAll(
                                    () => const SocioDemographicScreen(),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text(
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
>>>>>>> Stashed changes
                ),
                ///////Email
                const SizedBox(height: 16),
                const Text(
                  '2. Enter Your Email :',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _controller.email = value;
                    });
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.contains('@xyz')) {
                      return 'Please enter a Correct Email';
                    }
                    return null;
                  },
                ),
                /////password
                const SizedBox(height: 16),
                const Text(
                  '3. Choose a Password :',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _controller.password = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                /////repassword
                const SizedBox(height: 16),
                const Text(
                  '3. Retype the Password :',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _controller.repassword = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (_controller.repassword != _controller.password) {
                      return 'Password MisMatched';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _controller
                          .loginMethod(
                        password: _controller.password,
                        email: _controller.email,
                      )
                          .then((value) {
                        return _controller.submitForm(
                          name: _controller.name,
                          password: _controller.password,
                          email: _controller.email,
                        );
                      }).then((value) =>
                              Get.to(() => const SocioDemographicScreen()));
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
