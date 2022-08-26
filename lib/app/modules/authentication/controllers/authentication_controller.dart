import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcipher/main.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth _auth= auth;
  var isAuthorized=false.obs;
  var isLoaded=false.obs;

  @override
  void onInit() {
    super.onInit();

    IsAuthorized().then((value) {
      isLoaded.value=true;
      isAuthorized.value=value;
      update();
    }) ;
  }

  Future<bool> IsAuthorized() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      return false;
    }


    return true;

  }

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
    }
  }


