import 'package:flutter/material.dart';

Widget LoadingWidget(){
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}