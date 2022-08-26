// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:testcipher/app/widgets/sharedWidgets.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../controllers/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     var list=controller.repoList;
//     if(controller.isSarching.value){
//       list=controller.searchrepoList;
//     }
//     return Scaffold(
//         appBar: AppBar(
//           title: Column(
//             children: [
//               Text('Starred Repositories'),
//               GestureDetector(
//                 onTap: () {
//                   controller.isSarching.value=true;
//                   controller.update();
//                 },
//                 child: Row(
//                   children: [
//                     Text('Tap to search'),
//                     Icon( Icons.search,),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           centerTitle: true,
//         ),
//         body: GetX<HomeController>(
//             init: controller,
//             builder: (_) {
//               if(!controller.isLoaded.value){
//                 return LoadingWidget();
//               }
//
//               return Column(
//                 children: [
//                   controller.isSarching.value?Card(
//                     child: new ListTile(
//                       leading: new Icon(Icons.search),
//                       title: new TextField(
//                         controller: controller.searchTextController,
//                         decoration: new InputDecoration(
//                             hintText: 'Search', border: InputBorder.none),
//                         onChanged: controller.onSearchTextChanged,
//                       ),
//                       trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
//                         controller.searchTextController.clear();
//                         controller.onSearchTextChanged('');
//                       },),
//                     ),
//                   ):Container(),
//                   ListView.builder(
//                     itemBuilder: (BuildContext, index){
//
//
//                       return GestureDetector(
//                         onTap: ()=>  Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>  WebView(
//                                   initialUrl: list![index].html_url,
//                                   javascriptMode: JavascriptMode.unrestricted,
//
//                                 ) ))
//                         ,
//                         child: Card(
//                           child: ListTile(
//                             leading: CircleAvatar(backgroundImage: NetworkImage(list![index].owner!.avatarurl!),),
//                             title: Text(list![index].name??""),
//                             subtitle: Text(list![index].fullname??""),
//                             trailing:Icon(Icons.star),
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: list!.length,
//                     shrinkWrap: true,
//                     padding: EdgeInsets.all(5),
//                     scrollDirection: Axis.vertical,
//                   ),
//                 ],
//               );})
//     );
//   }
// }
