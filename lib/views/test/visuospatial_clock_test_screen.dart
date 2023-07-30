import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/clock_test_controller.dart';

import '../animal_name_screen.dart';



class ClockTestScreen extends StatelessWidget {
  final ClockTestController _controller = Get.put(ClockTestController());

   ClockTestScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _controller.selectedTime != null
                  ? 'Selected Time: ${_controller.selectedTime!.hour}:${_controller.selectedTime!.minute}'
                  : 'Select a time',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showTimePickerDialog(context);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[400],
                ),
                child: const Center(
                  child: Text(
                    'Select Time',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
                  () => _controller.isLoading.value
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              )
                  : DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple,
                ),
                child: SizedBox(
                  width: 200,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () async {
                      if (_controller.selectedTime != null) {
                        _controller.increaseScore();
                        if (_controller.selectedTime!.hour == 11) {
                          _controller.increaseScore();
                        }
                        if (_controller.selectedTime!.minute == 10) {
                          _controller.increaseScore();
                        }
                      }
                      await _controller.saveScoreToFirestore();
                      Get.offAll(() => const AnimalNameGuessScreen());
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showTimePickerDialog(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selected != null) {
      _controller.setTime(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        selected.hour,
        selected.minute,
      ));
    }
  }
}
