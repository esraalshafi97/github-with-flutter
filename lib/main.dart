import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/modules/authentication/controllers/authentication_controller.dart';
import 'app/routes/app_pages.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() {

  initialize();




}
void initialize() {
  //Get.lazyPut(() => AuthenticationController(Get.put(FakeAuthenticationService())),);
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyDN9yh8AHZBdspod0L5mlQ5z148CQAKaMs",messagingSenderId: "644873607711", appId: "1:644873607711:android:780fe5aec0fe88230d132a",  projectId: "test-408ee")).whenComplete(() {
    print("completed");
    runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );

  });
}


