import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CatDogClassifier extends StatefulWidget {
  // static const String id = 'catDogClassifier';

  const CatDogClassifier({super.key});

  @override
  _CatDogClassifierState createState() => _CatDogClassifierState();
}

class _CatDogClassifierState extends State<CatDogClassifier> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  classifyImage(File image) async {
    var interpreter = await Interpreter.fromAsset('assets/model.tflite');
    // var labels = await File('assets/labels.txt').readAsString();
    var input = image.readAsBytesSync();
    var output = List.filled(1 * 2, 0).reshape([1, 2]);
    interpreter.run(input, output );

    // print(output);

    setState(() {
      _loading = false;
      _output = output;
    });
  }

  loadModel() async {
    await Interpreter.fromAsset(
        'assets/model.tflite',

    );
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {});
  }

  // @override
  // void dispose() {
  //   Interpreter.close();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text(
            'Pets Classification',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(
              color: Colors.white
          ),
          centerTitle: false,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.004, 1],
              colors: [
                Color(0xFF000000),
                Color(0xFF3d3d3d),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Detect Cats and Dogs',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: _loading
                    ? SizedBox(
                  width: 250,
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/pic3.png'),
                      const SizedBox(height: 50),
                    ],
                  ),
                )
                    : Column(
                      children: <Widget>[
                        SizedBox(
                          height: 250,
                          child: Image.file(_image),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _output != null
                            ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text('It\'s ${_output[0]['label']}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        )
                            : Container(),
                      ],
                    ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(onPressed: pickImage, child: const Text("From Camera")),
                    const SizedBox(height: 15),
                    ElevatedButton(onPressed: pickGalleryImage, child: const Text("From Gallery")),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}