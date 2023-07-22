import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/backward_test_screen.dart';
import 'package:moca/views/test/cube_drawing_test_screen.dart';
import 'package:moca/views/test/delayRecall_test_screen.dart';
import 'package:moca/views/test/forward_test_screen.dart';
import 'package:moca/views/test/memory_test_screen.dart';
import 'package:moca/views/test/sentence_repetition_screen.dart';
import 'package:moca/views/test/serial7_test_screen.dart';
import 'package:moca/views/test/connecting_dot_screen.dart';
import 'package:moca/views/test/verbalfluency_test_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => debugPrint('Firebase initialized in main.dart'));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MOCA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const DrawingScreen(),
    );
  }
}
