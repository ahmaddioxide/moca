import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/abstraction_controller.dart';

class AbstractionScreen extends StatefulWidget {
  @override
  _AbstractionScreenState createState() => _AbstractionScreenState();
}

class _AbstractionScreenState extends State<AbstractionScreen> {
  List<bool> taskResults = List<bool>.filled(3, false);
  final controller = Get.put(AbstractionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abstraction Task'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please perform the following abstraction tasks:',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView(
                    children: [
                      TaskItem(
                        statement: 'Banana-Orange',
                        options: const ['Fruit', 'Color', 'Vehicle', 'Animal'],
                        result: 'Fruit',
                        onChanged: (result) {
                          setState(() {
                            taskResults[0] = result;
                          });
                        },
                      ),
                      TaskItem(
                        statement: 'Train-Bicycle',
                        options: const ['Fruit', 'Color', 'Vehicle', 'Animal'],
                        result: 'Vehicle',
                        onChanged: (result) {
                          setState(() {
                            taskResults[1] = result;
                          });
                        },
                      ),
                      TaskItem(
                        statement: 'Watch-Ruler',
                        options: const ['Fruit', 'Color', 'Tool', 'Animal'],
                        result: 'Tool',
                        onChanged: (result) {
                          setState(() {
                            taskResults[2] = result;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: () async {
                        controller.submitTaskResults(taskResults);
                      },
                      child:const  Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String statement;
  final List<String> options;
  final String result;
  final ValueChanged<bool> onChanged;

  TaskItem({
    required this.statement,
    required this.options,
    required this.result,
    required this.onChanged,
  });

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.statement,
          style:const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        SizedBox(height: Get.height*0.01),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              hint: const Text('Select an option'),
              underline: const SizedBox(),
              isExpanded: true,
              value: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                  widget.onChanged(value == widget.result);
                });
              },
              items: widget.options.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: Get.height*0.01),
        const Divider(),
      ],
    );
  }
}