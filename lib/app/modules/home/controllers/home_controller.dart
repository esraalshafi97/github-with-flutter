import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:testcipher/app/data/models/git_repo.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var isLoaded=false.obs;
  var isSarching=false.obs;
  TextEditingController searchTextController=TextEditingController();

  List<GitRepo>? repoList;
  // List<GitRepo> searchrepoList = [].obs ;
  List<GitRepo> searchrepoList = List<GitRepo>.empty(growable : true).obs;

  // RxList<GitRepo> searchrepoList = (List<GitRepo>.of([])).obs;

  @override
  void onInit()  {
    super.onInit();

    getrepodata().then((value) {
      repoList=value;
      isLoaded.value=true;
      update();

    });
  }
  Future<List<GitRepo>> getrepodata()async{
    SharedPreferences _pref= await SharedPreferences.getInstance();
    String? githubtoken=_pref.getString("githubtoken");
    var result=await Dio().get("https://api.github.com/user/starred",
        options: Options(headers: {"Authorization": "token "+githubtoken!}),
      );
    if(result.statusCode==200){
      var listOfData= result.data as List;
      List<GitRepo>? res= listOfData.map<GitRepo>(
            (json) => GitRepo.fromJson(json),
      )
          .toList() ;
      repoList=res;
      return res;
    }
    return [];


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  onSearchTextChanged(String text) async {
    searchrepoList.clear();
    update();
    if (text.isEmpty) {
      return;
    }

    repoList!.forEach((repo) {
      if (repo.name !.contains(text) || repo.fullname!.contains(text)){
        searchrepoList.add(repo);

      }else{
        searchrepoList=[];
      }
      update();


    });


  }
}
