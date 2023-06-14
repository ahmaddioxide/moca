import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DateVerificationScreen extends StatefulWidget {
  @override
  _DateVerificationScreenState createState() => _DateVerificationScreenState();
}

class _DateVerificationScreenState extends State<DateVerificationScreen> {
  TextEditingController dayController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  bool isDayCorrect = false;
  bool isPlaceCorrect = false;
  bool isCityCorrect = false;

  DateTime currentDate = DateTime.now();

  @override
  void dispose() {
    dayController.dispose();
    placeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  Future<void> saveResultsToFirestore() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Save the results to Firestore
      final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
      final DocumentReference userDoc = userCollection.doc(currentUser.uid);
      final CollectionReference resultsCollection =
      userDoc.collection('date_verification_results');

      await resultsCollection.add({
        'isDayCorrect': isDayCorrect,
        'isPlaceCorrect': isPlaceCorrect,
        'isCityCorrect': isCityCorrect,
      });
    } else {
      // Handle user not signed in
      print('User is not signed in.');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      currentDate: DateTime.parse("2023-06-01 11:06:21.240752"),
      initialDate:
           DateTime.parse("2023-06-01 11:06:21.240752"),

      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        currentDate = picked;
        dayController.text = currentDate.day.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter the following details:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: IgnorePointer(
                child: TextField(
                  controller: dayController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                  ),
                ),
              ),
            ),
            TextField(
              controller: placeController,
              decoration: InputDecoration(
                labelText: 'Place',
              ),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Check the correctness of the inputs
                setState(() {
                  isDayCorrect = dayController.text ==
                      currentDate.day.toString();
                  isPlaceCorrect = placeController.text == 'Some Place';
                  isCityCorrect = cityController.text == 'Some City';
                });

                // Save the results to Firestore
                saveResultsToFirestore();
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16.0),
            Text('Results:'),
            Text('Is Day Correct? $isDayCorrect'),
            Text('Is Place Correct? $isPlaceCorrect'),
            Text('Is City Correct? $isCityCorrect'),
          ],
        ),
      ),
    );
  }
}
