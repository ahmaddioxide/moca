import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> convertDataToCSV() async {
    final List<List<dynamic>> csvData = [];
    final List<dynamic> headers = [
      "Name", "Age", "other Details",
    ];

    csvData.add(headers);

    const String csvString = "" ;
    return csvString;
  }

  Future<void> downloadCSV() async {

  }
}