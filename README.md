# Cognitive Assessment App

This Flutter app is designed to conduct cognitive assessments and collect user data, leveraging GetX state management and Firebase Firestore as the backend.

## Features

- Admin Panel: A web-based admin panel to view and analyze the collected data.
- MOCA Test: Conduct the Montreal Cognitive Assessment (MOCA) test to evaluate cognitive abilities.
- Socio-Demographic Data: Collect socio-demographic information such as name, gender, age, residence, education, and profession.
- Medical History: Capture details about existing medical conditions or chronic illnesses.
- COVID-19 Experience: Gather information about the user's COVID-19 experience, including symptoms, PCR test results, and severity.
- Cognitive Failures Questionnaire: Assess minor cognitive lapses and mistakes using a comprehensive questionnaire.
- Data Submission: Securely submit collected data to Firebase Firestore for storage and analysis.

## Requirements

- Flutter 
- GetX 
- Firebase Firestore 

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ahmaddioxide/moca.git

2. Change to the project directory:

   ```bash
   cd moca
   
3. Install the dependencies:

   ```bash
    flutter pub get
4. Run the app:

   ```bash
   flutter run
   ```
5. Configure Firebase Firestore:itn

- Create a Firebase project at Firebase Console.
- Enable Firestore as the backend database for your project.
- Download the google-services.json file and place it in the android/app directory of your project.

## Configuration
To connect your app to your Firebase project, update the Firebase configuration in the lib/main.dart file:
    
    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(MyApp());
    }


