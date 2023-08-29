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

  final Map<String, String> headers = {
  /* User Info Headers */
    "Name" : "user_info.name" ,
    "Email" : "user_info.email",
    "Total Score" : "user_info.totalScore",

  /* Social Demographic Headers */
    "Age" : "socio_demographic.age",
    "Education" : "socio_demographic.education",
    "Gender" : "socio_demographic.gender",
    "Profession" : "socio_demographic.profession",
    "Residence" : "socio_demographic.residence" ,

  /* Medical History Headers */
    "Diet" : "medical_history.diet",
    "Medical Condition" : "medical_history.medicalCondition",
    "Physical Activity" : "medical_history.physicalActivity",
    "Does Smoke" : "medical_history.smoke",

  /* Covid Experience Headers */
    "covid_experience.covid" : "Has Had Covid 19",
    "covid_experience.duration" : "Time Since Diagnosis",
    "covid_experience.first4weeks" : "Covid Experience in First 4 Weeks",
    "covid_experience.pcrTest" : "Took PCR Test",
    "covid_experience.results" : "PCR Test Result",
    "covid_experience.pcrTestDetails" : "Did Not Take PCR - How Person Knew They Had Covid-19",
    "covid_experience.week4Experience" : "Covid Experience After First 4 Weeks",

  /* Initial Illness Symptom */
   "First 4 Weeks Symptom: Abdominal Pain" : "symptoms_initial_illness.abdominalPain",
   "First 4 Weeks Symptom: Blurred Vision" : "symptoms_initial_illness.blurredVision",
   "First 4 Weeks Symptom: Body Pain" : "symptoms_initial_illness.bodyPain",
   "First 4 Weeks Symptom: Breathing Issues" : "symptoms_initial_illness.breathingIssues" ,
   "First 4 Weeks Symptom: Chest Pain" : "symptoms_initial_illness.chestPain",
   "First 4 Weeks Symptom: Confusion" : "symptoms_initial_illness.confusion",
   "First 4 Weeks Symptom: Cough" : "symptoms_initial_illness.cough",
   "First 4 Weeks Symptom: Depression Anxiety" : "symptoms_initial_illness.depressionAnxiety",
   "First 4 Weeks Symptom: Diarrhea" : "symptoms_initial_illness.diarrhea",
   "First 4 Weeks Symptom: Difficult Sleeping" : "symptoms_initial_illness.difficultSleepy",
   "First 4 Weeks Symptom: Fatigue" : "symptoms_initial_illness.fatigue",
   "First 4 Weeks Symptom: Fever" : "symptoms_initial_illness.fever",
   "First 4 Weeks Symptom: Hallucinations" : "symptoms_initial_illness.hallucinations",
   "First 4 Weeks Symptom: HeadAche" : "symptoms_initial_illness.headAches",
   "First 4 Weeks Symptom: Hot Flashes" : "symptoms_initial_illness.hotFlashes",
   "First 4 Weeks Symptom: Irregular Pulse" : "symptoms_initial_illness.irregularPulse",
   "First 4 Weeks Symptom: Itchy/Red/Dry Eyes" : "symptoms_initial_illness.itchyRedDryEyes",
   "First 4 Weeks Symptom: First 4 Weeks Symptom: Loss of Appetite" : "symptoms_initial_illness.lossOfAppetite",
   "First 4 Weeks Symptom: Loss of Smell and/or Taste" : "symptoms_initial_illness.lossOfSmelltaste",
   "First 4 Weeks Symptom: Nausea" : "symptoms_initial_illness.nausea",
   "First 4 Weeks Symptom: Numbness" : "symptoms_initial_illness.numbness",
   "First 4 Weeks Symptom: Rashes" : "symptoms_initial_illness.rash",
   "First 4 Weeks Symptom: Sore Throat" : "symptoms_initial_illness.soreThroat",
   "First 4 Weeks Symptom: Stuffy Nose" : "symptoms_initial_illness.stuffyNose",
   "First 4 Weeks Symptom: Vomiting" : "symptoms_initial_illness.vomiting",

  /* Initial Illness Symptom */
   "After 4 Weeks Symptom: Abdominal Pain" : "symptoms_ongoing_illness.abdominalPain",
   "After 4 Weeks Symptom: Blurred Vision" : "symptoms_ongoing_illness.blurredVision",
   "After 4 Weeks Symptom: Body Pain" : "symptoms_ongoing_illness.bodyPain",
   "After 4 Weeks Symptom: Breathing Issues" : "symptoms_ongoing_illness.breathingIssues",
   "After 4 Weeks Symptom: Chest Pain" : "symptoms_ongoing_illness.chestPain",
   "After 4 Weeks Symptom: Confusion" : "symptoms_ongoing_illness.confusion",
   "After 4 Weeks Symptom: Cough" : "symptoms_ongoing_illness.cough",
   "After 4 Weeks Symptom: Delayed Thinking" : "symptoms_ongoing_illness.delayedThinking",
   "After 4 Weeks Symptom: Depression Anxiety" : "symptoms_ongoing_illness.depressionAnxiety",
   "After 4 Weeks Symptom: Difficulty Sleeping" : "symptoms_ongoing_illness.difficultSleeping",
   "After 4 Weeks Symptom: Difficulty Speaking" : "symptoms_ongoing_illness.difficultSpeaking",
   "After 4 Weeks Symptom: Fatigue" : "symptoms_ongoing_illness.fatigue",
   "After 4 Weeks Symptom: Forgetfulness" : "symptoms_ongoing_illness.forgetfulness",
   "After 4 Weeks Symptom: Hallucinations" : "symptoms_ongoing_illness.hallucinations",
   "After 4 Weeks Symptom: Headache" : "symptoms_ongoing_illness.headAche",
   "After 4 Weeks Symptom: Irregular Pulse" : "symptoms_ongoing_illness.irregularPulse",
   "After 4 Weeks Symptom: Itch/Red/Dry Eyes" : "symptoms_ongoing_illness.itchyRedDryEyes",
   "After 4 Weeks Symptom: Loss Of Appetite" : "symptoms_ongoing_illness.lossOfAppetite",
   "After 4 Weeks Symptom: Loss Of Smell and/or Taste" : "symptoms_ongoing_illness.lossOfSmelltaste",
   "After 4 Weeks Symptom: Nausea" : "symptoms_ongoing_illness.nausea",
   "After 4 Weeks Symptom: Numbness" : "symptoms_ongoing_illness.numbness",
   "After 4 Weeks Symptom: Poor Concentration" : "symptoms_ongoing_illness.poorConcentration",

  /* Survey Results */
  "CFQ - Q#1: Do you read something and find you haven't been thinking about it and must read it again?" : "survey_results.0.rating",
  "CFQ - Q#2: Do you find you forget why you went from one part of the house to the other?" : "survey_results.1.rating",
  "CFQ - Q#3: Do you find you confuse right and left when giving directions?" : "survey_results.2.rating",
  "CFQ - Q#4: Do you bump into people?" : "survey_results.3.rating",
  "CFQ - Q#5: Do you find you forget whether you've turned off a light or a fire or locked the door?" : "survey_results.4.rating",
  "CFQ - Q#6: Do you fail to listen to people's names when you are meeting them?" : "survey_results.5.rating",
  "CFQ - Q#7: Do you say something and realize afterwards that it might be taken as insulting?" : "survey_results.6.rating",
  "CFQ - Q#8: Do you fail to hear people speaking to you when you are doing something else?" : "survey_results.7.rating",
  "CFQ - Q#9: Do you lose your temper and regret it?" : "survey_results.8.rating",
  "CFQ - Q#10: Do you lose your temper and regret it?" : "survey_results.9.rating",
  "CFQ - Q#11: Do you leave important letters unanswered for days?" : "survey_results.10.rating",
  "CFQ - Q#12: Do you find you forget which way to turn on a road you know well but rarely use?" : "survey_results.11.rating",
  "CFQ - Q#13: Do you fail to see what you want in a supermarket (although it's there)?" : "survey_results.12.rating",
  "CFQ - Q#14: Do you find yourself suddenly wondering whether you've used a word correctly?" : "survey_results.13.rating",
  "CFQ - Q#15: Do you have trouble making up your mind?" : "survey_results.14.rating",
  "CFQ - Q#16: Do you find you forget appointments?" : "survey_results.15.rating",
  "CFQ - Q#17: Do you forget where you put something like a newspaper or a book?" : "survey_results.16.rating",
  "CFQ - Q#18: Do you find you accidentally throw away the thing you want and keep what you meant to throw away -- as in the example of throwing away the matchbox and putting the used match in your pocket?" : "survey_results.17.rating",
  "CFQ - Q#19: Do you daydream when you ought to be listening to something?" : "survey_results.18.rating",
  "CFQ - Q#20: Do you find you forget people's names?" : "survey_results.19.rating",
  "CFQ - Q#21: Do you start doing one thing at home and get distracted into doing something else (unintentionally)?" : "survey_results.20.rating",
  "CFQ - Q#22: Do you find you can't quite remember something although it's \"on the tip of your tongue\"?" : "survey_results.21.rating",
  "CFQ - Q#23: Do you find you forget what you came to the shops to buy?" : "survey_results.22.rating",
  "CFQ - Q#24: Do you drop things?" : "survey_results.23.rating",
  "CFQ - Q#25: Do you find you can't think of anything to say?" : "survey_results.24.rating",



  /* Tests */
  "Abstraction Score" : "abstraction_results.taskResults",
  "Alternating Trail Score" : "Viscospatial_test_1.connecting_dot_score",
  "Animal Naming Score" : "animal_name_test.score",
  "Attention Digit Span Score" : "attention_test_1.digit_span_score",
  "Attention Vigilance Score" : "attention_test_2.vigilance_test_score",
  "Attention Serial7s Score" : "attention_test_3.serial7_test_score",
  "Orientation Score" : "date_verification_results.orientation_score",
  "Delayed Recall Score" : "DelayedRecall_test.DelayedRecall_test_score",
  "Visuoconstructional Skill: Cube Drawing Score" : "Viscospatial_test_2.cube_drawing_sccore",
  "Visuoconstructional Skill: Clock Drawing Score" : "visuospatial_draw_clock.score",

};



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

    /**
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

    /* Survey Results */
    row.add("survey_results.0.rating");
    row.add("survey_results.1.rating");
    row.add("survey_results.2.rating");
    row.add("survey_results.3.rating");
    row.add("survey_results.4.rating");
    row.add("survey_results.5.rating");
    row.add("survey_results.6.rating");
    row.add("survey_results.7.rating");
    row.add("survey_results.8.rating");
    row.add("survey_results.9.rating");
    row.add("survey_results.10.rating");
    row.add("survey_results.11.rating");
    row.add("survey_results.12.rating");
    row.add("survey_results.13.rating");
    row.add("survey_results.14.rating");
    row.add("survey_results.15.rating");
    row.add("survey_results.16.rating");
    row.add("survey_results.17.rating");
    row.add("survey_results.18.rating");
    row.add("survey_results.19.rating");
    row.add("survey_results.20.rating");
    row.add("survey_results.21.rating");
    row.add("survey_results.22.rating");
    row.add("survey_results.23.rating");
    row.add("survey_results.24.rating");



    /* Tests */
    row.add("abstraction_results.taskResults");
    row.add("animal_name_test.score");
    row.add("attention_test_1.digit_span_score");
    row.add("attention_test_2.vigilance_test_score");
    row.add("attention_test_3.serial7_test_score");
    row.add("date_verification_results.orientation_score");
    row.add("DelayedRecall_test.DelayedRecall_test_score");
    row.add("Viscospatial_test_1.connecting_dot_score");
    row.add("Viscospatial_test_2.cube_drawing_sccore");
    row.add("visuospatial_draw_clock.score");

*/

    headers.forEach((header, _) {
      row.add(header);
    });

    rows.add(row);

    for(QueryDocumentSnapshot userDoc in querySnapshot.docs) {
      List<dynamic> userData = [];

      for (String key in row) {
        dynamic data = "null";
        try {
          data = userDoc[headers[key]??""];
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
      /*row.add ("user_info.name");
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
      row.add("covid_experience.week4Experience");*/

      headers.forEach((header, _) {
        row.add(header);
      });
      rows.add(row);

      List<dynamic> userData = [];

      for (String key in row) {
        userData.add(_userDoc?.docs.last[headers[key] ?? ""]);
      }

      rows.add(userData);
      String csvData = const ListToCsvConverter().convert(rows);
      String? dir = "/storage/emulated/0/Download/";

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