import 'package:flutter/material.dart';
import 'package:get/get.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body:  Center(
        child: Container(
          color: Colors.deepPurple,
          height: Get.height * 0.5,
          width: Get.width * 0.5,
        )
      ),
    );
  }
}
