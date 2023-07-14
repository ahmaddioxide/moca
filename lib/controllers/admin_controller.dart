import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_file_saver/file_saver.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AdminController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxInt _totalSubmissionsCount = RxInt(0);

  Rx<int> get totalSubmissionCount => _totalSubmissionsCount;
  RxBool _isTotalSubmissionLoaded = RxBool(false);

  Rx<bool> get isTotalSubmissionLoaded => _isTotalSubmissionLoaded;
  TextEditingController userSearchBar = TextEditingController();
  RxBool _isUserSearchFound = RxBool(false);

  RxBool get isUserSearchFound => _isUserSearchFound;
  RxBool _userSearchIsLoading = RxBool(false);

  RxBool get userSearchIsLoading => _userSearchIsLoading;
  RxString _searchedUserName = RxString('notFound');

  Rx<String> get searchedUserName => _searchedUserName;
  RxInt _searchedUserTotalScore = RxInt(0);

  Rx<int> get searchedUserTotalScore => _searchedUserTotalScore;
  RxString _searchedUserEmail = RxString('notFound');

  Rx<String> get searchedUserEmail => _searchedUserEmail;

  QuerySnapshot? _userDoc;


  Future<String> convertDataToCSV() async {
    final List<List<dynamic>> csvData = [];
    final List<dynamic> headers = [
      "Name", "Age", "other Details",
    ];

    csvData.add(headers);

    const String csvString = "";
    return csvString;
  }

  Future<void> downloadCSV() async {

  }

  Future<void> getTotalSubmissions() async {
    final QuerySnapshot querySnapshot =
    await _firestore.collection('users').get();

    for (var doc in querySnapshot.docs) {
      debugPrint("${doc.id}");
    }
    _totalSubmissionsCount = querySnapshot.docs.length.obs;
    _isTotalSubmissionLoaded = true.obs;
    update();
    debugPrint("${querySnapshot.docs.length}");
    //debugPrint("${_isTotalSubmissionLoaded}");
  }

  Future<void> getUserByEmail() async {
    _userSearchIsLoading.value = true;
    update();
    final searchedEmail = userSearchBar.text;
    debugPrint(searchedEmail);
    try {
      final QuerySnapshot querySnapshot = await _firestore.collection('users')
          .where('user_info.email', isEqualTo: searchedEmail)
          .get();

      if (querySnapshot == null) {
        querySnapshot.printError();
        debugPrint('userEmailQuery is null or undefined');
        _isUserSearchFound.value = false;
      }
      else if (querySnapshot.docs.isNotEmpty) {
        debugPrint(
            "${querySnapshot.docs.last['user_info']['name']} ${querySnapshot
                .docs.last['user_info']['email']} ${querySnapshot.docs
                .last['user_info']['totalScore']}");
        _searchedUserName.value =
        (querySnapshot.docs.last['user_info']['name'] as String);
        _searchedUserEmail.value =
        (querySnapshot.docs.last['user_info']['email'] as String);
        _searchedUserTotalScore.value =
        (querySnapshot.docs.last['user_info']['totalScore'] as int);
        _isUserSearchFound.value = true;
        _userDoc = querySnapshot;
      }
    } finally {
      _userSearchIsLoading.value = false;
    }

    update();
  }

  Future<void> downloadSearchedUserCsv() async {
    if (_userDoc == null) {
      debugPrint("_UserDoc is undefined. Search a user first!");
      return;
    }
    else {

      //final statusTry = await Permission.manageExternalStorage.request();
      //Permission.storage.request();
      //if (statusTry.isDenied ||  statusTry.isPermanentlyDenied ||  statusTry.isRestricted) {  throw "Please allow storage permission to upload files";  }
      /*var status = await Permission.manageExternalStorage.request();
*/
      Map<Permission, PermissionStatus> status = await [
        Permission.storage,
        Permission.manageExternalStorage,
      ].request();

      //final permStatus = await Permission.storage.status;

      if (status[Permission.storage]!.isDenied) {
        Permission.storage.request();
        debugPrint('Storage Permission denied');
        //openAppSettings();
      }
      if(status[Permission.storage]!.isPermanentlyDenied) {
        debugPrint('Storage Permission permanently denied');

        openAppSettings();
      }
      else if(status[Permission.storage]!.isGranted){

      List<List<dynamic>> rows = [];
      List<dynamic> row = [];
      row.add ("user_info.name");
      row.add("user_info.email");
      row.add("user_info.totalScore");
      row.add("socio_demographic.age");
      row.add("socio_demographic.education");
      row.add("socio_demographic.gender");
      row.add("socio_demographic.profession");
      row.add("socio_demographic.residence");
      row.add("medical_history.diet");
      row.add("medical_history.medicalCondition");
      row.add("medical_history.physicalActivity");
      row.add("medical_history.smoke");
      row.add("covid_experience.covid");
      row.add("covid_experience.duration");
      row.add("covid_experience.first4weeks");
      row.add("covid_experience.pcrTest");
      row.add("covid_experience.pcrTestDetails");
      row.add("covid_experience.results");
      row.add("covid_experience.week4Experience");

      rows.add(row);

      List<dynamic> userData = [];

      for (String key in row) {
        userData.add(_userDoc?.docs.last[key]);
      }
      rows.add(userData);
      String csvData = const ListToCsvConverter().convert(rows);
      String? dir = (await getApplicationDocumentsDirectory()).path;
      if (dir != null) {
        final filePath = '$dir/MOCA_${_userDoc?.docs
            .last["user_info.email"]}.csv';
        debugPrint(filePath);
        // await CRFileSaver.requestWriteExternalStoragePermission();
        File file = File(filePath);
        await (await file.writeAsString(csvData)).open();
        await file.open();

      }
    }
  }}
}