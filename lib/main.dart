import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moca/views/Symptoms_initial_illness_screen%20.dart';

import 'firebase_options.dart';
import 'views/covidexperience_sceen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => debugPrint('Firebase initialized in main.dart'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SymptomsInitialIllnessScreen(),
    );
  }
}
