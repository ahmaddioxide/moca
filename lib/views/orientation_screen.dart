import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/orientation_controller.dart';

class OreientationScreen extends StatelessWidget {
  final OreientationController controller = Get.put(OreientationController());

  OreientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please enter the following details:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                controller.selectDate(context);
              },
              child: IgnorePointer(
                child: TextField(
                  controller: controller.dayController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                  ),
                ),
              ),
            ),
            TextField(
              controller: controller.placeController,
              decoration: const InputDecoration(
                labelText: 'Place',
              ),
            ),
            TextField(
              controller: controller.cityController,
              decoration: const InputDecoration(
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.verifyInputs();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16.0),
            const Text('Results:'),
            Obx(() => Text('Is Day Correct? ${controller.isDayCorrect.value}')),
            Obx(() => Text('Is Place Correct? ${controller.isPlaceCorrect.value}')),
            Obx(() => Text('Is City Correct? ${controller.isCityCorrect.value}')),
          ],
        ),
      ),
    );
  }
}

