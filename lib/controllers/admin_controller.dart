import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxInt _totalSubmissionsCount = RxInt(0);
  Rx<int> get totalSubmissionCount => _totalSubmissionsCount;
  RxBool _isTotalSubmissionLoaded = RxBool(false);
  Rx<bool> get isTotalSubmissionLoaded => _isTotalSubmissionLoaded;


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

  Future<void> getTotalSubmissions() async {
    final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

    for(var doc in querySnapshot.docs) {
      debugPrint("${doc.id}");
    }
    _totalSubmissionsCount = querySnapshot.docs.length.obs;
    _isTotalSubmissionLoaded = true.obs;
    update();
    debugPrint("${querySnapshot.docs.length}");
    //debugPrint("${_isTotalSubmissionLoaded}");
  }
}