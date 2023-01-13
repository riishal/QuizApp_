// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_/view/Homepage.dart';
import 'package:quiz_app_/controller/providerpage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionProvider>(
      create: (context) => QuestionProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
