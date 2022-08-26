import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/secret_keys.dart' as SecretKey;

class LogInController extends GetxController {

  //TODO: Implement LogInController
  var isLoaded=true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<UserCredential> signInWithGitHub(context) async {
    isLoaded.value=false;
    update();
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: SecretKey.GITHUB_CLIENT_ID,
        clientSecret: SecretKey.GITHUB_CLIENT_SECRET,
        allowSignUp: true,
        clearCache: true,
        redirectUrl: 'https://test-408ee.firebaseapp.com/__/auth/handler');

    // Trigger the sign-in flow

    final result = await   gitHubSignIn.signIn(context);
    String credentials = result.token!;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);


    // Create a credential from the access token
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);
    print("token"+result.token!);
    // Once signed in, return the UserCredential
    var user= await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
    SharedPreferences _pref= await SharedPreferences.getInstance();
    _pref.setString("githubtoken", result.token!);


    return user;
  }
}
