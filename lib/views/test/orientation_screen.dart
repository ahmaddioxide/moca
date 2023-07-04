import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/orientation_controller.dart';

class OrientationScreen extends StatelessWidget {
  final OreientationController controller = Get.put(OreientationController());

  OrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Date Verification',
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please enter the following details:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                    labelText: 'Date-Month-Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.placeController,
              decoration: const InputDecoration(
                labelText: 'Place',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.deepPurple,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {

                      controller.verifyInputs();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Results:'),
            Obx(() => Text('Is Day Correct? ${controller.isDayCorrect.value}')),
            Obx(() =>
                Text('Is Place Correct? ${controller.isPlaceCorrect.value}')),
            Obx(() =>
                Text('Is City Correct? ${controller.isCityCorrect.value}')),
          ],
        ),
      ),
    );
  }
}
