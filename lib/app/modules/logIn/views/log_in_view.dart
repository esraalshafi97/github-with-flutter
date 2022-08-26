import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testcipher/app/routes/app_pages.dart';
import 'package:testcipher/app/widgets/sharedWidgets.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogInView'),
        centerTitle: true,
      ),
      body: GetX<LogInController>(
        builder: (_) {
          if(!controller.isLoaded.value){
            return LoadingWidget();
          }
          return Column(
            children: [
              SizedBox(height: Get.height*.2,),
              Image.asset("assets/github.png",width:Get.width*.6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: Get.width*.6,child: Text("Welcom to Repo Viwee",style: TextStyle(fontSize: 26,),textAlign: TextAlign.center,)),
              ),

              Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  child: Container(
                    width: Get.width*.6,
                      child: Center(child: Text("SignIn"))),
                  onPressed: ()async{
                    UserCredential _user= await controller.signInWithGitHub(context);
                    if(_user.user!=null){

                      Get.offAllNamed( Routes.HOME);

                    }

                  },
                ),
              )

        ),
            ],
          );
        }
      ),
    );
  }
}
