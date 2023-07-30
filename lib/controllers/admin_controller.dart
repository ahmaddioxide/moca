import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_file_saver/file_saver.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AdminController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxInt _totalSubmissionsCount = RxInt(0);
  Rx<int> get totalSubmissionCount => _totalSubmissionsCount;
  RxBool _isTotalSubmissionLoaded = RxBool(false);
  Rx<bool> get isTotalSubmissionLoaded => _isTotalSubmissionLoaded;


  RxInt _averageScore = RxInt(0);
  Rx<int> get averageScore => _averageScore;
  RxBool _isAverageScoreLoaded = RxBool(false);
  Rx<bool> get isAverageScoreLoaded => _isAverageScoreLoaded;

  TextEditingController userSearchBar = TextEditingController();
  RxBool _isUserSearchFound = RxBool(false);

  RxBool get isUserSearchFound => _isUserSearchFound;
  RxBool _userSearchIsLoading = RxBool(false);

  RxBool get userSearchIsLoading => _userSearchIsLoading;
  RxString _searchedUserName = RxString('notFound');

  RxBool _userSearchStarted = RxBool(false);
  Rx<bool> get userSearchStarted => _userSearchStarted;

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
    final QuerySnapshot querySnapshot =
    await _firestore.collection('users').get();

    List<List<dynamic>> rows = [];
    List<dynamic> row = [];

    /* User Info Headers */
    row.add ("user_info.name");
    row.add("user_info.email");
    row.add("user_info.totalScore");

    /* Social Demographic Headers */
    row.add("socio_demographic.age");
    row.add("socio_demographic.education");
    row.add("socio_demographic.gender");
    row.add("socio_demographic.profession");
    row.add("socio_demographic.residence");

    /* Medical History Headers */
    row.add("medical_history.diet");
    row.add("medical_history.medicalCondition");
    row.add("medical_history.physicalActivity");
    row.add("medical_history.smoke");

    /* Covid Experience Headers */
    row.add("covid_experience.covid");
    row.add("covid_experience.duration");
    row.add("covid_experience.first4weeks");
    row.add("covid_experience.pcrTest");
    row.add("covid_experience.pcrTestDetails");
    row.add("covid_experience.results");
    row.add("covid_experience.week4Experience");

    /* Initial Illness Symptom */
    row.add("symptoms_initial_illness.abdominalPain");
    row.add("symptoms_initial_illness.blurredVision");
    row.add("symptoms_initial_illness.bodyPain");
    row.add("symptoms_initial_illness.breathingIssues");
    row.add("symptoms_initial_illness.chestPain");
    row.add("symptoms_initial_illness.confusion");
    row.add("symptoms_initial_illness.cough");
    row.add("symptoms_initial_illness.depressionAnxiety");
    row.add("symptoms_initial_illness.diarrhea");
    row.add("symptoms_initial_illness.difficultSleepy");
    row.add("symptoms_initial_illness.fatigue");
    row.add("symptoms_initial_illness.fever");
    row.add("symptoms_initial_illness.hallucinations");
    row.add("symptoms_initial_illness.headAches");
    row.add("symptoms_initial_illness.hotFlashes");
    row.add("symptoms_initial_illness.irregularPulse");
    row.add("symptoms_initial_illness.itchyRedDryEyes");
    row.add("symptoms_initial_illness.lossOfAppetite");
    row.add("symptoms_initial_illness.lossOfSmelltaste");
    row.add("symptoms_initial_illness.nausea");
    row.add("symptoms_initial_illness.numbness");
    row.add("symptoms_initial_illness.rash");
    row.add("symptoms_initial_illness.soreThroat");
    row.add("symptoms_initial_illness.stuffyNose");
    row.add("symptoms_initial_illness.vomiting");

    /* Initial Illness Symptom */
    row.add("symptoms_ongoing_illness.abdominalPain");
    row.add("symptoms_ongoing_illness.blurredVision");
    row.add("symptoms_ongoing_illness.bodyPain");
    row.add("symptoms_ongoing_illness.breathingIssues");
    row.add("symptoms_ongoing_illness.chestPain");
    row.add("symptoms_ongoing_illness.confusion");
    row.add("symptoms_ongoing_illness.cough");
    row.add("symptoms_ongoing_illness.delayedThinking");
    row.add("symptoms_ongoing_illness.depressionAnxiety");
    row.add("symptoms_ongoing_illness.difficultSleeping");
    row.add("symptoms_ongoing_illness.difficultSpeaking");
    row.add("symptoms_ongoing_illness.fatigue");
    row.add("symptoms_ongoing_illness.forgetfulness");
    row.add("symptoms_ongoing_illness.hallucinations");
    row.add("symptoms_ongoing_illness.headAche");
    row.add("symptoms_ongoing_illness.irregularPulse");
    row.add("symptoms_ongoing_illness.itchyRedDryEyes");
    row.add("symptoms_ongoing_illness.lossOfAppetite");
    row.add("symptoms_ongoing_illness.lossOfSmelltaste");
    row.add("symptoms_ongoing_illness.nausea");
    row.add("symptoms_ongoing_illness.numbness");
    row.add("symptoms_ongoing_illness.poorConcentration");

    rows.add(row);

    for(QueryDocumentSnapshot userDoc in querySnapshot.docs) {
      List<dynamic> userData = [];

      for (String key in row) {
        dynamic data = "null";
        try {
          data = userDoc[key];
        } catch (e) {
          data = "null";
        }
        userData.add(data);
      }
      rows.add(userData);
    }

    String csvData = const ListToCsvConverter().convert(rows);
    String? dir = "/storage/emulated/0/Download/";//(await getExternalStorageDirectory())?.path;

    final filePath = '$dir/MOCA_Users_Data.csv';

    File file = File(filePath);
    await file.writeAsString(csvData).whenComplete(() {
      debugPrint('dir $dir');
      Fluttertoast.showToast(msg: "file saved at: $filePath");
    });
  }

  Future<void> getAverageScore() async {
    final QuerySnapshot querySnapshot =
    await _firestore.collection('users').get();
    num sumOfScores = 0;
    int numOfValidUsers = 0;

    for(QueryDocumentSnapshot userDoc in querySnapshot.docs) {
      try {
        sumOfScores += userDoc["user_info.totalScore"];
        numOfValidUsers++;
      } catch (e) {
        debugPrint("Invalid User does not have total Score: id = ${userDoc.id}\nError: $e");
      }
    }
    _averageScore = (sumOfScores/numOfValidUsers).round().obs;
    _isAverageScoreLoaded = true.obs;

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
    _userSearchStarted.value = true;
    update();
    final searchedEmail = userSearchBar.text;
    debugPrint(searchedEmail);
    try {
      final QuerySnapshot querySnapshot = await _firestore.collection('users')
          .where('user_info.email', isEqualTo: searchedEmail)
          .get();


      if (querySnapshot.docs.isNotEmpty) {
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
        Permission.manageExternalStorage,
      ].request();

      //final permStatus = await Permission.storage.status;

      if (status[Permission.manageExternalStorage]!.isDenied) {
        await CRFileSaver.requestWriteExternalStoragePermission();
        debugPrint('Storage Permission denied');

      }
      if(status[Permission.manageExternalStorage]!.isPermanentlyDenied) {
        debugPrint('Storage Permission permanently denied');
        openAppSettings();
      }
      //else if(status[Permission.storage]!.isGranted){

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
      String? dir = "/storage/emulated/0/Download/";//(await getExternalStorageDirectory())?.path;

      final filePath = '$dir/MOCA_${_userDoc?.docs
          .last["user_info.email"]}.csv';

      File file = File(filePath);
      await file.writeAsString(csvData).whenComplete(() {
        debugPrint('dir $dir');
        Fluttertoast.showToast(msg: "file saved at: $dir");
      });
    //}
  }}
}