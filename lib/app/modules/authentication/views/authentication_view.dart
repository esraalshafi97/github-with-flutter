import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testcipher/app/routes/app_pages.dart';
import 'package:testcipher/app/widgets/sharedWidgets.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){

// if loaded and authorized
      if ( controller.isAuthorized.value) {

      Get.offAllNamed(Routes.HOME);

    } // if loaded and not authorized
      else if(controller.isLoaded.value) {
      Get.offAllNamed(Routes.LOG_IN);

    }});
    return Scaffold(
      body: GetX<AuthenticationController>(
        init: controller,
        builder: (_) {
          if(controller.isLoaded.value){
            return LoadingWidget();
          }

          return Center( );
        },
      ),
    );
  }
}
