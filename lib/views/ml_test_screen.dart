import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MlTest extends StatefulWidget {
  const MlTest({super.key});

  @override
  State<MlTest> createState() => _MlTestState();
}

class _MlTestState extends State<MlTest> {
  int _counter = 0;
  static const platform = MethodChannel('example.com/channel');
  Future<void> _generateRandomNumber() async {
    int random;
    try {
      random = await platform.invokeMethod('getRandomNumber');
    } on PlatformException catch (e) {
      random = 0;
    }

    setState(() {
      _counter = random;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Kotlin generates the following number:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomNumber,
        tooltip: 'Generate',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}