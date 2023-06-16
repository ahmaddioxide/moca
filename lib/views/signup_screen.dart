import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/sociodemographic_sceen.dart';
import '../controllers/signup_controller.dart';

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
        title: const Text('Sign Up'),
      ),
      body: Padding(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Log In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
