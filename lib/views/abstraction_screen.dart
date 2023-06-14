import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AbstractionScreen extends StatefulWidget {
  @override
  _AbstractionScreenState createState() => _AbstractionScreenState();
}

class _AbstractionScreenState extends State<AbstractionScreen> {
  List<bool> taskResults = List<bool>.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abstraction Task'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please perform the following abstraction tasks:',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: ListView(
                    children: [
                      TaskItem(
                        statement: 'Banana-Orange',
                        options: ['Fruit', 'Color', 'Vehicle', 'Animal'],
                        result: 'Fruit',
                        onChanged: (result) {
                          setState(() {
                            taskResults[0] = result;
                          });
                        },
                      ),
                      TaskItem(
                        statement: 'Train-Bicycle',
                        options: ['Fruit', 'Color', 'Vehicle', 'Animal'],
                        result: 'Vehicle',
                        onChanged: (result) {
                          setState(() {
                            taskResults[1] = result;
                          });
                        },
                      ),
                      TaskItem(
                        statement: 'Watch-Ruler',
                        options: ['Fruit', 'Color', 'Tool', 'Animal'],
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
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    final User? currentUser = FirebaseAuth.instance.currentUser;
                    if (currentUser != null) {
                      // Save the results to Firestore
                      final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
                      final DocumentReference userDoc = userCollection.doc(currentUser.uid);
                      final CollectionReference resultsCollection = userDoc.collection('abstraction_results');

                      await resultsCollection.add({'taskResults': taskResults});

                      // Process the results or navigate to the next screen
                      print('Task Results: $taskResults');
                    } else {
                      // Handle user not signed in
                      print('User is not signed in.');
                    }
                  },
                  child: Text('Submit'),
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
          'Task: ${widget.statement}',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        DropdownButton<String>(
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
        SizedBox(height: 8.0),
        // Visibility(
        //   visible: selectedOption == widget.result,
        //   child: Text(
        //     'Correct!',
        //     style: TextStyle(color: Colors.green),
        //   ),
        // ),
        // Visibility(
        //   visible: selectedOption != widget.result && selectedOption != null,
        //   child: Text(
        //     'Incorrect!',
        //     style: TextStyle(color: Colors.red),
        //   ),
        // ),
        Divider(),
      ],
    );
  }
}
